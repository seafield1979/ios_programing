//
//  MyDataManager.m
//  UNCoreData
//
//  Created by B02681 on 2015/07/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//
/*
 CoreDataを使用してDBを操作するサンプル
 ・データの追加
 ・データの削除
 ・データの更新
 ・データの参照
 */

#import "MyDataManager.h"

@implementation MyDataManager

#define EntityNamePerson @"Person"
#define AttributeName @"name"
#define AttributeAge @"age"
#define AttributeAddress @"address"

#define LOAD_MAX_AT_ONCE   5

#pragma mark - Core Data

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (MyDataManager*)sharedManager
{
    static MyDataManager * _sharedManager;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ _sharedManager = [[MyDataManager alloc] init]; });
    
    return _sharedManager;
}


- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"UNCoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"UNCoreData.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Private method



/*
 * 指定の条件に一致するデータを取得する
 * @param name 検索条件の名前
 */
- (NSFetchedResultsController*)fetchObject:(NSString*)name
{
    // NSFetchRequestは、検索条件などを保持させるオブジェクトです。
    // 後続処理では、このインスタンスに色々と検索条件を設定します。
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // 検索対象のエンティティを指定します。
    NSEntityDescription *entity
    = [NSEntityDescription entityForName:EntityNamePerson inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // 一度に読み込むサイズを指定します。
    [fetchRequest setFetchBatchSize:LOAD_MAX_AT_ONCE];
    
    // 検索結果を保持する順序を指定します。
    // ここでは、keyというカラムの値の昇順で保持するように指定しています。
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:AttributeName ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    // 続いて検索条件を指定します。
    // NSPredicateを用いて、検索条件の表現（述語）を作成します。
    if (name) {
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"name = %@", name];
        [fetchRequest setPredicate:pred];
    }
    
    // NSFetchedResultsControllerを作成します。
    // 上記までで作成したFetchRequestを指定します。
    NSFetchedResultsController *fetchedResultsController
    = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                          managedObjectContext:self.managedObjectContext
                                            sectionNameKeyPath:nil
                                                     cacheName:nil];
    
    // データ検索を行います。
    // 失敗した場合には、メソッドはfalseを返し、引数errorに値を詰めてくれます。
    NSError *error = nil;
    if (![fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    return fetchedResultsController;
}

#pragma mark - Public method

/**
 * DBにデータを追加する
 * @param name
 * @param age
 */
- (void)addObject:(NSString*)name age:(NSInteger)age;
{
    // context は NSManagedObjectContext クラスのインスタンス
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:EntityNamePerson
                                                            inManagedObjectContext:self.managedObjectContext];
    
    // 作成したNSManagedObjectインスタンスに値を設定します。
    [object setValue:@(age)  forKey:AttributeAge];
    [object setValue:name forKey:AttributeName];
    [object setValue:@"" forKey:AttributeAddress];
    [self saveContext];
}


/**
 * DBからデータを削除する
 * @param name
 * @param age
 */
- (void)deleteObject:(NSString*)name age:(NSInteger)age
{
    // NSFetchedResultsControllerを作成します。
    // 上記までで作成したFetchRequestを指定します。
    NSFetchedResultsController *fetchedResultsController = [self fetchObject:name];
    
    // まずは、NSManagedObjectを取得します。
    // 以下の例では、DB検索結果から取得しています。
    for (int i=0; i < fetchedResultsController.fetchedObjects.count; i++) {
        NSManagedObject *object = [fetchedResultsController.fetchedObjects objectAtIndex:i];
        
        // 削除メソッドを呼び出します。
        [self.managedObjectContext deleteObject:object];
    }
    
    // saveメソッドで更新状態を確定させます。
    // エラー発生時には、引数に参照渡しで渡しているErrorオブジェクトの中身を表示します。
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"error = %@", error);
        
    } else {
        NSLog(@"Insert Completed.");
    }
}

/**
 * 全データを削除する
 * ※検索条件を指定しないで削除するデータを検索しているので全件ヒットする
 */
- (void)deleteAllObject
{
    [self deleteObject:nil age:0];
}


/**
 * DBのデータを更新する
 * @param oldName  更新元の名前
 * @param newName  更新毎の名前
 * @param age 更新後の年齢
 */
- (void)updateObject:(NSString*)oldName newName:(NSString*)newName age:(NSInteger)age
{
    // NSFetchedResultsControllerを作成します。
    // 上記までで作成したFetchRequestを指定します。
    NSFetchedResultsController *fetchedResultsController = [self fetchObject:oldName];
    
    // まずは、NSManagedObjectを取得します。
    // 以下の例では、DB検索結果から取得しています。
    for (int i = 0; i < fetchedResultsController.fetchedObjects.count; i++) {
        NSManagedObject *updObject = [fetchedResultsController.fetchedObjects objectAtIndex:i];
        // 変更したい値を設定します。
        [updObject setValue:newName   forKey:AttributeName];
        
        // saveメソッドでデータをDBに保存します。
        // エラー発生時には、引数に参照渡しで渡しているErrorオブジェクトの中身を表示します。
        NSError *error = nil;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"error = %@", error);
            
        } else {
            NSLog(@"Insert Completed.");
        }
    }
}


/**
 * データを全件取得する
 */
- (NSArray*)getObjects
{
    // NSFetchedResultsControllerを作成します。
    // 上記までで作成したFetchRequestを指定します。
    NSFetchedResultsController *fetchedResultsController = [self fetchObject:nil];
    
    // データ検索を行います。
    // 失敗した場合には、メソッドはfalseを返し、引数errorに値を詰めてくれます。
    NSError *error = nil;
    if (![fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    NSArray *moArray = [fetchedResultsController fetchedObjects];
    
    return moArray;
}


@end

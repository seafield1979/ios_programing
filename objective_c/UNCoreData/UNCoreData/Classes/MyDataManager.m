//
//  MyDataManager.m
//  UNCoreData
//
//  Created by B02681 on 2015/07/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import "MyDataManager.h"

@implementation MyDataManager

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
    // The directory the application uses to store the Core Data store file. This code uses a directory named "test.UNCoreData" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"UNCoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
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

- (NSFetchedResultsController*)fetchObject:(NSString*)name
{
    // NSFetchRequestは、検索条件などを保持させるオブジェクトです。
    // 後続処理では、このインスタンスに色々と検索条件を設定します。
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // 検索対象のエンティティを指定します。
    NSEntityDescription *entity
    = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // 一度に読み込むサイズを指定します。
    [fetchRequest setFetchBatchSize:5];
    
    // 検索結果を保持する順序を指定します。
    // ここでは、keyというカラムの値の昇順で保持するように指定しています。
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
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

- (void)addObject:(NSString*)name age:(NSInteger)age;
{
    
    // context は NSManagedObjectContext クラスのインスタンス
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Person"
                                                            inManagedObjectContext:self.managedObjectContext];
    
    // 作成したNSManagedObjectインスタンスに値を設定します。
    [object setValue:@(age)  forKey:@"age"];
    [object setValue:name forKey:@"name"];
    [object setValue:@"" forKey:@"address"];
    [self saveContext];
}

- (void)deleteObject:(NSString*)name age:(NSInteger)age
{
}

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
        [updObject setValue:newName   forKey:@"name"];
        
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

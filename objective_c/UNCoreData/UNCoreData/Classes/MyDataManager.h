//
//  MyDataManager.h
//  UNCoreData
//
//  Created by B02681 on 2015/07/21.
//  Copyright (c) 2015年 B02681. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface MyDataManager : NSObject

+ (MyDataManager*)sharedManager;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)addObject:(NSString*)name age:(NSInteger)age;;
- (void)deleteObject:(NSString*)name age:(NSInteger)age;
- (void)deleteAllObject;
- (NSArray*)getObjects;
- (void)updateObject:(NSString*)oldName newName:(NSString*)newName age:(NSInteger)age;
@end

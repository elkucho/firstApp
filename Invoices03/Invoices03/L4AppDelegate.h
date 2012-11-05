//
//  L4AppDelegate.h
//  Invoices03
//
//  Created by Marco Lima on 2012-11-03.
//  Copyright (c) 2012 LIM4 Consulting Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface L4AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

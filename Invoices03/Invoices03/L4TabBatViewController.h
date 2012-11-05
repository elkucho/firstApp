//
//  L4TabBatViewController.h
//  Invoices03
//
//  Created by Marco Lima on 2012-11-03.
//  Copyright (c) 2012 LIM4 Consulting Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "L4AppDelegate.h"


@interface L4TabBatViewController : UITabBarController
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

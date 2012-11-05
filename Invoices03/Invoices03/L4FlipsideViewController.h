//
//  L4FlipsideViewController.h
//  Invoices03
//
//  Created by Marco Lima on 2012-11-03.
//  Copyright (c) 2012 LIM4 Consulting Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "L4AppDelegate.h"


@class L4FlipsideViewController;

@protocol L4FlipsideViewControllerDelegate

- (void)flipsideViewControllerDidFinish:(L4FlipsideViewController *)controller;
@end

@interface L4FlipsideViewController : UIViewController
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) id <L4FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end

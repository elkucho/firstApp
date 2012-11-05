//
//  L4MainViewController.h
//  Invoices03
//
//  Created by Marco Lima on 2012-11-03.
//  Copyright (c) 2012 LIM4 Consulting Inc. All rights reserved.
//

#import "L4FlipsideViewController.h"
#import <CoreData/CoreData.h>
#import "L4AppDelegate.h"

@interface L4MainViewController : UIViewController <L4FlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
- (IBAction)populateDB:(UIButton *)sender;
- (IBAction)loadTableView:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITableView *projectsView;
@property (strong, nonatomic) IBOutlet UILabel *resultsLabel;

@end

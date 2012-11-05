//
//  L4CustomersViewController.m
//  Invoices03
//
//  Created by Marco Lima on 2012-11-04.
//  Copyright (c) 2012 LIM4 Consulting Inc. All rights reserved.
//

#import "L4CustomersViewController.h"
#import "L4AppDelegate.h"


@interface L4CustomersViewController ()

@end

@implementation L4CustomersViewController
//@synthesize managedObjectContext = __managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"Managed Object A : %@ " , self.managedObjectContext);

}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"Managed Object A.1: %@ " , self.managedObjectContext);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

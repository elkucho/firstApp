//
//  L4TabBatViewController.m
//  Invoices03
//
//  Created by Marco Lima on 2012-11-03.
//  Copyright (c) 2012 LIM4 Consulting Inc. All rights reserved.
//

#import "L4TabBatViewController.h"
#import "L4AppDelegate.h"

@interface L4TabBatViewController ()

@end

@implementation L4TabBatViewController
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
    NSLog(@"Managed Object C : %@ " , self.managedObjectContext);
    

	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

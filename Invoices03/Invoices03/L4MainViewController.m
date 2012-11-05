//
//  L4MainViewController.m
//  Invoices03
//
//  Created by Marco Lima on 2012-11-03.
//  Copyright (c) 2012 LIM4 Consulting Inc. All rights reserved.
//

#import "L4MainViewController.h"
#import "Projects.h"
#import "L4AppDelegate.h"



@interface L4MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *projectsArray;
//@property (strong, nonatomic) NSManagedObjectContext *context;


@end

@implementation L4MainViewController

@synthesize managedObjectContext = _managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Managed Object 01 : %@ " , self.managedObjectContext);

  //  self.context = self.managedObjectContext;
  //  NSLog(@"Managed Object : %@ " , self.context);
    
    //NSManagedObjectContext *context = [self managedObjectContext];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"Managed Object 02 : %@ " , self.managedObjectContext);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(L4FlipsideViewController *)controller
{
    [self.flipsidePopoverController dismissPopoverAnimated:YES];
    self.flipsidePopoverController = nil;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
        self.flipsidePopoverController = popoverController;
        popoverController.delegate = self;
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

- (IBAction)populateDB:(UIButton *)sender {
    
    //NSEntityDescription *entity = [NSEntityDescription entityForName:@"Projects" inManagedObjectContext:context];
    
    
    NSEntityDescription *projEntity = [NSEntityDescription entityForName:@"Projects"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    Projects *tempProj = [[Projects alloc] initWithEntity:projEntity
                     insertIntoManagedObjectContext:self.managedObjectContext];
    
    tempProj.projDescription = @"First Project";
    tempProj.projStatus = @"Active";
    
    
    [self.managedObjectContext save:nil];
}



- (IBAction)loadTableView:(UIButton *)sender {
    //
    //NSManagedObjectContext *context = [self managedObjectContext];

    
    self.managedObjectContext = [self managedObjectContext];

    NSEntityDescription *projectsEntity = [NSEntityDescription entityForName:@"Projects"
                                                  inManagedObjectContext:self.managedObjectContext];
    
    // In order to redirect the sarch to be by artist or
    
    /* A Fetch Request describes what we're looking for.
     The more specific you are, the more narrow your search results.
     Eventually becomes the SQLite3 WHERE ... ORDERBY ... */
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = projectsEntity;   // REQUIRED that you specify the entity
    
    /* BEGIN of SEARCH feature */
///    if (self.searchField.text.length > 0) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"projDescription \
                                        CONTAINS[cd] %@", @"First"] ; //]self.searchField.text];
        fetchRequest.predicate = searchPredicate;
   // }
    /* END of SEARCH feature */
    
    /* Sorting */
    NSSortDescriptor *descriptionSort = [NSSortDescriptor sortDescriptorWithKey:@"projDescription"
                                                                ascending:YES];
    fetchRequest.sortDescriptors = @[descriptionSort]; // it's an array of sort descriptors
    
    
    
    self.projectsArray = [self.managedObjectContext executeFetchRequest:fetchRequest
                                                                 error:nil];
    
    /* Update the UI */
//    self.resultsLabel.text = [NSString stringWithFormat:@"%@ items found", @(self.contentArray.count)];
  //  [self.searchField resignFirstResponder];
    [self.projectsView reloadData];
    
    self.resultsLabel.text = [NSString stringWithFormat:@"%@ items found", @(self.projectsArray.count)];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Course selected row %i", indexPath.row);
    NSLog(@"Which is the %@ ", self.projectsArray[indexPath.row]);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.projectsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Projects *projects = self.projectsArray[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PROJCELL" forIndexPath:indexPath];
    cell.textLabel.text = projects.projDescription;
    cell.detailTextLabel.text = projects.projStatus;
    
    
    return cell;
}
@end

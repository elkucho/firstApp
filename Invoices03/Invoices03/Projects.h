//
//  Projects.h
//  Invoices03
//
//  Created by Marco Lima on 2012-11-03.
//  Copyright (c) 2012 LIM4 Consulting Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Projects : NSManagedObject

@property (nonatomic, retain) NSString * projDescription;
@property (nonatomic, retain) NSString * projStatus;

@end

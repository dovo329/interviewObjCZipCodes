//
//  DetailViewController.h
//  ZipCodeObjC
//
//  Created by Douglas Voss on 7/7/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) IBOutlet City *city;

@end

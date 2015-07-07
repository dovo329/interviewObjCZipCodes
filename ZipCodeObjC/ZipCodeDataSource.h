//
//  ZipCodeDataSource.h
//  ZipCodeObjC
//
//  Created by Douglas Voss on 7/6/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZipCodeDataSource : NSObject

//+ (instancetype) sharedInstance;
@property (nonatomic, strong) NSArray *cityArr;

@end

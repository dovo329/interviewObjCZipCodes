//
//  City.h
//  ZipCodeObjC
//
//  Created by Douglas Voss on 7/6/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface City : NSObject

//[{ "city" : "AGAWAM", "loc" : [ -72.622739, 42.070206 ], "pop" : 15338, "state" : "MA", "id" : "01001" },
@property (nonatomic, strong) NSString *city;
@property (nonatomic, assign) CLLocationCoordinate2D coord;
@property (nonatomic, assign) int population;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zipCode;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

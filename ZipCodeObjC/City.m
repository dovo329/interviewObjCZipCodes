//
//  City.m
//  ZipCodeObjC
//
//  Created by Douglas Voss on 7/6/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import "City.h"

@implementation City

//[{ "city" : "AGAWAM", "loc" : [ -72.622739, 42.070206 ], "pop" : 15338, "state" : "MA", "id" : "01001" },

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.city = dict[@"city"];
        double latitude = [dict[@"loc"][0] doubleValue];
        double longitude = [dict[@"loc"][1] doubleValue];
        self.coord = CLLocationCoordinate2DMake(latitude, longitude);
        self.population = [dict[@"pop"] integerValue];
        self.state = dict[@"state"];
        self.zipCode = dict[@"id"];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"city=%@\n", self.city];
}

@end

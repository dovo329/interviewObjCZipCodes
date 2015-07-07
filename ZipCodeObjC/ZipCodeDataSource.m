//
//  ZipCodeDataSource.m
//  ZipCodeObjC
//
//  Created by Douglas Voss on 7/6/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import "ZipCodeDataSource.h"
#import "City.h"

#define kZipCellId @"zip.code.cell.id"

@interface ZipCodeDataSource() <UITableViewDataSource>

@end

@implementation ZipCodeDataSource

/*- (instancetype) init
{
    self = [super init];
    if (self) {
        [ZipCodeDataSource sharedInstance];
    }
    return self;
}*/

- (instancetype) init
{
    if (self = [super init])
    {
        [self loadJSONFile];
    }
    return self;
}

/*+ (instancetype) sharedInstance
{
    static ZipCodeDataSource *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ZipCodeDataSource alloc] init];
        //sharedInstance.cityArr = [sharedInstance loadJSONFile];
        [sharedInstance loadJSONFile];
    });
    return sharedInstance;
}*/

/*- (NSArray *)cityArr
{
    return [[ZipCodeDataSource sharedInstance] cityArr];
}*/

//- (NSArray *) loadJSONFile
- (void) loadJSONFile
{
    //NSURL *path = [NSBundle URLForResource:@"zips" withExtension:@".json" subdirectory:nil inBundleWithURL:nil];
    
    NSError *deserializingError;
    NSBundle *bundle = [NSBundle mainBundle];
    //NSURL *localFileURL = [NSURL fileURLWithPath:@"zips.json"];
    NSURL *localFileURL = [bundle URLForResource:@"zips" withExtension:@"json"];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
    NSArray *dictArr =
    [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
        options:0
          error:&deserializingError];
    
    NSMutableArray *cityArr = [NSMutableArray new];
    for (NSDictionary *dict in dictArr)
    {
        City *city = [[City alloc] initWithDictionary:dict];
        [cityArr addObject:city];
    }
    self.cityArr = cityArr;
    //return cityArr;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kZipCellId];
    if (cell==nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kZipCellId];
    }
    City *city = self.cityArr[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", city.zipCode];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cityArr count];
}

@end

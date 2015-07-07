//
//  DetailViewController.m
//  ZipCodeObjC
//
//  Created by Douglas Voss on 7/7/15.
//  Copyright (c) 2015 dougsapps. All rights reserved.
//

#import "DetailViewController.h"

static NSString *const kCellId = @"detail.cell.reuse.id";

@interface DetailViewController () <UITableViewDataSource>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSLog(@"got city %@", self.city);
    /*self.cityLabel.text = self.city.city;
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f",self.city.coord.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f",self.city.coord.longitude];
    self.populationLabel.text = [NSString stringWithFormat:@"%ld",(long)self.city.population];
    self.stateLabel.text = self.city.state;
    self.zipCodeLabel.text = self.city.zipCode;*/

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId forIndexPath:indexPath];
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = self.city.city;
            cell.detailTextLabel.text = @"City";
            break;
        case 1:
            cell.textLabel.text = [NSString stringWithFormat:@"%f",self.city.coord.latitude];
            cell.detailTextLabel.text = @"Latitude";
            break;
        case 2:
            cell.textLabel.text = [NSString stringWithFormat:@"%f",self.city.coord.longitude];
            cell.detailTextLabel.text = @"Longitude";
            break;
        case 3:
            cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)self.city.population];
            cell.detailTextLabel.text = @"Population";
            break;
        case 4:
            cell.textLabel.text = self.city.state;
            cell.detailTextLabel.text = @"State";
            break;
        case 5:
            cell.textLabel.text = self.city.zipCode;
            cell.detailTextLabel.text = @"Zip Code";
            break;
        default:
            cell.textLabel.text = @"";
            cell.detailTextLabel.text = @"";
            break;

    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

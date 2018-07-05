//
//  MGDRoversTableViewController.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDRover.h"
#import "MGDMarsRoverClient.h"
#import "MGDRoverController.h"
#import "MGDRoversTableViewController.h"



@interface MGDRoversTableViewController ()

@end

@implementation MGDRoversTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MGDMarsRoverClient fetchAllMarsRoversWithCompletion:^(NSArray<MGDRover *> *rovers, NSError *error) {
        self.rovers = [NSMutableArray arrayWithArray:rovers];
        for (MGDRover *rover in self.rovers) {
            NSLog(@"%@", rover.roverName);
        }
        [self.tableView.reloadData];
    }];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rovers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roverCell" forIndexPath:indexPath];
    
    MGDRover *rover = self.rovers[indexPath.row];
    
    // Configure the cell...
    
    cell.textLabel.text = rover.roverName;
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

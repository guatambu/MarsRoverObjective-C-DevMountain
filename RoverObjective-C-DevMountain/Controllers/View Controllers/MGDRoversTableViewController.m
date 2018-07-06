//
//  MGDRoversTableViewController.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDRoversTableViewController.h"
#import "MGDRover.h"
#import "MGDMarsRoverClient.h"
#import "MGDRoverController.h"


@interface MGDRoversTableViewController ()

@property (nonatomic, copy)NSArray *localRovers;

@end

@implementation MGDRoversTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *hangar = [NSMutableArray array];
    
    dispatch_group_t roverGroup = dispatch_group_create();

    dispatch_group_enter(roverGroup);
    
        [MGDMarsRoverClient fetchAllMarsRoversWithCompletion:^(NSArray<MGDRover *> *rovers, NSError *error) {
            
            if (error) {
                NSLog(@"there was an error > MGDRoversTableViewController line 34: %@ ", error.localizedDescription);
            }
            
            dispatch_queue_t returnedRoversQueue = dispatch_queue_create("com.mgd.returnedRoversQueue", 0);
            
            for (MGDRover *rover in rovers) {
                [MGDMarsRoverClient fetchMissionManifestForRoverNamed:rover.roverName completion:^(MGDRover *roverManifest, NSError *error) {
                    
                    if (error) {
                        NSLog(@"there was an error > MGDRoversTableViewController line 45: %@ ", error.localizedDescription);
                        
                        dispatch_group_leave(roverGroup);
                    }
                    
                    dispatch_async(returnedRoversQueue, ^{
                        [hangar addObjectsFromArray:rovers];
                        dispatch_group_leave(roverGroup);
                    });
                }];
            }
            dispatch_group_leave(roverGroup);
        }];
    
    dispatch_group_wait(roverGroup, DISPATCH_TIME_FOREVER);
    
    self.localRovers = hangar;
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.localRovers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"roverCell" forIndexPath:indexPath];
    
    MGDRover *rover = self.localRovers[indexPath.row];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        cell.textLabel.text = rover.roverName;
        [self.tableView reloadData];
    });
    
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma setRovers

- (void)setRovers:(NSArray *)rovers
{
    if (rovers != _localRovers) {
        _localRovers = [rovers copy];
        [self.tableView reloadData];
    }
}

@end


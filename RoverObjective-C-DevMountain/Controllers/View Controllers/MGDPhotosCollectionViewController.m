//
//  MGDPhotosCollectionViewController.m
//  RoverObjective-C-DevMountain
//
//  Created by Michael Guatambu Davis on 7/5/18.
//  Copyright © 2018 Leme Group. All rights reserved.
//

#import "MGDPhotosCollectionViewController.h"
#import "MGDRoverPhotoController.h"
#import "MGDPhotoCache.h"
#import "MGDRoverPhoto.h"
#import "MGDPhotoCollectionViewCell.h"

#pragma Local Properties

@interface MGDPhotosCollectionViewController ()

@property (nonatomic, copy)NSArray *localPhotos;
//@property (nonatomic, readwrite)NSData *cachedData;

@end


#pragma implemntation

@implementation MGDPhotosCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MGDPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"marsPhotosCollectionCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MGDPhotoCollectionViewCell alloc]init];
    }
    
    MGDRoverPhoto *photo = self.localPhotos[indexPath.row];
    
    NSInteger photoIdentifier = [photo.photoIdentifier integerValue];
    
    NSData *cachedData = [[MGDPhotoCache sharedCache] imageDataForIdentifier:&photoIdentifier];
    
    if (cachedData != nil) {
        UIImage *photoImage = [UIImage imageWithData:cachedData];
        cell.thumbImageView.image = photoImage;
    } else if (cachedData == nil) {
        cell.thumbImageView.image = [UIImage imageNamed:@"roverPlaceholderImage"];
        
    }
    
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end

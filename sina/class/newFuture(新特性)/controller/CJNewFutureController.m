//
//  CJNewFutureController.m
//  sina
//
//  Created by Joseph on 16/1/28.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJNewFutureController.h"

#import "CJNewFutureCell.h"

@interface CJNewFutureController ()

@end

@implementation CJNewFutureController

static NSString * const reuseIdentifier = @"Cell";
-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:layout];

}

-(NSMutableArray *)pictures
{
    if (_pictures == nil) {
        _pictures = [NSMutableArray array];
        
        for (int i; i < 4; i++) {
            NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i+1];
            
            UIImage *image = [UIImage imageNamed:imageName];
            
            [_pictures addObject:image];
        }
    }
    return _pictures;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.bounces = NO;
    
    self.collectionView.pagingEnabled = YES;
    
    [self.collectionView registerClass:[CJNewFutureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
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

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.pictures.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CJNewFutureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImage *pic = self.pictures[indexPath.row];
    
    [cell setUpCell:indexPath CellImage:pic imageCount:self.pictures.count];
    
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

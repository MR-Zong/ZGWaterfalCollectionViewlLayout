//
//  ViewController.m
//  ZGWaterfallCollectionViewLayout
//
//  Created by Zong on 16/3/7.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"
#import "ZGWaterfallCollectionViewLayout.h"
#import "ZGTestCollectionViewCell.h"

@interface ViewController () <UICollectionViewDataSource,ZGWaterfallCollectionViewLayoutDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZGWaterfallCollectionViewLayout *waterfallLayout = [[ZGWaterfallCollectionViewLayout alloc] init];
    waterfallLayout.delegate = self;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterfallLayout];
    
    collectionView.backgroundColor = [UIColor blackColor];
    
    collectionView.dataSource = self;
    [collectionView registerClass:[ZGTestCollectionViewCell class] forCellWithReuseIdentifier:@"testCell"];
    [self.view addSubview:collectionView];
    
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZGTestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor yellowColor];
    cell.titleLabel.text = [NSString stringWithFormat:@"%zd-%zd",indexPath.section,indexPath.item];
    [cell.titleLabel sizeToFit];
    
    return cell;
}

#pragma mark - <ZGWaterfallCollectionViewLayoutDelegate>
- (CGFloat)waterfallCollectionViewLayout:(ZGWaterfallCollectionViewLayout *)waterfallCollectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (arc4random() % 101) + 100;
}

@end

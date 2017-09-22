//
//  BaseHeaderView.m
//  RCController
//
//  Created by 程荣刚 on 2017/9/22.
//  Copyright © 2017年 程荣刚. All rights reserved.
//

#import "BaseHeaderView.h"
#import "BaseCollectionViewCell.h"

#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width

static NSString *cellID = @"BaseCollectionViewCell";

@interface BaseHeaderView ()


@end

@implementation BaseHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.headerView.localizationImageNamesGroup = @[@"back", @"left", @"for"];
        self.midTitleView.titlesGroup = @[@"localizationImageNamesGrouplocalizationImageNamesGroup", @"addSubviewaddSubviewaddSubview", @"initWithFrameinitWithFrameinitWithFrame"];
        [self addSubview:self.headerView];
        [self addSubview:self.midTitleView];
        
        //初始化一个布局对象
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //设置最小间距
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 7;
        //设置格子大小
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 40 )/5, (SCREEN_WIDTH - 40 )/5);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //初始化集合视图
        self.collectionView.collectionViewLayout = flowLayout;
        
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.midTitleView.frame), SCREEN_WIDTH, (SCREEN_WIDTH - 40 )*2/5) collectionViewLayout:flowLayout];
        
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellWithReuseIdentifier:cellID];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.delegate = self;
        self.collectionView.bounces = NO;
        self.collectionView.pagingEnabled = true;
        self.collectionView.dataSource = self;
        [self addSubview:self.collectionView];
    }
    
    return self;
}

- (SDCycleScrollView *)headerView {
    if (!_headerView) {
        _headerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -20, SCREEN_WIDTH,200) delegate:self placeholderImage:[UIImage imageNamed:@"ic_main_not_loaded_out_widther"]];
        _headerView.autoScrollTimeInterval = 3;
        _headerView.tag = 1;
        _headerView.pageDotImage = [UIImage imageNamed:@"ic_main_by_switching_circle"];
        _headerView.currentPageDotImage = [UIImage imageNamed:@"ic_main_by_switching"];
        _headerView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _headerView.backgroundColor = [UIColor colorNamed:@"lightGrayColor"];
        _headerView.showPageControl = YES;
        _headerView.infiniteLoop = YES;
    }
    return _headerView;
}

- (SDCycleScrollView *)midTitleView {
    if (!_midTitleView) {
        _midTitleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame), SCREEN_WIDTH, 50) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _midTitleView.autoScrollTimeInterval = 3;
        _midTitleView.tag = 2;
        _midTitleView.onlyDisplayText = true;
        _midTitleView.scrollDirection = UICollectionViewScrollDirectionVertical;
        _midTitleView.titleLabelBackgroundColor = [UIColor whiteColor];
        _midTitleView.titleLabelTextColor = [UIColor blackColor];
    }
    
    return _midTitleView;
}

#pragma mark - SDCycleScrollViewDelegate

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"cycleScrollView.tag = %zd", cycleScrollView.tag);
    NSLog(@"index = %zd", index);
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 28;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.desLabel.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath.item = %zd", indexPath.item);
}


@end

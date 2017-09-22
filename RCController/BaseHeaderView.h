//
//  BaseHeaderView.h
//  RCController
//
//  Created by 程荣刚 on 2017/9/22.
//  Copyright © 2017年 程荣刚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface BaseHeaderView : UIView <SDCycleScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

/** 头部视图*/
@property (nonatomic, strong) SDCycleScrollView *headerView;
/** 文字视图*/
@property (nonatomic, strong) SDCycleScrollView *midTitleView;

/** <#description#> */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

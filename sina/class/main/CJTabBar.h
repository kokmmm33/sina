//
//  CJTabBar.h
//  sina
//
//  Created by Joseph on 16/1/20.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 1.布局自定义tabBar上的子视图，将item数据模型传给自定义的button视图
 2。设置好代理和协议方法，写好数据传递的逻辑关系
 
 */
@class CJTabBar;
@protocol CJCJTabBarDelegate <NSObject>
@optional

-(void)tabBar:(CJTabBar *)tabBar didClickBarButton:(NSInteger)index;

@end


@interface CJTabBar : UIView

@property(nonatomic,strong)NSArray *items;
@property(nonatomic,weak)id<CJCJTabBarDelegate> delegate;

@end

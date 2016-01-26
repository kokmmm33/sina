//
//  CZTabBarButton.h
//  sina
//
//  Created by Joseph on 16/1/20.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 1.创建button，设置butoon（重写item的set方法）
 2.重新布局子视图
 
 */
@interface CJTabBarButton : UIButton

@property(nonatomic,strong)UITabBarItem *item;

@end

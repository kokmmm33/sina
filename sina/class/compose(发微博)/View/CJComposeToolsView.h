//
//  CJComposeToolsView.h
//  sina
//
//  Created by Joseph on 16/2/10.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol composeToolsDelegate <NSObject>


-(void)DidClickTools:(UIView *)toolsBar clickButton:(UIButton *)button;

@end
@interface CJComposeToolsView : UIView
@property(nonatomic,weak)id<composeToolsDelegate>   delegate;

@end

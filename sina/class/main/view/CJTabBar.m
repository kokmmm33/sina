//
//  CJTabBar.m
//  sina
//
//  Created by Joseph on 16/1/20.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJTabBar.h"

#import "CJTabBarButton.h"

@interface CJTabBar()
@property(nonatomic,weak)UIButton *  plusBTN;
@property(nonatomic,strong)NSMutableArray *buttons;
@property(nonatomic,weak)UIButton * selectedButton;

@end

@implementation CJTabBar

-(NSMutableArray *)buttons
{
    if (_buttons == nil) {
        NSMutableArray *btarr = [NSMutableArray array];
        
        _buttons = btarr;
    }
    
    return _buttons;

}

-(UIButton *)plusBTN
{
    if (_plusBTN == nil)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [btn addTarget:self action:@selector(didPlusBTNClick) forControlEvents:UIControlEventTouchUpInside];
        
        [btn sizeToFit];
        
        [self addSubview:btn];
        _plusBTN = btn;
    }
    return _plusBTN;
}

//加号按钮点击事件

-(void)didPlusBTNClick
{
    if ([_delegate respondsToSelector:@selector(tabBar:didClickPlusButton:)]) {
        [_delegate tabBar:self didClickPlusButton:self.plusBTN];
    }

}

-(void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UITabBarItem *item in items)
    {
        CJTabBarButton *barButton = [CJTabBarButton buttonWithType:UIButtonTypeCustom];
        
        barButton.item = item;
        
        barButton.tag = self.buttons.count;
        
        [barButton addTarget:self action:@selector(barButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (barButton.tag == 0) {
            [self barButtonClick:barButton];
        }
        
        [self addSubview:barButton];
        
        [self.buttons addObject:barButton];
        
    }

}

-(void)barButtonClick:(UIButton *)button
{
    button.selected = YES;
    
    _selectedButton.selected = NO;
    
    _selectedButton = button;
    
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBarButton:)]) {
        [_delegate tabBar:self didClickBarButton:button.tag];
    }
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor whiteColor];

    CGFloat W = self.bounds.size.width;
    CGFloat H = self.bounds.size.height;
    
    CGFloat BT_X = 0;
    CGFloat BT_Y = 0;
    CGFloat BT_W = W / (self.items.count + 1);//括号别忘了。。。。
    CGFloat BT_H = H;
    
    int i = 0;
    
    for (UIButton *tabButton in self.buttons)
    {
            if (i == 2)
            {
                i = 3;
            }
            
            tabButton.frame = CGRectMake(BT_X + BT_W * i , BT_Y, BT_W, BT_H);
            
            i++;
    }
    
    self.plusBTN.center = CGPointMake(W * 0.5, H * 0.5);
}


@end

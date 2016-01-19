//
//  CZTabbar.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CZTabbar.h"

@interface CZTabbar()

@property(nonatomic,weak) UIButton * plusBTN;


@end

@implementation CZTabbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSLog(@"---self.frame=%@，%lu",NSStringFromCGRect(self.frame),self.items.count);
    
    CGFloat W = self.bounds.size.width;
    CGFloat H = self.bounds.size.height;
    
    CGFloat BT_X = 0;
    CGFloat BT_Y = 0;
    CGFloat BT_W = W / (self.items.count + 1);//括号别忘了。。。。
    CGFloat BT_H = H;

    int i = 0;
    
    for (UIView *tabButton in self.subviews)
    {

        if ([tabButton isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            
            if (i == 2)
            {
                i = 3;
            }
            
            tabButton.frame = CGRectMake(BT_X + BT_W * i , BT_Y, BT_W, BT_H);
            
            i++;

        }
        
    }
    
    self.plusBTN.center = CGPointMake(W * 0.5, H * 0.5);
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
        
        [btn sizeToFit];
        
        [self addSubview:btn];
        _plusBTN = btn;
    }
    return _plusBTN;


}

@end

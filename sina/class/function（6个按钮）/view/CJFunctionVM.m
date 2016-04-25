//
//  CJFunctionVM.m
//  sina
//
//  Created by mac on 16/4/24.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJFunctionVM.h"



#define BT_W 90
#define BT_H 90
#define MARGIN_Y 300
#define MARGIN_H 20

@implementation CJFunctionVM

-(NSArray *)buttonTitles
{
    if (_buttonTitles == nil) {
        _buttonTitles = @[@"文字",@"照片／视频",@"头条文章",@"签到",@"点评",@"更多"];

    }
    return _buttonTitles;
}

-(NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
        
        for ( int i = 0 ; i < 6; i++) {
            
            UIButton *button = [[UIButton alloc]init];
            
            //        button.backgroundColor = [UIColor yellowColor];
            
            button.frame = CGRectMake(0, 0, BT_W , BT_H);
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"compose_button_%d",i+1]];
            [button setImage:image forState:UIControlStateNormal];
            
            button.imageView.contentMode = UIViewContentModeScaleToFill;
            button.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,button.titleLabel.bounds.size.width);
            
            [button setTitle:[self.buttonTitles objectAtIndex:i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:11];
            button.titleLabel.textAlignment = NSTextAlignmentCenter;        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
            
            button.titleEdgeInsets = UIEdgeInsetsMake(75, -button.titleLabel.bounds.size.width-50, 0, 10);
            [_buttons addObject:button];
     
        }
    }
        return _buttons;
}
    

-(NSMutableArray *)BTFrames
{
    if (_BTFrames == nil) {
        
        _BTFrames = [NSMutableArray array];
        for (int i = 0; i < 6; i++) {
            CGFloat W = BT_W;
            CGFloat H = BT_H;
            CGFloat margin_x = (ScreenWidth - W * 3) * 0.25;
            CGFloat x = i > 2?(i - 2) * margin_x + (i - 3) * W:(i + 1) * margin_x + i * W;
            CGFloat Y = i > 2?MARGIN_Y+ MARGIN_H  + H:MARGIN_Y;
            
            CGRect rect  = CGRectMake(x, Y, W, H);
            [_BTFrames addObject:NSStringFromCGRect(rect)];   
        }
    }
    return _BTFrames;
}

-(CGRect)backBTFrame
{
    CGRect rect = CGRectMake(0, ScreenHight - 49, ScreenWidth, 49);
    return rect;

}


@end

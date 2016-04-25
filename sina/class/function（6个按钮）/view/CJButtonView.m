//
//  CJButtonView.m
//  sina
//
//  Created by mac on 16/4/23.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJButtonView.h"


#define BT_W 90
#define BT_H 90
#define MARGIN_Y 25

@interface CJButtonView ()

@property(nonatomic,strong)NSMutableArray *buttons;
@property(nonatomic,strong)NSArray *buttonTitles;

@end


@implementation CJButtonView


-(NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

-(NSArray *)buttonTitles
{
    if (_buttonTitles == nil) {
        _buttonTitles = @[@"文字",@"照片／视频",@"头条文章",@"签到",@"点评",@"更多"];
    }
    return _buttonTitles;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if ( self = [super initWithFrame:frame])
    {
        //创建6个按钮
//        self.backgroundColor = [UIColor yellowColor];

        [self creatButtons];
 
    }
    

    return self;
}

-(void)creatButtons
{

    for ( int i = 0 ; i < 6; i++) {

        UIButton *button = [[UIButton alloc]init];
        
//        button.backgroundColor = [UIColor yellowColor];
        
        button.frame = CGRectMake(0, 0, BT_W , BT_H);
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"compose_button_%d",i+1]];
        [button setImage:image forState:UIControlStateNormal];

        button.imageView.contentMode = UIViewContentModeScaleToFill;
        button.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,button.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
        
        [button setTitle:@"首页" forState:UIControlStateNormal];//设置button的title
        button.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
        button.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体

        button.titleEdgeInsets = UIEdgeInsetsMake(75, -button.titleLabel.bounds.size.width-50, 0, 10);//设置title在button上的位置（上top，左left，下bottom，右right）

        [self.buttons addObject:button];
        [self addSubview:button];
   }
}

-(void)layoutSubviews
{
        [self.buttons enumerateObjectsUsingBlock:^(UIButton*   obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGFloat W = BT_W;
            CGFloat H = BT_H;
            CGFloat margin_x = (self.w - W * 3) * 0.25;
            CGFloat x = idx > 2?(idx - 2) * margin_x + (idx - 3) * W:(idx + 1) * margin_x + idx * W;
            CGFloat Y = idx > 2?MARGIN_Y * 2 + H:MARGIN_Y;
            
            obj.frame = CGRectMake(x, Y, W, H);
            
        }];

}


@end

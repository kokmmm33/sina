//
//  CJStatusCellItem.m
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJStatusCellItem.h"
#import "CJStatus.h"
#import "CJUser.h"

#define margin 10

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@implementation CJStatusCellItem

-(void)setStatus:(CJStatus *)status
{
    _status = status;
    
    //计算原创微博的rect
    [self setUpOriginViewRect];
    

//    
//    
//    //计算转发微博的尺寸
//    [self setUpRetWeetedViewRect];
//    //计算工具栏的尺寸
//    [self setUpToolsViewRect];

}
-(void)setUpOriginViewRect
{
    CGFloat iconX = margin;
    CGFloat icony = margin;
    CGFloat iconwy = 35;
    self.originaIconRect = (CGRect){{iconX,icony},{iconwy,iconwy}};
    
    CGFloat namex = CGRectGetMaxX(self.originaIconRect) + margin;
    CGFloat namey = margin;
    CGSize nameSize = [self.status.user.screen_name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    self.originaNameRect = (CGRect){{namex,namey},nameSize};
    
    CGFloat vipx = CGRectGetMaxX(self.originaNameRect);
    CGFloat vipy = margin;
    CGSize vipSize = {20,20};
    self.originalVipRect = (CGRect){{vipx,vipy},vipSize};
    
    CGFloat timex = CGRectGetMaxX(self.originaIconRect);
    CGFloat timey = CGRectGetMaxY(self.originaNameRect);
    CGSize timeSize = [self.status.created_at sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]}];
   self.originalTimeRect = (CGRect){{timex,timey},timeSize};
    
    CGFloat sourcex = CGRectGetMaxX(self.originalTimeRect);
    CGFloat sourcey = CGRectGetMaxY(self.originaNameRect);
    CGSize sourceSize = [self.status.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]}];
   self.originalSourceRect = (CGRect){{sourcex,sourcey},sourceSize};
    
    CGFloat textx = margin;
    CGFloat texty = CGRectGetMaxY(self.originalSourceRect);
    CGFloat textw = ScreenWidth - margin * 2;
    CGSize textSize = [self.status.text sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(textw, MAXFLOAT)];
   self.originalTextRect = (CGRect){{textx,texty},textSize};
    
    CGFloat originalx = 0;
    CGFloat originalY = margin;
    CGFloat Originalw = ScreenWidth;
    CGFloat originalh = CGRectGetMaxY(self.originalTextRect) + margin;
    self.originalRect = (CGRect){{originalx,originalY},{Originalw,originalh}};


}

-(void)setUpRetWeetedViewRect
{
    CGRect rect = CGRectMake(margin, margin, 35, 35);
    
    
}

-(void)setUpToolsViewRect
{
    CGRect rect = CGRectMake(margin, margin, 35, 35);
    
    
}

@end

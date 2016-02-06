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

#define margin 5


@implementation CJStatusCellItem

- (void)setStatus:(CJStatus *)status
{
    _status = status;
    
    // 计算原创微博
    [self setUpOriginalViewFrame];
    
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    

    // 计算工具条
    CGFloat toolBarX = 0;
    CGFloat toolBarW = ScreenWidth;
    CGFloat toolBarH = 35;
    _toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    // 计算cell高度
    _cellHeight = CGRectGetMaxY(_toolBarFrame);
    
}

#pragma mark - 计算原创微博
- (void)setUpOriginalViewFrame
{
    // 头像
    CGFloat iconX = margin;
    CGFloat icony = margin;
    CGFloat iconwy = 35;
    _originalIconFrame = (CGRect){{iconX,icony},{iconwy,iconwy}};
    
    CGFloat namex = CGRectGetMaxX(_originalIconFrame) + margin;
    CGFloat namey = margin;
    CGSize nameSize = [_status.user.screen_name sizeWithAttributes:@{NSFontAttributeName:FONT_16}];
    _originalNameFrame = (CGRect){{namex,namey},nameSize};
    
    CGFloat vipx = CGRectGetMaxX(_originalNameFrame) + margin;
    CGFloat vipy = margin;
    CGSize vipSize = {20,20};
    _originalVipFrame = (CGRect){{vipx,vipy},vipSize};
    
    CGFloat timex = CGRectGetMaxX(_originalIconFrame) + margin;
    CGFloat timey = CGRectGetMaxY(_originalNameFrame) + margin;
    CGSize timeSize = [_status.created_at sizeWithAttributes:@{NSFontAttributeName:FONT_12}];
    _originalTimeFrame = (CGRect){{timex,timey},timeSize};
    
    CGFloat sourcex = CGRectGetMaxX(_originalTimeFrame);
    CGFloat sourcey = CGRectGetMaxY(_originalNameFrame) + margin;
    CGSize sourceSize = [_status.source sizeWithAttributes:@{NSFontAttributeName:FONT_12}];
    _originalSourceFrame = (CGRect){{sourcex,sourcey},sourceSize};
    
    CGFloat textx = margin;
    CGFloat texty = CGRectGetMaxY(_originalSourceFrame);
    CGFloat textw = ScreenWidth - margin * 2;
    CGSize textSize = [_status.text sizeWithFont:FONT_15 constrainedToSize:CGSizeMake(textw, MAXFLOAT)];
    _originalTextFrame = (CGRect){{textx,texty},textSize};
    
    CGFloat originalx = 0;
    CGFloat originalY = margin;
    CGFloat Originalw = ScreenWidth;
    CGFloat originalh = CGRectGetMaxY(_originalTextFrame) + margin;

    _originalViewFrame = (CGRect){{originalx,originalY},{Originalw,originalh}};

}
@end

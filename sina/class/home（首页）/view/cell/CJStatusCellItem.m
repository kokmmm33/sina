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
    
    // 计算工具条
    CGFloat toolBarX = 0;
    CGFloat toolBarW = ScreenWidth;
    CGFloat toolBarH = 35;
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    
    //计算转发微博
    if (_status.retweeted_status != nil) {
        [self serUpretWeetedStatus];
        
        toolBarY = CGRectGetMaxY(_retweetViewFrame)+margin*2;
    }
    
    
    _toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    
    // 计算cell高度
    _cellHeight = CGRectGetMaxY(_toolBarFrame);
    
}

//计算配图的尺寸
- (CGSize)photosSizeWithCount:(NSInteger)count
{
    // 获取总列数
    int cols = count == 4? 2 : 3;
    // 获取总行数 = (总个数 - 1) / 总列数 + 1
    int rols = (int)(count - 1) / cols + 1;
    CGFloat photoWH = 70;
    CGFloat w = cols * photoWH + (cols - 1) * margin;
    CGFloat h = rols * photoWH + (rols - 1) * margin;
    
    return CGSizeMake(w, h);
    
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
    
    if (_status.user.vip) {
        CGFloat vipx = CGRectGetMaxX(_originalNameFrame) + margin;
        CGFloat vipy = margin;
        CGSize vipSize = {15,15};
        _originalVipFrame = (CGRect){{vipx,vipy},vipSize};
    }
    
    
    
    CGFloat timex = CGRectGetMaxX(_originalIconFrame) + margin;
    CGFloat timey = CGRectGetMaxY(_originalNameFrame) + margin;
    CGSize timeSize = [_status.created_at sizeWithAttributes:@{NSFontAttributeName:FONT_12}];
    _originalTimeFrame = (CGRect){{timex,timey},timeSize};
    
    CGFloat sourcex = CGRectGetMaxX(_originalTimeFrame) +margin;
    CGFloat sourcey = CGRectGetMaxY(_originalNameFrame) + margin;
    CGSize sourceSize = [_status.source sizeWithAttributes:@{NSFontAttributeName:FONT_12}];
    _originalSourceFrame = (CGRect){{sourcex,sourcey},sourceSize};
    
    CGFloat textx = margin;
    CGFloat texty = CGRectGetMaxY(_originalSourceFrame) + margin;
    CGFloat textw = ScreenWidth - margin * 2;
    CGSize textSize = [_status.text sizeWithFont:FONT_15 constrainedToSize:CGSizeMake(textw, MAXFLOAT)];
    _originalTextFrame = (CGRect){{textx,texty},textSize};
    
    CGFloat originalh = CGRectGetMaxY(_originalTextFrame) + margin;

    if (_status.pic_urls.count) {
        CGSize size = [self photosSizeWithCount:_status.pic_urls.count];
        CGFloat photosx = margin;
        CGFloat photosy = CGRectGetMaxY(_originalTextFrame) + margin;
        _originalPhotosFrame = (CGRect){{photosx,photosy},size};
        originalh = CGRectGetMaxY(_originalPhotosFrame) + margin;

    }
    
    CGFloat originalx = 0;
    CGFloat originalY = margin*3;
    CGFloat Originalw = ScreenWidth;


    _originalViewFrame = (CGRect){{originalx,originalY},{Originalw,originalh}};

}

#pragma mark --设计转发微博----
-(void)serUpretWeetedStatus
{
    //微博昵称
    CGFloat namex = 0;
    CGFloat namey = margin;
    NSString *nameStr = [NSString stringWithFormat:@"@%@",_status.retweeted_status.user.screen_name];
    CGSize nameSize = [nameStr sizeWithAttributes:@{NSFontAttributeName:FONT_16}];
    _retweetNameFrame = (CGRect){{namex,namey},nameSize};

    //微博内容
    CGFloat textx = 0;
    CGFloat texty = CGRectGetMaxY(_retweetNameFrame) ;
    CGFloat textw = ScreenWidth - margin * 2;
    CGSize textSize = [_status.retweeted_status.text sizeWithFont:FONT_15 constrainedToSize:CGSizeMake(textw, MAXFLOAT)];
    _retweetTextFrame = (CGRect){{textx,texty},textSize};
    
    
    CGFloat retweeth = CGRectGetMaxY(_retweetTextFrame) ;
    
    if (_status.retweeted_status.pic_urls.count) {
        CGSize size = [self photosSizeWithCount:_status.retweeted_status.pic_urls.count];
        CGFloat photosx = _retweetTextFrame.origin.x;
        CGFloat photosy = CGRectGetMaxY(_retweetTextFrame) + margin;
        _retweetPhotosFrame = (CGRect){{photosx,photosy},size};
        retweeth = CGRectGetMaxY(_retweetPhotosFrame) + margin;
    }
    CGFloat retweetx = 0;
    CGFloat retweety = CGRectGetMaxY(_originalViewFrame);
    CGFloat retweetw = ScreenWidth - margin * 2;

    _retweetViewFrame =(CGRect){{retweetx,retweety},{retweetw,retweeth}};

}











@end

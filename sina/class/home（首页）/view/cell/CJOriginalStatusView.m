//
//  CJOriginalStatusView.m
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJOriginalStatusView.h"

#import "CJStatusCellItem.h"
#import "CJStatus.h"
#import "CJUser.h"

#import "UIImageView+WebCache.h"
#define status self.StatusCellItem.status

@interface CJOriginalStatusView()



@end
@implementation CJOriginalStatusView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setUpSubView];
        
    }
    
    return self;
}


-(CJStatusCellItem *)StatusCellItem
{
    if (_StatusCellItem == nil) {
        _StatusCellItem = [[CJStatusCellItem alloc]init];
    }
    return _StatusCellItem;
}


-(void)setUpSubView
{
    UIImageView *iconImageView = [[UIImageView alloc]init];
    [iconImageView sd_setImageWithURL:status.user.profile_image_url];
    iconImageView.frame = self.StatusCellItem.originaIconRect;
    [self addSubview:iconImageView];
    
    UILabel *nameLable = [[UILabel alloc]init];
    nameLable.text = status.user.screen_name;
    nameLable.frame = self.StatusCellItem.originaNameRect;
    [self addSubview:nameLable];
    
    UIImageView *vipImageView = [[UIImageView alloc]init];
    
    vipImageView.frame = self.StatusCellItem.originalVipRect;
    [self addSubview:vipImageView];
    
    UILabel *timeLable = [[UILabel alloc]init];
    timeLable.text = status.created_at;
    timeLable.frame = self.StatusCellItem.originalTimeRect;
    [self addSubview:timeLable];
    
    UILabel *sourceLable = [[UILabel alloc]init];
    sourceLable.text = status.source;
    sourceLable.frame = self.StatusCellItem.originalSourceRect;
    [self addSubview:sourceLable];
    
    UILabel *textLable = [[UILabel alloc]init];
    textLable.text = status.text;
    sourceLable.frame = self.StatusCellItem.originalTextRect;
    [self addSubview:textLable];


}

@end

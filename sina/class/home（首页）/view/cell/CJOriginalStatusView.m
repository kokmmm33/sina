//
//  CJOriginalStatusView.m
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJOriginalStatusView.h"

#import "CJImagesView.h"

#import "CJStatusCellItem.h"
#import "CJStatus.h"
#import "CJUser.h"

#import "UIImageView+WebCache.h"
#import "UIImage+CZRenderImage.h"


@interface CJOriginalStatusView()

@property(nonatomic,weak)UIImageView *iconImageView;
@property(nonatomic,weak)UILabel *nameLable;
@property(nonatomic,weak)UIImageView *vipImageView;
@property(nonatomic,weak)UILabel *timeLable;
@property(nonatomic,weak)UILabel *sourceLable;
@property(nonatomic,weak)UILabel *textLable;
@property(nonatomic,weak)CJImagesView *imagesView;


@end
@implementation CJOriginalStatusView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageWithStrectchable:@"timeline_card_top_background"];
        [self setUpSubView];
        
    }
    return self;
}


-(void)setStatusCellItem:(CJStatusCellItem *)StatusCellItem
{
    _StatusCellItem = StatusCellItem;
    [self setUpFrame];
    [self setUpData];
    
    _imagesView.photos = StatusCellItem.status.pic_urls;
}

-(void)setUpFrame
{
    _iconImageView.frame = _StatusCellItem.originalIconFrame;
    _nameLable.frame = _StatusCellItem.originalNameFrame;
    _vipImageView.frame = _StatusCellItem.originalVipFrame;
    _timeLable.frame = _StatusCellItem.originalTimeFrame;
    _sourceLable.frame = _StatusCellItem.originalSourceFrame;
    _textLable.frame = _StatusCellItem.originalTextFrame;
    _imagesView.frame = _StatusCellItem.originalPhotosFrame;
    
}

-(void)setUpData
{
    [_iconImageView sd_setImageWithURL:_StatusCellItem.status.user.profile_image_url];
    
    
    _nameLable.text = _StatusCellItem.status.user.screen_name;
    _nameLable.font = FONT_16;
    
    if (_StatusCellItem.status.user.vip) {
        
        _nameLable.textColor = [UIColor orangeColor];
        
        NSString *vipLv = [NSString stringWithFormat:@"common_icon_membership_level%d",_StatusCellItem.status.user.mbrank];
        
         _vipImageView.image = [UIImage imageNamed:vipLv];
    }
    
    
    _timeLable.text = _StatusCellItem.status.created_at;
    _timeLable.font = FONT_12;
    
    _sourceLable.text = _StatusCellItem.status.source;
    _sourceLable.font = FONT_12;
    
    _textLable.text = _StatusCellItem.status.text;
    _textLable.font = FONT_15;
    _textLable.numberOfLines = 0;
    _textLable.lineBreakMode = NSLineBreakByCharWrapping;

}

-(void)setUpSubView
{
    UIImageView *iconImageView = [[UIImageView alloc]init];
    [self addSubview:iconImageView];
    _iconImageView = iconImageView;
    
    UILabel *nameLable = [[UILabel alloc]init];
    [self addSubview:nameLable];
    _nameLable = nameLable;
    
    UIImageView *vipImageView = [[UIImageView alloc]init];
    [self addSubview:vipImageView];
    _vipImageView = vipImageView;
    
    UILabel *timeLable = [[UILabel alloc]init];
    [self addSubview:timeLable];
    _timeLable = timeLable;
    
    UILabel *sourceLable = [[UILabel alloc]init];
    [self addSubview:sourceLable];
    _sourceLable = sourceLable;
    
    UILabel *textLable = [[UILabel alloc]init];
    [self addSubview:textLable];
    _textLable = textLable;
    
    CJImagesView *photosView = [[CJImagesView alloc]init];
    [self addSubview:photosView];
    _imagesView = photosView;


}

@end

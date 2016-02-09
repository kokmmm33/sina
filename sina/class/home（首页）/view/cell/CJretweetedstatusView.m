//
//  CJretweetedstatusView.m
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJretweetedstatusView.h"
#import "CJStatusCellItem.h"
#import "CJStatus.h"
#import "CJUser.h"

#import "CJImagesView.h"

@interface CJretweetedstatusView()
@property(nonatomic,weak)UILabel *nameLable;
@property(nonatomic,weak)UILabel *textLable;
@property(nonatomic,weak)CJImagesView *imagesView;

@end

@implementation CJretweetedstatusView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = YES;


        UILabel *nameLable = [[UILabel alloc]init];
        [self addSubview:nameLable];
        _nameLable = nameLable;
        
        
        UILabel *textLable = [[UILabel alloc]init];
        [self addSubview:textLable];
        _textLable = textLable;
        
        CJImagesView *photosView = [[CJImagesView alloc]init];
        [self addSubview:photosView];
        _imagesView = photosView;
    }
    
    return self;
}

-(void)setStatusCellItem:(CJStatusCellItem *)StatusCellItem
{
    _StatusCellItem = StatusCellItem;
    [self setUpSubViewFrame];
    [self setUpSubView];
    
    _imagesView.photos = StatusCellItem.status.retweeted_status.pic_urls;




}

-(void)setUpSubViewFrame
{
    _textLable.frame = _StatusCellItem.retweetTextFrame;
    _nameLable.frame = _StatusCellItem.retweetNameFrame;
    _imagesView.frame = _StatusCellItem.retweetPhotosFrame;


}
-(void)setUpSubView
{
    _textLable.text = _StatusCellItem.status.retweeted_status.text;
    _textLable.font = FONT_15;
    _textLable.numberOfLines = 0;
    _textLable.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSString *str = _StatusCellItem.status.retweeted_status.user.screen_name;
    NSString *nameStr = [NSString stringWithFormat:@"@%@",str];
    _nameLable.text = nameStr;
    _nameLable.font = FONT_16;
    _nameLable.textColor = [UIColor blueColor];
    
    
}

@end

//
//  CJImagesView.m
//  sina
//
//  Created by Joseph on 16/2/9.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJImagesView.h"
#import "CJStatusImage.h"

#import "UIImageView+WebCache.h"
@interface CJImagesView()

@property(nonatomic,strong)NSMutableArray *photosArr;

@end

@implementation CJImagesView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSMutableArray *)photosArr
{
    if (_photosArr == nil) {
        NSMutableArray *arr = [NSMutableArray array];
        _photosArr = arr;
        
    }
    return _photosArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        
        // 一定要先添加9个子控件，要不然初始化时_photos.count为空，将会创建0个
        [self addSubViews];
        
    }
    return self;
}

-(void)addSubViews
{
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self addSubview:imageView];
        [self.photosArr addObject:imageView];
    }
}

//为photos设置图片
-(void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = self.photosArr[i];
        
        if (i < _photos.count ) {
            NSLog(@"photos[i]====%@",photos[i]);
            
            NSDictionary *imageUrl = photos[i];
            NSString *urlStr = imageUrl[@"thumbnail_pic"];
            
            imageView.hidden = NO;
            
            NSString *clearImage = [urlStr stringByReplacingOccurrencesOfString:@"thumbnail_pic" withString:@""];
            
            NSURL *url = [NSURL URLWithString:clearImage];
            
            [imageView sd_setImageWithURL:url];
        }else
        {
            imageView.hidden = YES;
        
        }
    }

}

//为图片设置frame
-(void)layoutSubviews
{
    [super layoutSubviews];
//列
    int cols = _photos.count==4?2:3;
    int margin = 5;
    int wh = 70;
    
    for (int i = 0;i < _photos.count; i++) {
        //行
        int currentRols = i / cols ;
        int currentCols = i % cols ;
        int x = (wh + margin) * currentCols;
        int y = (wh + margin) * currentRols;
        
        UIImageView *imageView = self.photosArr[i];
        imageView.frame = CGRectMake(x, y, wh, wh);
        
    }
    


}

@end

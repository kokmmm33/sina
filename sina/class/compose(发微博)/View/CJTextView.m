//
//  CJTextView.m
//  sina
//
//  Created by Joseph on 16/2/10.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJTextView.h"


@interface CJTextView()
@property(nonatomic,weak)UILabel *pleaseHolder;

@end

@implementation CJTextView

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        
//    }
//    return self;
//}

-(UILabel *)pleaseHolder
{
    if (_pleaseHolder == nil) {
        UILabel *pleaseHolder = [[UILabel alloc]init];
        
        [self addSubview:pleaseHolder];
        
        _pleaseHolder = pleaseHolder;
    }
    return _pleaseHolder;
}

/**
 *  _---***---如果已经设置了pleaseHolder，则共用此font---*******---------
 *
 *  @param font <#font description#>
 */
-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    _pleaseHolder.font = font;
    
    [_pleaseHolder sizeToFit];
}

-(void)setPleaseHolderText:(NSString *)pleaseHolderText
{
    _pleaseHolderText = pleaseHolderText;
    
    self.pleaseHolder.textColor = [UIColor darkGrayColor];
    
    self.pleaseHolder.text = pleaseHolderText;
    
    [self.pleaseHolder sizeToFit];

}

-(void)setHidePleaseHolder:(BOOL *)hidePleaseHolder
{
    
    _hidePleaseHolder = hidePleaseHolder;
    
    self.pleaseHolder.hidden = hidePleaseHolder;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _pleaseHolder.x = 5;
    
    _pleaseHolder.y = 8;
    

}



@end

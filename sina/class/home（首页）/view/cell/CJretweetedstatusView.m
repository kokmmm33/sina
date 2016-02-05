//
//  CJretweetedstatusView.m
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJretweetedstatusView.h"

@implementation CJretweetedstatusView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {

        UILabel *nameLable = [[UILabel alloc]init];
        [self addSubview:nameLable];
        
        
        UILabel *textLable = [[UILabel alloc]init];
        [self addSubview:textLable];
        
    }
    
    return self;
}
@end

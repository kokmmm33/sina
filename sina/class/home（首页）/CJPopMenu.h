//
//  CJPopMenu.h
//  sina
//
//  Created by Joseph on 16/1/25.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CJPopMenu : UIImageView

+(CJPopMenu *)showInRect:(CGRect)rect;

-(void)setContent:(UIView *)content;

+(void)hide;
@end

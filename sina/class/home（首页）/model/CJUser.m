//
//  CJUser.m
//  sina
//
//  Created by Joseph on 16/2/1.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJUser.h"

@implementation CJUser

-(void)setMbtype:(int)mbtype
{
    _mbrank = mbtype;
    if (mbtype ) {
       _vip = mbtype > 2;
        
    }


}

@end

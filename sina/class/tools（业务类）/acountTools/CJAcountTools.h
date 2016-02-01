//
//  CJAcountTools.h
//  sina
//
//  Created by Joseph on 16/1/31.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJAccount.h"

@interface CJAcountTools : NSObject

+(void)saveAcount:(CJAccount *)acount;
+(CJAccount *)acount;
@end

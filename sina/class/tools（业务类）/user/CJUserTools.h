//
//  CJUserTools.h
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJUser.h"
@interface CJUserTools : NSObject
+(void)getUserInfoWithAccess_token:(NSString *)token uid:(NSString *)uid screenName:(NSString *)screenName sucessBlock:(void(^)(CJUser *user))block failure:(void(^)(NSError *error))failure;
+(CJUser *)CurrentAccountUser;
@end

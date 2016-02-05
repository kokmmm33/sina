//
//  CJHTTPTools.h
//  sina
//
//  Created by Joseph on 16/2/2.
//  Copyright © 2016年 运来. All rights reserved.
//管理get、post请求

#import <Foundation/Foundation.h>

@interface CJHTTPTools : NSObject
+(void)GET:(NSString *)URLString
                     parameters:(id)parameters
                        success:(void (^)(id responseObject))success
   failure:(void (^)(NSError *error))failure;

+(void)POST:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;
@end

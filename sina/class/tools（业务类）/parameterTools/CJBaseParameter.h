//
//  CJBaseParameter.h
//  sina
//
//  Created by Joseph on 16/2/5.
//  Copyright © 2016年 运来. All rights reserved.
//uid	false	int64	需要查询的用户ID。
//screen_name	false	string	需要查询的用户昵称。

#import <Foundation/Foundation.h>

@interface CJBaseParameter : NSObject
/**
 *  采用OAuth授权方式为必填参数，OAuth授权后获得
 */
@property(nonatomic,copy)NSString *access_token;
/**
 *  用户ID
 */
@property(nonatomic,copy)NSString *uid;
/**
 *  用户昵称
 */
@property(nonatomic,copy)NSString *screen_name;
@end

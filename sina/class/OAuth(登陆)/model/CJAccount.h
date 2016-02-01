//
//  CJAccount.h
//  sina
//
//  Created by Joseph on 16/1/31.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJAccount : NSObject<NSCoding>
/**
 返回值字段	字段类型	字段说明
 access_token	string	用于调用access_token，接口获取授权后的access token。
 expires_in	string	access_token的生命周期，单位是秒数。
 remind_in	string	access_token的生命周期（该参数即将废弃，开发者请使用expires_in）。
 uid	string	当前授权用户的UID。
 **/

@property(nonatomic,copy)NSString *access_token;
/**
 *  access_token的生命周期，单位是秒数。
 */
@property(nonatomic,copy)NSString *expires_in;
/**
 *  access_token过期时间
 */
@property(nonatomic,strong)NSDate *expires_date;
/**
 *  access_token的生命周期（该参数即将废弃，开发者请使用expires_in）。
 */
@property(nonatomic,copy)NSString *remind_in;
/**
 *  当前授权用户的UID
 */
@property(nonatomic,copy)NSString *uid;

+(instancetype)accountWithDic:(NSDictionary *)dic;



@end

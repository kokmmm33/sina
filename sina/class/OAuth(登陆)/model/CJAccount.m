//
//  CJAccount.m
//  sina
//
//  Created by Joseph on 16/1/31.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJAccount.h"

#define Access_tokenkey  @"taken"
#define remind_inkey        @"remind"
#define expires_inkey    @"expires"
#define uidkey              @"uid"

@implementation CJAccount

/**
 *  KVC底层实现：遍历字典里的所有key(uid)
 一个一个获取key，会去模型里查找setKey: setUid:,直接调用这个方法，赋值 setUid:obj
 寻找有没有带下划线_key,_uid ,直接拿到属性赋值
 寻找有没有key的属性，如果有，直接赋值
 在模型里面找不到对应的Key,就会报错.
 */
+(instancetype)accountWithDic:(NSDictionary *)dic
{
    CJAccount *account = [[self alloc]init];
    
    [account setValuesForKeysWithDictionary:dic];
    
    return account;
}
-(void)setExpires_in:(NSString *)expires_in
{
    _expires_in = expires_in;
    
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}



/**
 *  归档的时候调用：告诉系统哪个属性需要归档，如何归档
 *
 *  @param aCoder <#aCoder description#>
 */
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:Access_tokenkey];
    [aCoder encodeObject:_remind_in forKey:remind_inkey];
    [aCoder encodeObject:_expires_in forKey:expires_inkey];
    [aCoder encodeObject:_uid forKey:uidkey];
}

/**
 *  解档的时候调用：告诉系统哪个属性需要解档，如何解档
 *
 *  @param aDecoder <#aDecoder description#>
 *
 *  @return <#return value description#>
 */
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:Access_tokenkey];
        _expires_in = [aDecoder decodeObjectForKey:expires_inkey];
        _remind_in = [aDecoder decodeObjectForKey:remind_inkey];
        _uid = [aDecoder decodeObjectForKey:uidkey];
    }
    return self;
}

@end

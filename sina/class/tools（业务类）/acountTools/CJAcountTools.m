//
//  CJAcountTools.m
//  sina
//
//  Created by Joseph on 16/1/31.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJAcountTools.h"

#define AccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation CJAcountTools
static CJAccount *_acount;

+(void)saveAcount:(CJAccount *)acount
{
    [NSKeyedArchiver archiveRootObject:acount toFile:AccountFileName];

}

/**
 *  类方法一般用静态变量代替成员属性
 *
 *  @return <#return value description#>
 */
+(CJAccount *)acount
{
    if (_acount == nil) {
        _acount = [NSKeyedUnarchiver unarchiveObjectWithFile:AccountFileName];
        
        if ([[NSDate date] compare:_acount.expires_date] == NSOrderedDescending ) {
            return nil;
        }
    }
    
    return _acount;
}

@end

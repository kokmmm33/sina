//
//  CJCover.h
//  sina
//
//  Created by Joseph on 16/1/22.
//  Copyright © 2016年 运来. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJCover;

@protocol CJCoverDelegate <NSObject>

@optional
-(void)DidClickedCover:(CJCover *)cover;

@end

@interface CJCover : UIView

@property(nonatomic,weak)id<CJCoverDelegate> delegate;

+(instancetype)show;

@end

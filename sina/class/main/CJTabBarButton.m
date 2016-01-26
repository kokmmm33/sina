//
//  CZTabBarButton.m
//  sina
//
//  Created by Joseph on 16/1/20.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJTabBarButton.h"

@implementation CJTabBarButton

-(void)setHighlighted:(BOOL)highlighted
{
//取消button的高亮
}

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.font= [UIFont systemFontOfSize:12];
    }
    return self;

}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];

    
    // KVO：时刻监听一个对象的属性有没有改变
    // 给谁添加观察者
    // Observer:按钮
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:_item.title forState:UIControlStateNormal];
    
    [self setImage:_item.image forState:UIControlStateNormal];
    
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    NSLog(@"%@-=-=-=-%@-=-=-=-=",_item.image,_item.selectedImage);
    
    NSLog(@"%@=====",_item);
    


}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat W = self.bounds.size.width;
    CGFloat H = self.bounds.size.height;
    
    CGFloat imagex = 0;
    CGFloat imagey = 0;
    CGFloat imagew = W;
    CGFloat imageh = H * 0.7;
    self.imageView.frame = CGRectMake(imagex, imagey, imagew, imageh);
    
    CGFloat titlex = 0;
    CGFloat titley = imageh;
    CGFloat titlew = W;
    CGFloat titleh = H - titley;
    self.titleLabel.frame = CGRectMake(titlex, titley, titlew, titleh);
}
@end

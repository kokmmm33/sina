//
//  CJOAuthController.m
//  sina
//
//  Created by Joseph on 16/1/30.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJOAuthController.h"

#import "CJAccount.h"
#import "CJAcountTools.h"
#import "CJRootController.h"

#import "AFNetworking.h"
#import "CJAcountTools.h"



@interface CJOAuthController ()<UIWebViewDelegate>

@end

@implementation CJOAuthController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%ld&redirect_uri=https://github.com/",APP_KEY]];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    webView.delegate = self;
    
    [self.view addSubview:webView];
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    
    NSLog(@"%@",url);
    
    NSRange range = [url rangeOfString:@"code="];
    
    if (range.length != 0) {
        NSString *code = [url componentsSeparatedByString:@"code="][1];
        
        NSLog(@"code=%@",code);
        
        [CJAcountTools loadAcountWithCode:code];
        
        return NO;
    }
    return YES;

}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"webView=%@",error);

}




@end

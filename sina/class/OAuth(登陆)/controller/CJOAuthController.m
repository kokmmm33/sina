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

#import "AFNetworking.h"



@interface CJOAuthController ()<UIWebViewDelegate>

@end

@implementation CJOAuthController
#define client_id          3938897265
#define redirect_uri       https://www.baidu.com


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=3008994865&redirect_uri=https://github.com/"]];
    
    
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
        
        [self getAccess_tokenWithCode:code];
        
        return NO;
    }
    return YES;

}

-(void)getAccess_tokenWithCode:(NSString *)code
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    /**
     必选	类型及范围	说明
     client_id	true	string	申请应用时分配的AppKey。
     client_secret	true	string	申请应用时分配的AppSecret。
     grant_type	true	string	请求的类型，填写authorization_code
     
     grant_type为authorization_code时
     必选	类型及范围	说明
     code	true	string	调用authorize获得的code值。
     redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
    */
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"client_id"] = @"3008994865";
    parameters[@"client_secret"] = @"679803b998bf148787e7a2ca53cf9b1e";
    parameters[@"grant_type"] = @"authorization_code";
    parameters[@"code"] = code;
    parameters[@"redirect_uri"] = @"https://github.com/";

    
    [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject=%@",responseObject);
        
        CJAccount *account = [CJAccount accountWithDic:responseObject];
        
        [CJAcountTools saveAcount:account];
        
              
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];



}




@end

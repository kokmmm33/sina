//
//  CZDiscoverViewController.m
//  sina
//
//  Created by Joseph on 16/1/18.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJDiscoverViewController.h"

#import "UIImage+CZRenderImage.h"

@interface CJDiscoverViewController ()

@property(nonatomic,weak)UITextField *seachBar;

@end

@implementation CJDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35);
    
    UITextField *searchBar = [[UITextField alloc]initWithFrame:rect];
    
    searchBar.placeholder = @"大家都在搜索。。。。";
    
    searchBar.background = [UIImage imageWithStrectchable:@"searchbar_textfield_background"];
    
    UIImageView *searchIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
    
    searchIcon.w += 10;
    
    searchIcon.contentMode = UIViewContentModeCenter;
    
    searchBar.leftView = searchIcon;
    
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    
    _seachBar = searchBar;
    
    self.navigationItem.titleView = searchBar;
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.seachBar resignFirstResponder];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

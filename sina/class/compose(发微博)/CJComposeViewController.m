//
//  CJComposeViewController.m
//  sina
//
//  Created by Joseph on 16/2/10.
//  Copyright © 2016年 运来. All rights reserved.
//

#import "CJComposeViewController.h"

#import "CJComposeToolsView.h"

#import "UIButton+CreateNewButton.h"
#import "UIView+view.h"


@interface CJComposeViewController ()<composeToolsDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>
@property(nonatomic,weak)UITextView *textView;

@property(nonatomic,weak)CJComposeToolsView *toolsView;
@end

@implementation CJComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航条
    [self setUpNavigationBar];
    
    //添加子控件
    [self addSubViews];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didTextChange) name:UITextViewTextDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)keyboardChange:(NSNotification *)note
{
    //获取动画时间
    CGFloat duretion = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // 获取键盘的frame
    CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (frame.origin.y == self.view.h) {//键盘位置未改变  还原
        [UIView animateWithDuration:duretion animations:^{
            _toolsView.transform = CGAffineTransformIdentity;
        }];
        
    }else{
        [UIView animateWithDuration:duretion animations:^{
            _toolsView.transform = CGAffineTransformMakeTranslation(0, -frame.size.height) ;
        }];
    }

}

-(void)didTextChange
{
    if (_textView.text.length != 0) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }else
    {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    

}

-(void)setUpNavigationBar
{
    self.title = @"发微博";
    
    //leftButton
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(backToMainView)];
    
    UIButton *rightButton = [UIButton buttonWithTitleColorForNomal:nil forHighLight:nil target:self action:@selector(sendMessege) title:@"发送"];

    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    rightBarButtonItem.style = UIBarButtonItemStyleBordered;
    rightBarButtonItem.enabled = NO;
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
}


-(void)addSubViews
{
    //输入
    UITextView *textView = [[UITextView alloc]initWithFrame:self.view.bounds];
    
    textView.font = [UIFont systemFontOfSize:18];
    
    textView.delegate = self;
    
    [self.view addSubview:textView];
    
    _textView = textView;
    
    //工具条
    CJComposeToolsView *composeTools = [[CJComposeToolsView alloc]initWithFrame:CGRectMake(0, ScreenHight - 50, ScreenWidth, 35)];
    composeTools.delegate = self;
    [self.view addSubview:composeTools];
    _toolsView = composeTools;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];

}

-(void)backToMainView
{
    [self.textView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)sendMessege
{
     NSLog(@"%s",__func__);

    
}

-(void)DidClickTools:(UIView *)toolsBar clickButton:(UIButton *)button
{
   NSLog(@"%s",__func__);
    
    if (button.tag == 11) {
        UIImagePickerController *pickerViewController = [[UIImagePickerController alloc]init];
        pickerViewController.sourceType = 2;
        
        pickerViewController.delegate = self;
        
        [self presentViewController:pickerViewController animated:YES completion:nil];
        
    }


}

#pragma mark -----PickerControllerDelegate-----
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo
{
    NSLog(@"%s",__func__);
    

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

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    [self.textView becomeFirstResponder];

}

@end

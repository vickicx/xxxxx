//
//  ZRXYViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/3/4.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "ZRXYViewController.h"

@interface ZRXYViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ZRXYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationItem.title = @"服务协议";
    
    self.navigationItem.leftBarButtonItem.title = @"返回";
    
    NSString *wholeUrl = [NSString stringWithFormat:@"%@%@", ProtocolURL, self.url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:wholeUrl]];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    [self.view addSubview:self.webView];
    [self.webView loadRequest:request];
    
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

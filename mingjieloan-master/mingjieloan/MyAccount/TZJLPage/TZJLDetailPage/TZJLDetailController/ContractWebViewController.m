//
//  ContractWebViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/7/20.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "ContractWebViewController.h"

@interface ContractWebViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *contractWebView;

@end

@implementation ContractWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.title = @"服务协议";
    
    
    self.contractWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    
    [self.view addSubview:self.contractWebView];
    
    self.contractWebView.delegate = self;
    
    self.contractWebView.scrollView.bounces = NO;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    
    [self.contractWebView loadRequest:request];
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

//
//  ZZChangeBoundPhoneNumVC.m
//  Mingjie
//
//  Created by zjj on 16/8/1.
//  Copyright © 2016年 Louding. All rights reserved.
//
//  修改电话号码的界面


#import "ZZChangeBoundPhoneNumVC.h"

@interface ZZChangeBoundPhoneNumVC()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *webView;

@end

@implementation ZZChangeBoundPhoneNumVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.title = @"铭捷贷";
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT)];
    _webView.delegate = self;
    [self.view addSubview: _webView];
    NSURL *url = [[NSURL alloc] initWithString:self.urlStr];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}


/**
 *设置数据
 */
- (void)setUrlStr:(NSString *)urlStr {
    
    _urlStr = urlStr;
    
    NSURL *url = [[NSURL alloc] initWithString:urlStr];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [self.webView loadRequest:request];
    
}


/**
 *view即将要离开屏幕
 */
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.title = @"铭捷贷";
    
}

/**
 *view即将要显示到屏幕
 */
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.title = @"铭捷贷";
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    
}

// webView(webView: UIWebView, shouldStartLoadWithRequest
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //NSLog(@"%@",request.mainDocumentURL.relativePath);

    NSString *urlStr =  [NSString stringWithFormat:@"%@",request.mainDocumentURL.relativePath];
    
    if (urlStr.length > 0) {
        
//        [HUDManager closeHUD];
    }

    
    return YES;
}



@end

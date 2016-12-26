//
//  DHFReportDetailViewController.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/25.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFReportDetailViewController.h"


@interface DHFReportDetailViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIWebView *summaryWebView;

@end

@implementation DHFReportDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self createHeaderView];
    
    self.summaryWebView = [[UIWebView alloc] initWithFrame:CGRectMake(10 * FitWidth, self.headerView.frame.size.height + 64, [UIScreen mainScreen].bounds.size.width - 10 * FitWidth, [UIScreen mainScreen].bounds.size.height - self.headerView.frame.size.height - 64)];
    [self.view addSubview:self.summaryWebView];
    
    self.summaryWebView.delegate = self;
    
    self.summaryWebView.scrollView.bounces = NO;
    
    [self.summaryWebView loadHTMLString:self.model.summary baseURL:nil];
}

- (void)createHeaderView
{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 100 * FitHeight)];
    [self.view addSubview:self.headerView];
    
    //    self.headerView.backgroundColor = [UIColor redColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * FitWidth, 15 * FitHeight, self.headerView.frame.size.width - 20 * FitWidth, 60 * FitHeight)];
    [self.headerView addSubview:titleLabel];
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    titleLabel.font = [UIFont systemFontOfSize:13];
    
    UILabel *sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * FitWidth, 15 * FitHeight + titleLabel.frame.size.height, 150 * FitWidth, 20 * FitHeight)];
    [self.headerView addSubview:sourceLabel];
    sourceLabel.textColor = [UIColor grayColor];
    sourceLabel.font = [UIFont systemFontOfSize:10];
    //    sourceLabel.backgroundColor = [UIColor yellowColor];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * FitWidth + sourceLabel.frame.size.width, 15 * FitHeight + titleLabel.frame.size.height, 150 * FitWidth, 20 * FitHeight)];
    [self.headerView addSubview:dateLabel];
    dateLabel.font = [UIFont systemFontOfSize:10];
    dateLabel.textColor = [UIColor grayColor];
    //    dateLabel.backgroundColor = [UIColor cyanColor];
    
    titleLabel.text = self.model.title;
    sourceLabel.text = [NSString stringWithFormat:@"来源：%@", self.model.source];
    dateLabel.text = [NSString stringWithFormat:@"收录时间：%@", self.model.publish_date];
    
}


/* webView自适应 */
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString *js=@"var script = document.createElement('script');"
    "script.type = 'text/javascript';"
    "script.text = \"function ResizeImages() { "
    "var myimg,oldwidth;"
    "var maxwidth = %f;"
    "for(i=0;i <document.images.length;i++){"
    "myimg = document.images[i];"
    "if(myimg.width > maxwidth){"
    "oldwidth = myimg.width;"
    "myimg.width = %f;"
    "}"
    "}"
    "}\";"
    "document.getElementsByTagName('head')[0].appendChild(script);";
    js=[NSString stringWithFormat:js,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.width-60];
    [webView stringByEvaluatingJavaScriptFromString:js];
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];
    
    //修改字体大小
    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '80%%'";
    [self.summaryWebView stringByEvaluatingJavaScriptFromString:str];
    
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

//
//  DHFNoticeDetailViewController.m
//  mingjieloan
//
//  Created by kang on 16/12/26.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFNoticeDetailViewController.h"

@interface DHFNoticeDetailViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIWebView *summaryWebView;

@end

@implementation DHFNoticeDetailViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBarController.tabBar.hidden=YES;
    
    self.summaryWebView = [[UIWebView alloc] initWithFrame:CGRectMake(10 * FitWidth, self.headerView.frame.size.height + 64, [UIScreen mainScreen].bounds.size.width - 10 * FitWidth, [UIScreen mainScreen].bounds.size.height - self.headerView.frame.size.height)];
    _summaryWebView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.summaryWebView];
    
    self.summaryWebView.delegate = self;
    
    self.summaryWebView.scrollView.bounces = NO;
    
    [self.summaryWebView loadHTMLString:self.noticeModel.content baseURL:nil];
    [self createHeaderView];
}

- (void)createHeaderView
{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 60 * FitHeight)];
    [self.view addSubview:self.headerView];
    
    //    self.headerView.backgroundColor = [UIColor redColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * FitWidth, 0, self.headerView.frame.size.width - 20 * FitWidth, 60 * FitHeight)];
    [self.headerView addSubview:titleLabel];
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
    titleLabel.font = [UIFont systemFontOfSize:13];
    
//    UILabel *sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10 * FitWidth, 15 * FitHeight + titleLabel.frame.size.height, 150 * FitWidth, 20 * FitHeight)];
//    [self.headerView addSubview:sourceLabel];
//    sourceLabel.textColor = [UIColor grayColor];
//    sourceLabel.font = [UIFont systemFontOfSize:10];
    //    sourceLabel.backgroundColor = [UIColor yellowColor];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH - 150 - 20, titleLabel.frame.size.height, 150, 20 * FitHeight)];
    dateLabel.textAlignment = NSTextAlignmentRight;
    [self.headerView addSubview:dateLabel];
    dateLabel.font = [UIFont systemFontOfSize:10];
    dateLabel.textColor = [UIColor grayColor];
    //    dateLabel.backgroundColor = [UIColor cyanColor];
    
    titleLabel.text = self.noticeModel.title;
    
    NSDateFormatter *pickerFormatter1 = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    [pickerFormatter1 setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:(long)_noticeModel.dateline];
    NSString *dateString = [pickerFormatter1 stringFromDate:confromTimesp];
    
    dateLabel.text = [NSString stringWithFormat:@"时间：%@", dateString];
    
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

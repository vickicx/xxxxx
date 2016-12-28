//
//  DHFHelpCenterViewController.m
//  
//
//  Created by 杜虹锋 on 2016/12/25.
//
//

#import "DHFHelpCenterViewController.h"

@interface DHFHelpCenterViewController ()<UIWebViewDelegate>

@end

@implementation DHFHelpCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"帮助中心";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    self.myWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT)];
    _myWebView.delegate = self;
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.dlmjcf.com/page/app/faq"]];
    [_myWebView loadRequest:request];
    //    [_myWebView reload];
    [self.view addSubview: _myWebView];
    
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

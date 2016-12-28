//
//  DHFGestureCloseVC.m
//  mingjieloan
//
//  Created by 杜虹锋 on 2016/12/27.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "DHFGestureCloseVC.h"

@interface DHFGestureCloseVC ()<KKGestureLockViewDelegate>
@end

@implementation DHFGestureCloseVC


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳过" style:UIBarButtonItemStyleDone target:self action:@selector(pass)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:@selector(noFunction)];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"手势密码解锁";
    self.view.backgroundColor = [UIColor whiteColor];
    NSDictionary * titleDict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    self.navigationController.navigationBar.titleTextAttributes = titleDict;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"gesture_passbg"];
    [self.view insertSubview:imageView atIndex:0];
    
    self.lockView = [[KKGestureLockView alloc] initWithFrame:CGRectMake(0, 64, kWIDTH, kHEIGHT - 64)];
    self.lockView.normalGestureNodeImage = [UIImage imageNamed:@"gesture_node_normal.png"];
    self.lockView.selectedGestureNodeImage = [UIImage imageNamed:@ "gesture_node_selected.png"];
    self.lockView.lineColor = GetColor(@"#19AFCC");
    self.lockView.lineWidth = 4;
    self.lockView.delegate = self;
    self.lockView.contentInsets = UIEdgeInsetsMake(150, 20, 100, 20);
    self.lockView.tag = 1;
    
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

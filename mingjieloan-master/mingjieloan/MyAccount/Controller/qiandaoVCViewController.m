//
//  qiandaoVCViewController.m
//  mingjieloan
//
//  Created by vicki on 2017/1/5.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "qiandaoVCViewController.h"

@interface qiandaoVCViewController ()

@end

@implementation qiandaoVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
    [self createView];
}

-(void)createView {
    UIImageView *images = [[UIImageView alloc] initWithFrame:CGRectMake(29 *FitWidth, 159 * FitHeight, kWIDTH - 60 *FitWidth, kHEIGHT - 300 * FitHeight)];
    images.image = [UIImage imageNamed:@"sign-10"];
    UIButton *knowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    knowBtn.frame = CGRectMake(70 * FitWidth, images.height - 60 * FitHeight, 80 * FitWidth, 30 * FitHeight);
    [knowBtn addTarget:self action:@selector(knowBtnDidSelected:) forControlEvents:UIControlEventTouchDown];
    [images addSubview:knowBtn];
    [self.view addSubview:images];
    
}

-(void)knowBtnDidSelected:(UIButton *)button {
    NSLog(@"知道了");
    
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

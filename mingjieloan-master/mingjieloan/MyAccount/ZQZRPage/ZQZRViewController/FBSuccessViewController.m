//
//  FBSuccessViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/3/3.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "FBSuccessViewController.h"
#import "LDY_RightChangeViewController.h"
#import "DepositsHistoryViewController.h"

@interface FBSuccessViewController ()

@end

@implementation FBSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIImageView *successImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, KWIDTH * 375, 667 * KHEIGHT - 54)];
    [self.view addSubview:successImageView];
    successImageView.image = [UIImage imageNamed:@"shenqingyifabu"];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 60, 25)];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftButton addTarget:self action:@selector(leftBarButtonItemClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = item;
}


- (void)leftBarButtonItemClicked
{
    
    if ([self.pageTag isEqualToString:@"1"]) {
        
        for (UIViewController *controller in self.navigationController.viewControllers) {
            
            if ([controller isKindOfClass:[LDY_RightChangeViewController class]])//ViewController是想要返回的页面
                
            {
                //一定要用popToViewController
                
                [self.navigationController popToViewController:controller animated:YES];
                
            }
        }
        
    }else{
        
        for (UIViewController *controller in self.navigationController.viewControllers) {
            
            if ([controller isKindOfClass:[DepositsHistoryViewController class]])//ViewController是想要返回的页面
                
            {
                //一定要用popToViewController
                
                [self.navigationController popToViewController:controller animated:YES];
                
            }
        }
        
    }
    
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

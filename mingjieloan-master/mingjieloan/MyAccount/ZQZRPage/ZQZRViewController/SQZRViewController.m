//
//  SQZRViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/3/2.
//  Copyright © 2016年 Louding. All rights reserved.
//
//  申请转让界面

#import "SQZRViewController.h"
#import "SQZR2TableViewCell.h"
#import "SQZR3TableViewCell.h"
#import "FBSuccessViewController.h"
#import "ZRXYViewController.h"
#import "LDY_RightChangeViewController.h"
#import "DepositsHistoryViewController.h"


@interface SQZRViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *secondView;

@property (nonatomic, strong) UIView *thirdView;

@property (nonatomic, strong) UITableView *sQZRTableView;

@property (nonatomic, strong) UIImageView *image1View;

@property (nonatomic, strong) UIImageView *image2View;

@property (nonatomic, strong) UIImageView *image3View;

@property (nonatomic, strong) UIImageView *image4View;

@property (nonatomic, strong) UIImageView *image5View;

@property (nonatomic, strong) UIImageView *image6View;

@property (nonatomic, strong) UIImageView *image7View;

@property (nonatomic, copy) NSString *transfer_capital;//转让本金

@property (nonatomic, copy) NSString *discount_amount;//折让金

//@property (nonatomic, strong) UITextField *zhuanRangBJTextField;

@property (nonatomic, strong) UILabel *zhuanRangBJLabel;

@property (nonatomic, strong) UITextField *zheRangLXJETextField;

@property (nonatomic, copy) NSString *zhuanrangbenjin;

@property (nonatomic, copy) NSString *zheranglixijine;

@property (nonatomic, assign) float suodelixi;

@property (nonatomic, strong) UIButton *btn1;

@property (nonatomic, strong) UIButton *btn3;

@property (nonatomic, copy) NSString *off_shelf_time;//预计下架时间

@property (nonatomic, copy) NSString *fundrais_term;//筹款时间

@property (nonatomic, copy) NSString *lave_date;//剩余期限

@property (nonatomic, copy) NSString *interest;//预期所得利息

@property (nonatomic, copy) NSString *finance_interest_rate;//预期年化收益率

@property (nonatomic, copy) NSString *procedure_cost;//手续费

@property (nonatomic, copy) NSString *listed_income;//挂牌收益率

@property (nonatomic, copy) NSString *products_title;//标名

@property (nonatomic, copy) NSString *tender_amount;//转让本金

@property (nonatomic, copy) NSString *url;//债权协议url

@property (nonatomic, copy) NSString *date;//项目期限

@property (nonatomic, copy) NSString *extra_rate;

@property (nonatomic, assign) NSInteger number;

@property (nonatomic, assign) BOOL isHaveDian;

@property (nonatomic, copy) NSString *transfer_tag;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) UILabel *bottomLabel;

/** 债权转让协议 */
@property (nonatomic, strong) UIButton *zrxyButton;

@end

@implementation SQZRViewController

- (UIButton *)zrxyButton {
    
    if (_zrxyButton == nil) {
        
        _zrxyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_zrxyButton setTitle:@"《债权转让协议》" forState:UIControlStateNormal];
        
    }
    
    return _zrxyButton;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationItem.title = @"申请转让";

    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftButton setFrame:CGRectMake(0, 0, 60, 25)];
    
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    
    [leftButton setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [leftButton addTarget:self action:@selector(leftBarButtonItemClicked) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = item;
    
    
    self.zhuanrangbenjin = @"";
    
    self.zheranglixijine = @"0";
    
    [self dataHandle];
    
    [self createTableView];
    
    // 创建一个富文本对象
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    // 设置富文本对象的颜色
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:13 * KWIDTH];
    
    self.zheRangLXJETextField = [[UITextField alloc] initWithFrame:CGRectMake(160 * KWIDTH, 135 * KHEIGHT + 45.5 * KHEIGHT * 2, 180 * KWIDTH, 30 * KHEIGHT)];
    
    [self.sQZRTableView addSubview:self.zheRangLXJETextField];
    
    self.zheRangLXJETextField.delegate = self;
    
    self.zheRangLXJETextField.tag = 90000;
    
    self.zheRangLXJETextField.keyboardType = UIKeyboardTypeDecimalPad;
    
    self.zheRangLXJETextField.returnKeyType = UIReturnKeyDone;
    
    self.zheRangLXJETextField.placeholder = @" 请输入金额";
    
    [self.zheRangLXJETextField setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    
    self.zheRangLXJETextField.backgroundColor = [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:241 / 255.0 alpha:1.0];
    
    [self.zheRangLXJETextField addTarget:self action:@selector(didChangeText:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    sendButton.frame = CGRectMake(13 * KWIDTH, 667 * KHEIGHT - 3 * KHEIGHT - 32 * KHEIGHT - 80 * KHEIGHT, KWIDTH * 375 - KWIDTH - 26 * KWIDTH, 32 * KHEIGHT);
    
    [self.sQZRTableView addSubview:sendButton];
    
    sendButton.backgroundColor = [XXColor btnGoldenColor];
    
    [sendButton setTitle:@"立 即 发 布" forState:UIControlStateNormal];
    
    [sendButton setTitleColor:[UIColor groupTableViewBackgroundColor] forState:UIControlStateNormal];
    
    sendButton.titleLabel.font = [UIFont systemFontOfSize:14 weight:6];
    
    [sendButton addTarget:self action:@selector(sendButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    //提示button
    UIImageView *tishi1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 75, KHEIGHT * 140, KWIDTH * 14, KHEIGHT * 14)];
    
    [self.sQZRTableView addSubview:tishi1ImageView];
    
    tishi1ImageView.image = [UIImage imageNamed:@"tishi"];
    
    self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.btn1.frame = CGRectMake(KWIDTH * 70, KHEIGHT * 140, KWIDTH * 20, KHEIGHT * 20);
    
    [self.sQZRTableView addSubview:self.btn1];
    
    self.btn1.tag = 11000;
    
    [self.btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *tishi2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 105, KHEIGHT * 140 + 45.5 * KHEIGHT, KWIDTH * 14, KHEIGHT * 14)];
    
    [self.sQZRTableView addSubview:tishi2ImageView];
    
    tishi2ImageView.image = [UIImage imageNamed:@"tishi"];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn2.frame = CGRectMake(KWIDTH * 105, KHEIGHT * 140 + 45.5 * KHEIGHT, KWIDTH * 20, KHEIGHT * 20);
    
    [self.sQZRTableView addSubview:btn2];
    
    btn2.tag = 12000;
    
    [btn2 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *tishi3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 105, KHEIGHT * 140 + 45.5 * KHEIGHT * 2, KWIDTH * 14, KHEIGHT * 14)];
    
    [self.sQZRTableView addSubview:tishi3ImageView];
    
    tishi3ImageView.image = [UIImage imageNamed:@"tishi"];
    
    self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.btn3.frame = CGRectMake(KWIDTH * 105, KHEIGHT * 140 + 45.5 * KHEIGHT * 2, KWIDTH * 20, KHEIGHT * 20);
    
    [self.sQZRTableView addSubview:self.btn3];
    
    self.btn3.tag = 13000;

    [self.btn3 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *tishi4ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 93, KHEIGHT * 140 + 45 * KHEIGHT * 3, KWIDTH * 14, KHEIGHT * 14)];
    
    [self.sQZRTableView addSubview:tishi4ImageView];
    
    tishi4ImageView.image = [UIImage imageNamed:@"tishi"];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn4.frame = CGRectMake(KWIDTH * 93, KHEIGHT * 140 + 45 * KHEIGHT * 3, KWIDTH * 20, KHEIGHT * 20);
    
    [self.sQZRTableView addSubview:btn4];
    
    btn4.tag = 14000;

    [btn4 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *tishi5ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 76, KHEIGHT * 140 + 44.5 * KHEIGHT * 4, KWIDTH * 14, KHEIGHT * 14)];
    [self.sQZRTableView addSubview:tishi5ImageView];
    tishi5ImageView.image = [UIImage imageNamed:@"tishi"];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(KWIDTH * 76, KHEIGHT * 140 + 44.5 * KHEIGHT * 4, KWIDTH * 20, KHEIGHT * 20);
    [self.sQZRTableView addSubview:btn5];
    btn5.tag = 15000;

    [btn5 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *tishi7ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 90, KHEIGHT * 140 + 44.5 * KHEIGHT * 6, KWIDTH * 14, KHEIGHT * 14)];
    [self.sQZRTableView addSubview:tishi7ImageView];
    tishi7ImageView.image = [UIImage imageNamed:@"tishi"];
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn7.frame = CGRectMake(KWIDTH * 90, KHEIGHT * 140 + 44.5 * KHEIGHT * 6, KWIDTH * 20, KHEIGHT * 20);
    [self.sQZRTableView addSubview:btn7];
    btn7.tag = 17000;

    [btn7 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *tishi6ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 76, KHEIGHT * 140 + 44.5 * KHEIGHT * 7, KWIDTH * 14, KHEIGHT * 14)];
    [self.sQZRTableView addSubview:tishi6ImageView];
    tishi6ImageView.image = [UIImage imageNamed:@"tishi"];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.frame = CGRectMake(KWIDTH * 76, KHEIGHT * 140 + 44.5 * KHEIGHT * 7, KWIDTH * 20, KHEIGHT * 20);
    [self.sQZRTableView addSubview:btn6];
    btn6.tag = 16000;

    [btn6 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.image1View = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 73, 150 * KHEIGHT, KWIDTH * 55, KHEIGHT * 25)];
    [self.sQZRTableView addSubview:self.image1View];
    self.image1View.image = [UIImage imageNamed:@"zhuanrangbenjin"];
    self.image1View.hidden = YES;
    
    self.image2View = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 49, 150 * KHEIGHT + 44.5 * KHEIGHT, KWIDTH * 245, KHEIGHT * 25)];
    [self.sQZRTableView addSubview:self.image2View];
    self.image2View.image = [UIImage imageNamed:@"yuqisuodelixi"];
    self.image2View.hidden = YES;

    self.image3View = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 93, 150 * KHEIGHT + 44.5 * KHEIGHT * 2, KWIDTH * 170, KHEIGHT * 25)];
    [self.sQZRTableView addSubview:self.image3View];
    self.image3View.image = [UIImage imageNamed:@"zheranglixijine"];
    self.image3View.hidden = YES;

    self.image4View = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 46, 150 * KHEIGHT + 44.5 * KHEIGHT * 3, KWIDTH * 240, KHEIGHT * 40)];
    [self.sQZRTableView addSubview:self.image4View];
    self.image4View.image = [UIImage imageNamed:@"zhuanrangshouxufei"];
    self.image4View.hidden = YES;

    self.image5View = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 48, 150 * KHEIGHT + 44.5 * KHEIGHT * 4, KWIDTH * 200, KHEIGHT * 25)];
    [self.sQZRTableView addSubview:self.image5View];
    self.image5View.image = [UIImage imageNamed:@"zhuanrangjiage"];
    self.image5View.hidden = YES;

    self.image7View = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 80, 150 * KHEIGHT + 44.5 * KHEIGHT * 6, KWIDTH * 105, KHEIGHT * 25)];
    [self.sQZRTableView addSubview:self.image7View];
    self.image7View.image = [UIImage imageNamed:@"guapaishouyilv"];
    self.image7View.hidden = YES;
    
    self.image6View = [[UIImageView alloc] initWithFrame:CGRectMake(KWIDTH * 24, 150 * KHEIGHT + 44.5 * KHEIGHT * 7, KWIDTH * 270, KHEIGHT * 45)];
    [self.sQZRTableView addSubview:self.image6View];
    self.image6View.image = [UIImage imageNamed:@"choukuanqixian"];
    self.image6View.hidden = YES;
    
    
    //UIButton *zrxyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.zrxyButton.frame = CGRectMake(180 * KWIDTH, 667 * KHEIGHT - 35 * KHEIGHT - sendButton.frame.size.height - 80 * KHEIGHT, KWIDTH * 150, KHEIGHT * 30);
    [self.sQZRTableView addSubview:self.zrxyButton];
    self.zrxyButton.titleLabel.font = [UIFont systemFontOfSize:12 * KWIDTH];
    [self.zrxyButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
    [self.zrxyButton addTarget:self action:@selector(zrxyButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(100 * KWIDTH, 667 * KHEIGHT - 35 * KHEIGHT - sendButton.frame.size.height - 80 * KHEIGHT, 375 * KWIDTH - 150 * KWIDTH, 30 * KHEIGHT)];
    [self.sQZRTableView addSubview:bottomLabel];
    bottomLabel.font = [UIFont systemFontOfSize:12 * KWIDTH];
    bottomLabel.text = @"我已仔细阅读并签署";
    self.bottomLabel = bottomLabel;
    [bottomLabel sizeToFit];
    bottomLabel.height =  30 * KHEIGHT;
    self.zrxyButton.x = CGRectGetMaxX(self.bottomLabel.frame);
    
}


- (void)leftBarButtonItemClicked {
    
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


- (void)publishDataHandle {
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&products_title=%@&oid_tender_id=%@&transfer_capital=%@&discount_amount=%@&tender_from=%@", self.sid, self.products_title, self.oid_tender_id, self.tender_amount, self.zheRangLXJETextField.text, self.tender_from];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, FBZR];
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
       
          //NSLog(@"SQZR ====== %@", result);
        
        self.transfer_tag = [result objectForKey:@"transfer_tag"];
        
        self.msg = [result objectForKey:@"msg"];
        
        
    }fail:^(NSError *error) {
        
    
    }];
    
}


//滑动屏幕时进行计算，并且收回键盘
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {

    if (self.zheRangLXJETextField) {
        
        if (![self.zheRangLXJETextField.text isEqualToString:@""]){
            
            self.zheranglixijine = self.zheRangLXJETextField.text;
            
            if ([self.zheRangLXJETextField.text floatValue] > [self.interest floatValue]) {
                
                self.image3View.hidden = NO;
                
                self.zheranglixijine = nil;
                
                self.zheRangLXJETextField.text = nil;
                
                self.btn3.selected = YES;
                
            }else{
                
                [self dataHandle];

            }
            
            [self.sQZRTableView reloadData];
            
            [self.zheRangLXJETextField resignFirstResponder];
            
        }
        
    }
    
    [self.zheRangLXJETextField resignFirstResponder];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //判断是否有“.”
    if ([textField.text rangeOfString:@"."].location == NSNotFound) {
        
        self.isHaveDian = NO;
        
    }
    
    if ([string length] > 0) {
        
        //当前输入的字符
        unichar single = [string characterAtIndex:0];
        
        //数据格式正确
        if ((single >= '0' && single <= '9') || single == '.') {
            
            //首字母不能为小数点
            if([textField.text length] == 0){
                
                if(single == '.') {
                    
                    return NO;
                }
            }
            
            //输入的字符是否是小数点
            if (single == '.') {
                if(!self.isHaveDian)//text中还没有小数点
                {
                    self.isHaveDian = YES;
                    
                    return YES;
                    
                }else{
                    
                    return NO;
                
                }
            
            }else{
                
                //存在小数点
                if (self.isHaveDian) {
                    
                    //判断小数点的位数
                    NSRange ran = [textField.text rangeOfString:@"."];
                    
                    if (range.location - ran.location <= 2) {
                        
                        return YES;
                    
                    }else{
                        
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: @"折让利息金额不能超过两位小数" preferredStyle:UIAlertControllerStyleAlert];
                        
                        UIAlertAction *defautAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                            [self dismissViewControllerAnimated:alert completion:nil];
                        }];
                        
                        [alert addAction:defautAction];
                        
                        [self presentViewController:alert animated:YES completion:nil];
                        
                        return NO;
                        
                    }
                
                }else{
                    
                    return YES;
                    
                }
            }
        }else{
            
            //输入的数据格式不正确
            return NO;
            
        }

    }
    
    return YES;
}







- (void)didChangeText:(UITextField *)textField {
    
    NSRange range = [textField.text rangeOfString:@"^[\u4e00-\u9fa5]{0,}$" options:NSRegularExpressionSearch];
    
    if (range.location != NSNotFound) {
        
        textField.text = @"";
    }
}


//编辑完成后进行计算
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    self.zheranglixijine = textField.text;
    
    if ([textField.text floatValue] > self.interest.floatValue) {
    
        self.image3View.hidden = NO;
    
        self.zheranglixijine = nil;
    
        textField.text = nil;
                
        self.btn3.selected = YES;

    }
            
    [self.sQZRTableView reloadData];
    
    [textField resignFirstResponder];
    
    
    [self dataHandle];
    
}

//债权转让协议页面
- (void)zrxyButtonClicked:(UIButton *)button {
    
    ZRXYViewController *zrxy = [[ZRXYViewController alloc] init];
    
    zrxy.url = self.url;
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:zrxy animated:YES];
}


- (void)btnClicked:(UIButton *)button {
    
    button.selected = !button.isSelected;
    if (button.tag == 11000) {
        if (button.selected) {
            self.image1View.hidden = NO;
        }else{
            self.image1View.hidden = YES;
        }
    }else if (button.tag == 12000){
        if (button.selected) {
            self.image2View.hidden = NO;
        }else{
            self.image2View.hidden = YES;
        }
        
    }else if (button.tag == 13000){
        if (button.selected) {
            self.image3View.hidden = NO;
        }else{
            self.image3View.hidden = YES;
        }
        
    }else if (button.tag == 14000){
        if (button.selected) {
            self.image4View.hidden = NO;
        }else{
            self.image4View.hidden = YES;
        }
        
    }else if (button.tag == 15000){
        if (button.selected) {
            self.image5View.hidden = NO;
        }else{
            self.image5View.hidden = YES;
        }
        
    }else if (button.tag == 16000){
        if (button.selected) {
            self.image6View.hidden = NO;
        }else{
            self.image6View.hidden = YES;
        }
        
    }else{
        
        if (button.selected) {
            self.image7View.hidden = NO;
        }else{
            self.image7View.hidden = YES;
        }
        
    }
}


- (void)sendButtonClicked:(UIButton *)button {
    
    if ([self.tender_amount isEqualToString:@""] || self.tender_amount == nil) {
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您有未填写信息" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [al show];
        [self.view addSubview:al];
        
    }else{
    
        if ([self.listed_income floatValue] > 24) {
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: @"挂牌收益率不能超过24%，请重新输入折让利息金额" preferredStyle:UIAlertControllerStyleAlert];
            
            
            UIAlertAction *defautAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [self dismissViewControllerAnimated:alert completion:nil];
            }];
            
            [alert addAction:defautAction];
            
            [self presentViewController:alert animated:YES completion:nil];
            
        }else{
            
            if ([self.zheRangLXJETextField.text isEqualToString:@""]) {
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: @"请输入折让利息金额" preferredStyle:UIAlertControllerStyleAlert];
                
                
                UIAlertAction *defautAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self dismissViewControllerAnimated:alert completion:nil];
                }];
                
                [alert addAction:defautAction];
                
                [self presentViewController:alert animated:YES completion:nil];
                
            }else{
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: @"您确定转让该产品吗？" preferredStyle:UIAlertControllerStyleAlert];
                
                
                UIAlertAction *defautAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    
                    NSString *body = [NSString stringWithFormat:@"sid=%@&products_title=%@&oid_tender_id=%@&transfer_capital=%@&discount_amount=%@&tender_from=%@", self.sid, self.products_title, self.oid_tender_id, self.tender_amount, self.zheRangLXJETextField.text, self.tender_from];
                    
                    
                    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, FBZR];
                    
                    //NSLog(@"body ===== %@", body);
                    
                    
                    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
                        
                    } success:^(id result) {
                        
                        //NSLog(@"SQZR ====== %@", result);
                        
                        self.transfer_tag = [result objectForKey:@"transfer_tag"];
                        
                        self.msg = [result objectForKey:@"msg"];
                        
                        if ([self.transfer_tag isEqualToString:@"1"]) {
                            
                            FBSuccessViewController *fbcg = [[FBSuccessViewController alloc] init];
                            
                            UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
                            
                            backIetm.title = @"返回";
                            
                            self.navigationItem.backBarButtonItem = backIetm;
                            
                            fbcg.pageTag = self.pageTag;
                            
                            [self.navigationController pushViewController:fbcg animated:YES];
                            
                        }else{
                            
                            [UIhelper showToast:self.msg view:self.view];
                            
                        }
                    }fail:^(NSError *error) {
                        
                    }];

                    
                }];
                
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self dismissViewControllerAnimated:alert completion:nil];
                    
                }];
                
                [alert addAction:cancelAction];
                
                [alert addAction:defautAction];
                
                [self presentViewController:alert animated:YES completion:nil];
                
            }
            
            
            
            
        }
    }
}



- (void)dataHandle {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, SQZR];
    
    NSString *body = [NSString string];
    
    if ([self.zheRangLXJETextField.text isEqualToString:@""]) {
        
        body = [NSString stringWithFormat:@"tenderFrom=%@&oid_tender_id=%@&discount=%d&sid=%@", self.tender_from, self.oid_tender_id, 0, self.sid];
        
    }else{
        
        body = [NSString stringWithFormat:@"tenderFrom=%@&oid_tender_id=%@&discount=%@&sid=%@", self.tender_from, self.oid_tender_id, self.zheRangLXJETextField.text, self.sid];

    }

    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {

        
        NSString *titleStr = [NSString stringWithFormat:@"  %@",[result objectForKey:@"agreement_name"]];
        
        [self.zrxyButton setTitle:titleStr forState:UIControlStateNormal];
        
        //第一步: 设置文本的最大显示范围
        CGSize size = CGSizeMake(MAXFLOAT, 30);
        
        //第二步: 设置字体样式
        NSDictionary *dic = [NSDictionary dictionaryWithObject:self.zrxyButton.titleLabel.font forKey:NSFontAttributeName];
        
        CGRect titleSize = [titleStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        UIWindow *winfow = [UIApplication sharedApplication].keyWindow;
        
        self.bottomLabel.x = (winfow.width - titleSize.size.width - self.bottomLabel.width) * 0.5;
            
        self.zrxyButton.x = CGRectGetMaxX(self.bottomLabel.frame);
        
        self.zrxyButton.width = titleSize.size.width;
        
        self.off_shelf_time = [result objectForKey:@"off_shelf_time"];
        
        self.extra_rate = [result objectForKey:@"extra_rate"];
        
        self.fundrais_term = [result objectForKey:@"fundrais_term"];
        
        self.lave_date = [result objectForKey:@"lave_date"];

        self.interest = [result objectForKey:@"interest"];

        self.finance_interest_rate = [result objectForKey:@"finance_interest_rate"];

        self.procedure_cost = [result objectForKey:@"procedure_cost"];
        
        self.listed_income = [result objectForKey:@"listed_income"];
        
        self.products_title = [result objectForKey:@"products_title"];
        
        self.tender_amount = [result objectForKey:@"tender_amount"];
        
        self.url = [result objectForKey:@"url"];
        
        self.date = [result objectForKey:@"date"];
        
        self.number = 3;
        
        if (self.number == 3) {
            
            [self.sQZRTableView reloadData];
        }
    }fail:^(NSError *error) {
        
    
    }];
    
}


- (void)createTableView
{
    self.sQZRTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 - 1 * KHEIGHT, KWIDTH * 375, 667 * KHEIGHT - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:self.sQZRTableView];
    self.sQZRTableView.delegate = self;
    self.sQZRTableView.dataSource = self;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *titleCell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell"];
        if (!titleCell) {
            titleCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TitleCell"];
        }
        
        titleCell.textLabel.text = self.products_title;
        titleCell.textLabel.font = [UIFont systemFontOfSize:14.5 * KWIDTH];
        titleCell.textLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
        
        [titleCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return titleCell;
    }else if (indexPath.section == 1){
        SQZR2TableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:@"SQZR2TableViewCell"];
        if (!secondCell) {
            secondCell = [[SQZR2TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SQZR2TableViewCell"];
        }
        
        secondCell.shengYuQXlabel.text = @"项目期限";
        
        secondCell.restDayLabel.text = [NSString stringWithFormat:@"%@", self.date];
        
        secondCell.yuJiNHSYLLabel.text = @"预期年化收益率";
        
        NSString *str = @"%";
        
        
        if (![self.extra_rate isEqualToString:@""]) {
            
            secondCell.yuJiNHRateLabel.text = [NSString stringWithFormat:@"%.2f+%.2f%@", [self.finance_interest_rate floatValue], [self.extra_rate floatValue], str];
            
        }else{
            
            secondCell.yuJiNHRateLabel.text = [NSString stringWithFormat:@"%@%@", self.finance_interest_rate, str];
        }
        
        
        [secondCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return secondCell;
    }else{
        SQZR3TableViewCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:@"SQZR3TableViewCell"];
        if (!thirdCell) {
            thirdCell = [[SQZR3TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SQZR3TableViewCell"];
        }
        
        thirdCell.zhuanRangBJLabel.text = @"转让本金";
        thirdCell.yuQiSDLXLabel.text = @"预期所得利息";
        thirdCell.zheRangLXJELabel.text = @"折让利息金额";
        thirdCell.zhuanRangSXFLabel.text = @"转让手续费";
        thirdCell.zhuanRangJGLabel.text = @"转让价格";
        thirdCell.shengYuQX2Label.text = @"剩余期限";
        thirdCell.guaPaiSYLLabel.text = @"挂牌收益率";
        thirdCell.chouKuanQXLabel.text = @"筹款期限";
        thirdCell.yuJiXJSJLabel.text = @"预计下架时间";
        
        thirdCell.zhuanRangbenjinLabel.text = [NSString stringWithFormat:@"%@元", self.tender_amount];
        
        
        thirdCell.yuQiSDRateLabel.text = [NSString stringWithFormat:@"%@元", self.interest];
        
        thirdCell.zhuanRangSXFeeLabel.text = [NSString stringWithFormat:@"%@元", self.procedure_cost];
        
        self.suodelixi = self.interest.floatValue;
        
//
        NSString *amount = [self.tender_amount stringByReplacingOccurrencesOfString:@"," withString:@""];
//
//            float zherlx = [self.zheranglixijine floatValue];
//            
//            //转让金额 = 转让本金 + 预期所得利息 - 折让利息金额
        float zrjg = [amount floatValue] + [self.interest floatValue] - [self.zheRangLXJETextField.text floatValue];
//
//            
        thirdCell.zhuanRangPriceLabel.text = [NSString stringWithFormat:@"%.2f元", zrjg];
        
        
        NSString *str = @"%";
        
        thirdCell.shengYuDay2Label.text = [NSString stringWithFormat:@"%@天", self.lave_date];
        
        
        thirdCell.guaPaiRateLabel.text = [NSString stringWithFormat:@"%@%@", self.listed_income, str];
        
        thirdCell.chouKuanDeadLineLabel.text = @"24小时";
        
        
        thirdCell.yuJiXJTimeLabel.text = [NSString stringWithFormat:@"%@", self.off_shelf_time];
        
        
        [thirdCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return thirdCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 40 * KHEIGHT;
    }else if (indexPath.section == 1){
        
        return 75 * KHEIGHT;
    }else{
        
        return 400 * KHEIGHT;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 1 * KHEIGHT;
        
    }else{
        
    return 2.4 * KHEIGHT;
    
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1 * KHEIGHT;
}


@end

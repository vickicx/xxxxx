//
//  HYZXViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/5/20.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "HYZXViewController.h"
#import "HYZXCell.h"
#import "HYZXHeadView.h"
#import "HYZXHead2View.h"
#import "OTPageScrollView.h"
#import "OTPageView.h"
#import "HYGZViewController.h"
#import "JFJLViewController.h"
#import "SRHBViewController.h"
#import "JFViewController.h"

@interface HYZXViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, OTPageScrollViewDataSource,OTPageScrollViewDelegate>

@property (nonatomic, strong) UITableView *huiyuanzhongxinTableView;

@property (nonatomic, strong) UIView *viewXXX;

@property (nonatomic, strong) HYZXHeadView *hyzxHeadView;

@property (nonatomic, strong) HYZXHead2View *hyzxHead2View;

@property (nonatomic, strong) UIView *diaphanous1View;

@property (nonatomic, strong) UIView *diaphanous2View;

@property (nonatomic, strong) UIView *diaphanous3View;

@property (nonatomic, strong) UILabel *zongzichanTitleLabel;

@property (nonatomic, strong) UILabel *kaquanTitleLabel;

@property (nonatomic, strong) UILabel *wodejifenTitleLabel;

@property (nonatomic, strong) UILabel *zongzichanLabel;

@property (nonatomic, strong) UILabel *kaquanLabel;

@property (nonatomic, strong) UILabel *wodejifenLabel;

@property (nonatomic, strong) UIButton *zongzichanButton;

@property (nonatomic, strong) UIButton *wodekaquanButton;

@property (nonatomic, strong) UIButton *wodejifenButton;

@property (nonatomic, strong) OTPageView *pScrollView;

@property (nonatomic, copy) NSNumber *coupons;//我的卡卷

@property (nonatomic, copy) NSString *average_assets;//本月日均总资产

@property (nonatomic, copy) NSNumber *status;

@property (nonatomic, copy) NSNumber *member_level;//会员级别

@property (nonatomic, copy) NSString *integral;//我的积分

@property (nonatomic, assign) NSInteger current;

@property (nonatomic, assign) NSInteger currentSelect;

@property (nonatomic, assign) NSInteger sex;

@property (nonatomic, copy) NSString *headerPicName;

@end

@implementation HYZXViewController
{
    NSMutableArray *_dataArray;
}

/**
 * XXXXX
 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        _dataArray = [NSMutableArray array];
    }
    
    return self;
}


/**
 * XXXXX
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.navigationItem.title = @"会员中心";
    
    [self dataHandle];
    
    [self createTableView];
}


/**
 * XXXXX
 */
- (void)dataHandle {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, HYZX];
    
    NSString *body = [NSString stringWithFormat:@"sid=%@", self.sid];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {

        
        self.coupons = [result objectForKey:@"coupons"];
        
        NSString *zongzichan = [NSString stringWithFormat:@"%@", [result objectForKey:@"average_assets"]];
        
        self.average_assets = [[self class] countNumAndChangeformat:zongzichan];
        
        self.status = [result objectForKey:@"status"];
        
        self.member_level = [result objectForKey:@"member_level"];
        
        NSString *wodejifen = [NSString stringWithFormat:@"%@", [result objectForKey:@"integral"]];
        
        self.integral = [[self class] countNumAndChangeformat:wodejifen];
        
        self.zongzichanLabel.text = [NSString stringWithFormat:@"%@", self.average_assets];
        
        self.kaquanLabel.text = [NSString stringWithFormat:@"%@", self.coupons];
        
        self.wodejifenLabel.text = [NSString stringWithFormat:@"%@", self.integral];
        
        _dataArray = [result objectForKey:@"integralList"];
        
        self.sex = [[result objectForKey:@"sex"] integerValue];
        
        //会员等级
        self.current = [[result objectForKey:@"member_level"] integerValue];
        
        self.currentSelect = self.current - 1;
        
        if (self.current > 2) {
            
            self.hyzxHead2View.carBackImageView.hidden = YES;
            
            self.hyzxHead2View.jifenjiangliButton.hidden = NO;
            self.hyzxHead2View.jifenjiangliLabel.hidden = NO;
            
            self.hyzxHead2View.shengrihongbaoButton.hidden = NO;
            self.hyzxHead2View.shengrihongbaoLabel.hidden = NO;
            
            self.hyzxHead2View.moreImageView.hidden = NO;
            self.hyzxHead2View.jingqingqidaiLabel.hidden = NO;
            
            self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"我的特权"];
            self.hyzxHead2View.tequanNumLabel.text = @"共2项";
            
        }else{
            
            self.hyzxHead2View.carBackImageView.hidden = NO;
            self.hyzxHead2View.carBackImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"car%ld", self.current]];
            
            self.hyzxHead2View.jifenjiangliButton.hidden = YES;
            self.hyzxHead2View.jifenjiangliLabel.hidden = YES;
            
            self.hyzxHead2View.shengrihongbaoButton.hidden = YES;
            self.hyzxHead2View.shengrihongbaoLabel.hidden = YES;
            
            self.hyzxHead2View.moreImageView.hidden = YES;
            self.hyzxHead2View.jingqingqidaiLabel.hidden = YES;
            
            self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"我的特权"];
            self.hyzxHead2View.tequanNumLabel.text = @"共0项";
        }
        
        if (self.current > 2 && self.current != 3) {
            
            self.hyzxHead2View.carBackImageView.hidden = YES;
            
            self.hyzxHead2View.jifenjiangliButton.hidden = NO;
            self.hyzxHead2View.jifenjiangliLabel.hidden = NO;
            
            self.hyzxHead2View.shengrihongbaoButton.hidden = NO;
            self.hyzxHead2View.shengrihongbaoLabel.hidden = NO;
            self.hyzxHead2View.shengrihongbaoButton.frame = CGRectMake(152 * FitWidth, 50 * FitHeight, 70 * FitWidth, 70 * FitWidth);
            self.hyzxHead2View.shengrihongbaoLabel.frame = CGRectMake(152 * FitWidth, 50 * FitHeight + self.hyzxHead2View.shengrihongbaoButton.frame.size.height, 70 * FitWidth, 25 * FitWidth);
            
            self.hyzxHead2View.moreImageView.hidden = NO;
            self.hyzxHead2View.jingqingqidaiLabel.hidden = NO;
            self.hyzxHead2View.moreImageView.frame = CGRectMake(375 * FitWidth - 110 * FitWidth, 50 * FitHeight, 70 * FitWidth, 70 * FitHeight);
            self.hyzxHead2View.jingqingqidaiLabel.frame = CGRectMake(375 * FitWidth - 110 * FitWidth, 50 * FitHeight + self.hyzxHead2View.moreImageView.frame.size.height, 70 * FitWidth, 25 * FitHeight);
            
            self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
            self.hyzxHead2View.tequanNumLabel.text = @"共2项";
            
        }else if (self.current == 3){
            
            self.hyzxHead2View.carBackImageView.hidden = YES;
            
            self.hyzxHead2View.jifenjiangliButton.hidden = NO;
            self.hyzxHead2View.jifenjiangliLabel.hidden = NO;
            
            self.hyzxHead2View.shengrihongbaoButton.hidden = YES;
            self.hyzxHead2View.shengrihongbaoLabel.hidden = YES;
            
            self.hyzxHead2View.moreImageView.hidden = NO;
            self.hyzxHead2View.jingqingqidaiLabel.hidden = NO;
            self.hyzxHead2View.moreImageView.frame = CGRectMake(152 * FitWidth, 50 * FitHeight, 70 * FitWidth, 70 * FitWidth);
            self.hyzxHead2View.jingqingqidaiLabel.frame = CGRectMake(152 * FitWidth, 50 * FitHeight + self.hyzxHead2View.moreImageView.frame.size.height, 70 * FitWidth, 25 * FitWidth);
            
            self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
            self.hyzxHead2View.tequanNumLabel.text = @"共1项";
            
        }
        else{
            
            self.hyzxHead2View.carBackImageView.hidden = NO;
            self.hyzxHead2View.carBackImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"car%ld", self.currentSelect + 1]];
            
            self.hyzxHead2View.jifenjiangliButton.hidden = YES;
            self.hyzxHead2View.jifenjiangliLabel.hidden = YES;
            
            self.hyzxHead2View.shengrihongbaoButton.hidden = YES;
            self.hyzxHead2View.shengrihongbaoLabel.hidden = YES;
            
            self.hyzxHead2View.moreImageView.hidden = YES;
            self.hyzxHead2View.jingqingqidaiLabel.hidden = YES;
            
            self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
            self.hyzxHead2View.tequanNumLabel.text = @"共0项";
        }
        
        
        
        self.pScrollView.pageScrollView.contentOffset = CGPointMake(80 * (self.current - 1), 0);
        
        
        
        [self.huiyuanzhongxinTableView reloadData];
        
        [self.pScrollView.pageScrollView reloadData];
        
         } fail:^(NSError *error) {
             
    }];
    
}



/**
 * XXXXX
 */
+(NSString *)countNumAndChangeformat:(NSString *)num {
    
    int count = 0;
    
    long long int a = num.longLongValue;
    
    while (a != 0) {
        
        count++;
        
        a /= 10;
    }
    
    NSMutableString *string = [NSMutableString stringWithString:num];
    
    NSMutableString *newstring = [NSMutableString string];
    
    while (count > 3) {
        
        count -= 3;
        
        NSRange rang = NSMakeRange(string.length - 3, 3);
        
        NSString *str = [string substringWithRange:rang];
        
        [newstring insertString:str atIndex:0];
        
        [newstring insertString:@"," atIndex:0];
        
        [string deleteCharactersInRange:rang];
        
    }
    
    [newstring insertString:string atIndex:0];
    
    return newstring;
}


/**
 * XXXXX
 */
- (void)createTableView {
    
    self.huiyuanzhongxinTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 375 * FitWidth, 667 * FitHeight - 64) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.huiyuanzhongxinTableView];
    
    self.huiyuanzhongxinTableView.delegate = self;
    
    self.huiyuanzhongxinTableView.dataSource = self;
    
    //会员中心的背景图
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 300 * FitHeight)];
    
    [self.huiyuanzhongxinTableView addSubview:backImageView];
    
    backImageView.image = [UIImage imageNamed:@"assetsSum"];
    
    
    //滑动的模块
    self.pScrollView = [[OTPageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 180 * FitHeight)];
    
    self.pScrollView.pageScrollView.dataSource = self;
    
    self.pScrollView.pageScrollView.delegate = self;
    
    self.pScrollView.pageScrollView.padding =1;
    
    self.pScrollView.pageScrollView.leftRightOffset = 0;
    
    self.pScrollView.pageScrollView.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width -80)/2, 10 * FitHeight, 80, 100);
  
    self.viewXXX = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 180 * FitHeight)];
    
    [self.viewXXX addSubview:self.pScrollView];
    
    [self.huiyuanzhongxinTableView addSubview:self.viewXXX];
    
    UIView *arrowView = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2-2, 260, 4, 10)];
    
    arrowView.backgroundColor = [UIColor colorWithRed:239.0f/255.0f green:79.0f/255.0f blue:104.0f/255.0f alpha:1.0f];
    
    [self.huiyuanzhongxinTableView addSubview:arrowView];
    
    //资产的值view
    self.diaphanous1View = [[UIView alloc] initWithFrame:CGRectMake(0, 180 * FitHeight - 30 * FitHeight, 124 * FitWidth, 60 * FitHeight)];
    
    [self.huiyuanzhongxinTableView addSubview:self.diaphanous1View];
    
    self.diaphanous1View.backgroundColor = [XXColor goldenColor];
    
    self.diaphanous1View.alpha = 0.1;
    
    self.diaphanous2View = [[UIView alloc] initWithFrame:CGRectMake(125 * FitWidth, 180 * FitHeight - 30 * FitHeight, 124 * FitWidth, 60 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.diaphanous2View];
    self.diaphanous2View.backgroundColor = [XXColor goldenColor];
    self.diaphanous2View.alpha = 0.1;
    
    self.diaphanous3View = [[UIView alloc] initWithFrame:CGRectMake(250 * FitWidth, 180 * FitHeight - 30 * FitHeight, 124 * FitWidth, 60 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.diaphanous3View];
    self.diaphanous3View.backgroundColor = [XXColor goldenColor];
    self.diaphanous3View.alpha = 0.1;
    
    self.zongzichanTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 180 * FitHeight - 25 * FitHeight, 124 * FitWidth, 30 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.zongzichanTitleLabel];
    self.zongzichanTitleLabel.font = [UIFont systemFontOfSize:13.5 * FitWidth];
    self.zongzichanTitleLabel.textColor = [UIColor whiteColor];
    self.zongzichanTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.zongzichanTitleLabel.text = @"本月日均总资产";
    
    self.kaquanTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(125 * FitWidth, 180 * FitHeight - 25 * FitHeight, 124 * FitWidth, 30 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.kaquanTitleLabel];
    self.kaquanTitleLabel.font = [UIFont systemFontOfSize:13.5 * FitWidth];
    self.kaquanTitleLabel.textColor = [UIColor whiteColor];
    self.kaquanTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.kaquanTitleLabel.text = @"我的卡券";
    
    self.wodejifenTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(250 * FitWidth, 180 * FitHeight - 25 * FitHeight, 124 * FitWidth, 30 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.wodejifenTitleLabel];
    self.wodejifenTitleLabel.font = [UIFont systemFontOfSize:13.5 * FitWidth];
    self.wodejifenTitleLabel.textColor = [UIColor whiteColor];
    self.wodejifenTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.wodejifenTitleLabel.text = @"我的积分";
    
    self.zongzichanLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 180 * FitHeight - 30 * FitHeight + 30 * FitHeight, 124 * FitWidth, 30 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.zongzichanLabel];
    self.zongzichanLabel.textAlignment = NSTextAlignmentCenter;
    self.zongzichanLabel.textColor = [UIColor whiteColor];
    self.zongzichanLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.zongzichanLabel.font = [UIFont fontWithName:@"Avenir" size:13];
    
    self.kaquanLabel = [[UILabel alloc] initWithFrame:CGRectMake(125 * FitWidth, 180 * FitHeight - 30 * FitHeight + 30 * FitHeight, 124 * FitWidth, 30 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.kaquanLabel];
    self.kaquanLabel.textAlignment = NSTextAlignmentCenter;
    self.kaquanLabel.textColor = [UIColor whiteColor];
    self.kaquanLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.kaquanLabel.font = [UIFont fontWithName:@"Avenir" size:13];
    
    self.wodejifenLabel = [[UILabel alloc] initWithFrame:CGRectMake(250 * FitWidth, 180 * FitHeight - 30 * FitHeight + 30 * FitHeight, 124 * FitWidth, 30 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.wodejifenLabel];
    self.wodejifenLabel.textAlignment = NSTextAlignmentCenter;
    self.wodejifenLabel.textColor = [UIColor whiteColor];
    self.wodejifenLabel.font = [UIFont systemFontOfSize:13 * FitWidth];
    self.wodejifenLabel.font = [UIFont fontWithName:@"Avenir" size:13];
    
    self.zongzichanButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 180 * FitHeight - 30 * FitHeight, 124 * FitWidth, 60 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.zongzichanButton];
    [self.zongzichanButton addTarget:self action:@selector(zongzichanButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.wodekaquanButton = [[UIButton alloc] initWithFrame:CGRectMake(125 * FitWidth, 180 * FitHeight - 30 * FitHeight, 124 * FitWidth, 60 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.wodekaquanButton];
    [self.wodekaquanButton addTarget:self action:@selector(wodekaquanButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.wodejifenButton = [[UIButton alloc] initWithFrame:CGRectMake(250 * FitWidth, 180 * FitHeight - 30 * FitHeight, 124 * FitWidth, 60 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.wodejifenButton];
    [self.wodejifenButton addTarget:self action:@selector(wodejifenButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.hyzxHead2View = [[HYZXHead2View alloc] initWithFrame:CGRectMake(0, 210 * FitHeight, 375 * FitWidth, 180 * FitHeight)];
    [self.huiyuanzhongxinTableView addSubview:self.hyzxHead2View];
    self.hyzxHead2View.backgroundColor = [UIColor whiteColor];
    
    [self.hyzxHead2View.huiyuanguizeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    [self.hyzxHead2View.huiyuanguizeButton addTarget:self action:@selector(huiyuanguizeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.hyzxHead2View.jifenjiangliButton addTarget:self action:@selector(jifenjiangliButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.hyzxHead2View.shengrihongbaoButton addTarget:self action:@selector(shengrihongbaoButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}


/**
 * XXXXX
 */
- (void)zongzichanButtonClicked:(UIButton *)button {
    
    HYGZViewController *hygzViewController = [[HYGZViewController alloc] init];
    
    hygzViewController.zongzichan = 1;
    
    hygzViewController.arrowName = @"top-arrow";
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:hygzViewController animated:YES];
}


/**
 * XXXXX
 */
- (void)wodekaquanButtonClicked:(UIButton *)button {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
//    UserCashViewController *userCashViewController = [story instantiateViewControllerWithIdentifier:@"UserCashViewController"];
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
//    [self.navigationController pushViewController:userCashViewController animated:YES];
}



/**
 * 我的积
 */
- (void)wodejifenButtonClicked:(UIButton *)button {
    
    JFViewController *jfViewController = [[JFViewController alloc] init];
    
    jfViewController.sid = self.sid;
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:jfViewController animated:YES];
}


/**
 *点击会员规则按钮
 */
- (void)huiyuanguizeButtonClicked:(UIButton *)button {
    
    HYGZViewController *jygzViewController = [[HYGZViewController alloc] init];
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    jygzViewController.sid = self.sid;
    
    jygzViewController.investing = self.investing;
    
    jygzViewController.interest = self.interest;
    
    jygzViewController.expectedReturn = self.expectedReturn;
    
    jygzViewController.pageTage = self.pageTage;
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:jygzViewController animated:YES];
}

//积分奖励
- (void)jifenjiangliButtonClicked:(UIButton *)button {
    
    JFJLViewController *jfjlViewController = [[JFJLViewController alloc] init];
    
    jfjlViewController.sid = self.sid;
    
    jfjlViewController.vip = self.currentSelect + 1;
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:jfjlViewController animated:YES];
}

//生日红包
- (void)shengrihongbaoButtonClicked:(UIButton *)button {
    
    SRHBViewController *srhbViewController = [[SRHBViewController alloc] init];
    
    srhbViewController.sid = self.sid;
    
    srhbViewController.vip = self.currentSelect + 1;
    
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    
    backIetm.title = @"返回";
    
    self.navigationItem.backBarButtonItem = backIetm;
    
    [self.navigationController pushViewController:srhbViewController animated:YES];
}


/**
 * XXXXXXXXXX
 */
- (NSInteger)numberOfPageInPageScrollView:(OTPageScrollView*)pageScrollView{
    
    return [_dataArray count];
}


/**
 * XXXXXXXXXX
 */
- (UIView*)pageScrollView:(OTPageScrollView*)pageScrollView viewForRowAtIndex:(int)index{
    
    UIView *cell = [[UIView alloc] init];
    
    cell.frame = CGRectMake(0, 0, 80 * FitWidth, 80 * FitHeight);
    
    UIImageView *picImageView = [[UIImageView alloc] init];
    
    [cell addSubview:picImageView];
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = _dataArray[index];
    
    label.font = [UIFont systemFontOfSize:12 * FitWidth];
    
    label.textColor = [UIColor darkGrayColor];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [cell addSubview:label];
    
    label.font = [UIFont fontWithName:@"Avenir" size:12 * FitWidth];
    
    NSInteger c = self.current - 1;
    
    if (index == c) {
        
        label.hidden = YES;
        
        picImageView.frame = CGRectMake(0 * FitWidth, -2 * FitHeight, 95 * FitWidth, 85 * FitHeight);
        
        picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"V%d", index + 1]];
        
        label.frame = CGRectMake(10 * FitWidth, picImageView.frame.size.height -25 * FitHeight, cell.frame.size.width, 20 * FitHeight);
        
        label.font = [UIFont systemFontOfSize:12 * FitWidth];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10 * FitWidth, 5 * FitHeight, 70, 70)];
        
        [picImageView addSubview:headerImageView];
        
        if (self.sex == 1) {
            
            headerImageView.image = [UIImage imageNamed:@"headboy"];
            
        }else{
            
            headerImageView.image = [UIImage imageNamed:@"headgirl"];
        }
        
        UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, headerImageView.frame.size.height, picImageView.frame.size.width, 25 * FitWidth)];
        
        [picImageView addSubview:headLabel];
        
        headLabel.textColor = [XXColor phoneNumberColor];
        
        headLabel.textAlignment = NSTextAlignmentCenter;
        
        headLabel.font = [UIFont systemFontOfSize:12 * FitWidth];
        
        headLabel.text = _dataArray[index];
        
        UIImageView *vImageView = [[UIImageView alloc] initWithFrame:CGRectMake(headerImageView.frame.size.width - 25 * FitWidth, headerImageView.frame.size.height - 25 * FitHeight, 22 * FitWidth, 20 * FitHeight)];
        
        [headerImageView addSubview:vImageView];
        
        vImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"v%d-s", index + 1]];
        
       
        
    }else{
        
        picImageView.frame = CGRectMake(0 * FitWidth, -2 * FitHeight, 95 * FitWidth, 85 * FitWidth);
        
        picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"V%d", index + 1]];
        
        label.frame = CGRectMake(10 * FitWidth, picImageView.frame.size.height -25 * FitHeight, cell.frame.size.width, 20 * FitHeight);
        
        label.font = [UIFont systemFontOfSize:12 * FitWidth];
        
        label.textAlignment = NSTextAlignmentCenter;
    }
    
    //判断是否为当前选中，且不为会员本身等级
    if (index == self.currentSelect && index != self.current - 1) {
        
        label.textColor = [UIColor whiteColor];
        
        picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"V%d-1", index + 1]];
        
    }
    
    
    return cell;
}

/**
 * XXXXXX
 */
- (CGSize)sizeCellForPageScrollView:(OTPageScrollView*)pageScrollView {
    
    return CGSizeMake(80, 80);
}



/**
 * XXXXX
 */
- (void)pageScrollView:(OTPageScrollView *)pageScrollView didTapPageAtIndex:(NSInteger)index{
    
    self.currentSelect = index;
    
    if (self.currentSelect > 1 && self.currentSelect != 2) {
        
        self.hyzxHead2View.carBackImageView.hidden = YES;
        
        self.hyzxHead2View.jifenjiangliButton.hidden = NO;
        self.hyzxHead2View.jifenjiangliLabel.hidden = NO;
        
        self.hyzxHead2View.shengrihongbaoButton.hidden = NO;
        self.hyzxHead2View.shengrihongbaoLabel.hidden = NO;
        self.hyzxHead2View.shengrihongbaoButton.frame = CGRectMake(152 *  FitWidth, 50 * FitHeight, 70 *  FitWidth, 70 *  FitWidth);
        self.hyzxHead2View.shengrihongbaoLabel.frame = CGRectMake(152 *  FitWidth, 50 * FitHeight + self.hyzxHead2View.shengrihongbaoButton.frame.size.height, 70 *  FitWidth, 25 *  FitWidth);
        
        self.hyzxHead2View.moreImageView.hidden = NO;
        self.hyzxHead2View.jingqingqidaiLabel.hidden = NO;
        self.hyzxHead2View.moreImageView.frame = CGRectMake(375 *  FitWidth - 110 *  FitWidth, 50 * FitHeight, 70 *  FitWidth, 70 * FitHeight);
        self.hyzxHead2View.jingqingqidaiLabel.frame = CGRectMake(375 *  FitWidth - 110 *  FitWidth, 50 * FitHeight + self.hyzxHead2View.moreImageView.frame.size.height, 70 *  FitWidth, 25 * FitHeight);
        
        self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
        self.hyzxHead2View.tequanNumLabel.text = @"共2项";
        
    }else if (self.currentSelect == 2){
        
        self.hyzxHead2View.carBackImageView.hidden = YES;
        
        self.hyzxHead2View.jifenjiangliButton.hidden = NO;
        self.hyzxHead2View.jifenjiangliLabel.hidden = NO;
        
        self.hyzxHead2View.shengrihongbaoButton.hidden = YES;
        self.hyzxHead2View.shengrihongbaoLabel.hidden = YES;
        
        self.hyzxHead2View.moreImageView.hidden = NO;
        self.hyzxHead2View.jingqingqidaiLabel.hidden = NO;
        self.hyzxHead2View.moreImageView.frame = CGRectMake(152 * FitWidth, 50 * FitHeight, 70 * FitWidth, 70 * FitWidth);
        self.hyzxHead2View.jingqingqidaiLabel.frame = CGRectMake(152 * FitWidth, 50 * FitHeight + self.hyzxHead2View.moreImageView.frame.size.height, 70 * FitWidth, 25 * FitWidth);
        
        self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
        self.hyzxHead2View.tequanNumLabel.text = @"共1项";
        
    }
    else{
        
        self.hyzxHead2View.carBackImageView.hidden = NO;
        self.hyzxHead2View.carBackImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"car%ld", self.currentSelect + 1]];
        
        self.hyzxHead2View.jifenjiangliButton.hidden = YES;
        self.hyzxHead2View.jifenjiangliLabel.hidden = YES;
        
        self.hyzxHead2View.shengrihongbaoButton.hidden = YES;
        self.hyzxHead2View.shengrihongbaoLabel.hidden = YES;
        
        self.hyzxHead2View.moreImageView.hidden = YES;
        self.hyzxHead2View.jingqingqidaiLabel.hidden = YES;
        
        self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
        self.hyzxHead2View.tequanNumLabel.text = @"共0项";
    }
    
    if (self.currentSelect == self.current - 1) {
        self.hyzxHead2View.tequanLabel.text = @"我的特权";
    }
    
    [self.pScrollView.pageScrollView reloadData];
    
}


/**
 * XXXXXXXX
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //判断当滑动的对象是等级条时
    if ([scrollView isKindOfClass:[OTPageScrollView class]]) {
        
        NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
        
        self.currentSelect = index;
        
        if (self.currentSelect > 1 && self.currentSelect != 2) {
            
            self.hyzxHead2View.carBackImageView.hidden = YES;
            
            self.hyzxHead2View.jifenjiangliButton.hidden = NO;
            self.hyzxHead2View.jifenjiangliLabel.hidden = NO;
            
            self.hyzxHead2View.shengrihongbaoButton.hidden = NO;
            self.hyzxHead2View.shengrihongbaoLabel.hidden = NO;
            self.hyzxHead2View.shengrihongbaoButton.frame = CGRectMake(152 * FitWidth, 50 * FitHeight, 70 * FitWidth, 70 * FitWidth);
            self.hyzxHead2View.shengrihongbaoLabel.frame = CGRectMake(152 * FitWidth, 50 * FitHeight + self.hyzxHead2View.shengrihongbaoButton.frame.size.height, 70 * FitWidth, 25 * FitWidth);
            
            self.hyzxHead2View.moreImageView.hidden = NO;
            self.hyzxHead2View.jingqingqidaiLabel.hidden = NO;
            self.hyzxHead2View.moreImageView.frame = CGRectMake(375 * FitWidth - 110 * FitWidth, 50 * FitHeight, 70 * FitWidth, 70 * FitHeight);
            self.hyzxHead2View.jingqingqidaiLabel.frame = CGRectMake(375 * FitWidth - 110 * FitWidth, 50 * FitHeight + self.hyzxHead2View.moreImageView.frame.size.height, 70 * FitWidth, 25 * FitHeight);
            
            self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
            self.hyzxHead2View.tequanNumLabel.text = @"共2项";
            
        }else if (self.currentSelect == 2){
            
            self.hyzxHead2View.carBackImageView.hidden = YES;
            
            self.hyzxHead2View.jifenjiangliButton.hidden = NO;
            self.hyzxHead2View.jifenjiangliLabel.hidden = NO;
            
            self.hyzxHead2View.shengrihongbaoButton.hidden = YES;
            self.hyzxHead2View.shengrihongbaoLabel.hidden = YES;
            
            self.hyzxHead2View.moreImageView.hidden = NO;
            self.hyzxHead2View.jingqingqidaiLabel.hidden = NO;
            self.hyzxHead2View.moreImageView.frame = CGRectMake(152 * FitWidth, 50 * FitHeight, 70 * FitWidth, 70 * FitWidth);
            self.hyzxHead2View.jingqingqidaiLabel.frame = CGRectMake(152 * FitWidth, 50 * FitHeight + self.hyzxHead2View.moreImageView.frame.size.height, 70 * FitWidth, 25 * FitWidth);
            
            self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
            self.hyzxHead2View.tequanNumLabel.text = @"共1项";
            
        }
        else{
            
            self.hyzxHead2View.carBackImageView.hidden = NO;
            self.hyzxHead2View.carBackImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"car%ld", self.currentSelect + 1]];
            
            self.hyzxHead2View.jifenjiangliButton.hidden = YES;
            self.hyzxHead2View.jifenjiangliLabel.hidden = YES;
            
            self.hyzxHead2View.shengrihongbaoButton.hidden = YES;
            self.hyzxHead2View.shengrihongbaoLabel.hidden = YES;
            
            self.hyzxHead2View.moreImageView.hidden = YES;
            self.hyzxHead2View.jingqingqidaiLabel.hidden = YES;
            
            self.hyzxHead2View.tequanLabel.text = [NSString stringWithFormat:@"V%ld特权", self.currentSelect + 1];
            self.hyzxHead2View.tequanNumLabel.text = @"共0项";
        }
        
        if (self.currentSelect == self.current - 1) {
            self.hyzxHead2View.tequanLabel.text = @"我的特权";
        }
        
        [self.pScrollView.pageScrollView reloadData];
    }
    
}



/**
 * XXXXXX
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

/**
 * XXXXXX
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}


/**
 * XXXXXX
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HYZXCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYZXCell"];
    
    if (!cell) {
        
        cell = [[HYZXCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYZXCell"];
        
    }
    
    if (indexPath.row == 0) {
        
        cell.backgroundColor = [UIColor colorWithRed:226 / 255.0 green:227 / 255.0 blue:232 / 255.0 alpha:1.0];
        
        cell.huiyuanImageView.hidden = YES;
        
        cell.huiyuandengjiLabel.text = @"会员等级";
        
        cell.jifenjiangliLabel.text = @"定期积分奖励";
        
        cell.shengrijuanLabel.text = @"生日现金券";
        
    }else{
        
        cell.huiyuanImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"vip%ld", (long)indexPath.row]];
        
        if (indexPath.row % 2 != 0) {
            
            cell.backgroundColor = [UIColor colorWithRed:246 / 255.0 green:247 / 255.0 blue:248 / 255.0 alpha:1.0];
        }
        
        if (indexPath.row == 1) {
            
            cell.huiyuandengjiLabel.hidden = YES;
            
            cell.jifenjiangliLabel.text = @"--";
            
            cell.shengrijuanLabel.text = @"--";
        }
        
        if (indexPath.row == 2) {
            
            cell.huiyuandengjiLabel.hidden = YES;
            
            cell.jifenjiangliLabel.text = @"--";
            
            cell.shengrijuanLabel.text = @"--";
        }
        
        if (indexPath.row == 3) {
            
            cell.huiyuandengjiLabel.hidden = YES;
            
            cell.jifenjiangliLabel.text = @"200";
            
            cell.shengrijuanLabel.text = @"--";
        }
        
        if (indexPath.row == 4) {
            
            cell.huiyuandengjiLabel.hidden = YES;
            
            cell.jifenjiangliLabel.text = @"500";
            
            cell.shengrijuanLabel.text = @"10元";
        }
        
        if (indexPath.row == 5) {
            
            cell.huiyuandengjiLabel.hidden = YES;
            
            cell.jifenjiangliLabel.text = @"1000";
            
            cell.shengrijuanLabel.text = @"20元";
        }
        
        if (indexPath.row == 6) {
            
            cell.huiyuandengjiLabel.hidden = YES;
            
            cell.jifenjiangliLabel.text = @"2000";
            
            cell.shengrijuanLabel.text = @"30元";
        }
        
        if (indexPath.row == 7) {
            
            cell.huiyuandengjiLabel.hidden = YES;
            
            cell.jifenjiangliLabel.text = @"5000";
            
            cell.shengrijuanLabel.text = @"50元";
        }
        
        if (indexPath.row == 8) {
            
            cell.huiyuandengjiLabel.hidden = YES;
            
            cell.jifenjiangliLabel.text = @"10000";
            
            cell.shengrijuanLabel.text = @"100元";
        }
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

/**
 * XXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 405 * FitHeight;
}

/**
 * XXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 35 * FitHeight;
}



@end

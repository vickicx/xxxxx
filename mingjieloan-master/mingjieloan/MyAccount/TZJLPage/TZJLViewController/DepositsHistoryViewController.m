//
//  DepositsHistoryViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/7/11.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "DepositsHistoryViewController.h"
#import "HKZCell.h"
#import "DQRCell.h"
#import "YJQCell.h"
#import "TZJLDetailViewController.h"
#import "MJRefresh.h"
#import "ZRGZViewController.h"

@interface DepositsHistoryViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIView *headView;

@property (nonatomic, strong) UITableView *hkzTableView;

@property (nonatomic, strong) UITableView *dqrTableView;

@property (nonatomic, strong) UITableView *yjqTableView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UILabel *zaitouPriceLabel;

@property (nonatomic, strong) UILabel *daishoubenjinLabel;

@property (nonatomic, strong) UILabel *leijishouyiLabel;

@property (nonatomic, strong) UIButton *hkzButton;

@property (nonatomic, strong) UIButton *dqrButton;

@property (nonatomic, strong) UIButton *yjqButton;

@property (nonatomic, strong) UIView *hkzView;

@property (nonatomic, strong) UIView *dqrView;

@property (nonatomic, strong) UIView *yjqView;

@property (nonatomic, strong) NSArray *returningDataArr;

@property (nonatomic, strong) NSMutableArray *returningArr;

@property (nonatomic, strong) NSMutableArray *returningMainArr;

@property (nonatomic, strong) NSArray *confirmDataArr;

@property (nonatomic, strong) NSMutableArray *confirmArr;

@property (nonatomic, strong) NSMutableArray *confirmMainArr;

@property (nonatomic, strong) NSArray *returnedDataArr;

@property (nonatomic, strong) NSMutableArray *returnedArr;

@property (nonatomic, strong) NSMutableArray *returnedMainArr;

@property (nonatomic, assign) NSInteger returningPage;

@property (nonatomic, assign) NSInteger returningMaxPageId;

@property (nonatomic, assign) NSInteger confirmPage;

@property (nonatomic, assign) NSInteger confirmMaxPageId;

@property (nonatomic, assign) NSInteger returnedPage;

@property (nonatomic, assign) NSInteger returnedMaxPageId;

@property (nonatomic, strong) UIImageView *kzrEmptyImageView;

@property (nonatomic, strong) UILabel *kzrEmptyLabel;

@property (nonatomic, strong) UIImageView *zrzEmptyImageView;

@property (nonatomic, strong) UILabel *zrzEmptyLabel;

@property (nonatomic, strong) UIImageView *yzrEmptyImageView;

@property (nonatomic, strong) UILabel *yzrEmptyLabel;

@property (nonatomic, copy) NSString *transferId;

@end

@implementation DepositsHistoryViewController

/**
 *加载这个NIB文件
 */
//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    
//    if (self) {
//        
//        
//
//    }
//    
//    return self;
//}


/**
 *view将要显示
 */
- (void)viewWillAppear:(BOOL)animated {
    
    if ([self.pageTage isEqualToString:@"1"]) {
        
        [self dqrTableViewHeaderRefreshing];
        
    }else{
        
        [self hkzTableViewHeaderRefreshing];

        
    }

}



/**
 *View创建完毕
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.returningDataArr = [NSArray array];
    self.returningArr = [NSMutableArray array];
    self.returningMainArr = [NSMutableArray array];
    
    self.confirmDataArr = [NSArray array];
    self.confirmArr = [NSMutableArray array];
    self.confirmMainArr = [NSMutableArray array];
    
    self.returnedDataArr = [NSArray array];
    self.returnedArr = [NSMutableArray array];
    self.returnedMainArr = [NSMutableArray array];
    
    self.returningPage = 1;
    self.confirmPage = 1;
    self.returnedPage = 1;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor * color = [UIColor whiteColor];
    
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.navigationItem.title = @"回款计划";
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    
    backButton.title = @"回款计划";
    
    self.navigationItem.backBarButtonItem = backButton;
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self createHeadView];
    
    [self headerDataHandle];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + 120 * FitHeight, kWIDTH, [UIScreen mainScreen].bounds.size.height - 64 - 120 * FitHeight)];
    
    [self.view addSubview:self.scrollView];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, 0);
    
    /* 整页滚动 */
    self.scrollView.pagingEnabled = YES;
    
    /* 视图左上角距离原点的偏移量 */
    if ([self.pageTage isEqualToString:@"1"]) {
        
        self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);

    }else{
        
        self.scrollView.contentOffset = CGPointMake(0, 0);

    }
    
    /* 是否显示垂直滚动条, 默认值为YES */
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    /* 边界是否回弹 */
    self.scrollView.bounces = NO;
    
    self.scrollView.scrollEnabled = NO;
    
    self.scrollView.delegate = self;

    [self createHKZTableView];
    [self createDQRTableView];
    [self createYJQTableView];
    
    
    self.kzrEmptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(105 * FitWidth, 100 * FitHeight, kWIDTH - 210 * FitWidth, 110 * FitHeight)];
    [self.hkzTableView addSubview:self.kzrEmptyImageView];
    self.kzrEmptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.kzrEmptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * FitWidth , 100 * FitHeight + self.kzrEmptyImageView.frame.size.height, kWIDTH - 210 * FitWidth, 40 * FitHeight)];
    
    [self.hkzTableView addSubview:self.kzrEmptyLabel];
    
    self.kzrEmptyLabel.text = @"暂无数据!";
    self.kzrEmptyLabel.textColor = [UIColor lightGrayColor];
    self.kzrEmptyLabel.font = [UIFont systemFontOfSize:20];
    self.kzrEmptyLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.zrzEmptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(105 * FitWidth, 100 * FitHeight, kWIDTH - 210 * FitWidth, 110 * FitHeight)];
    [self.dqrTableView addSubview:self.zrzEmptyImageView];
    self.zrzEmptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.zrzEmptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * FitWidth , 100 * FitHeight + self.zrzEmptyImageView.frame.size.height, kWIDTH - 210 * FitWidth, 40 * FitHeight)];
    [self.dqrTableView addSubview:self.zrzEmptyLabel];
    
    self.zrzEmptyLabel.text = @"暂无数据!";
    self.zrzEmptyLabel.textColor = [UIColor lightGrayColor];
    self.zrzEmptyLabel.font = [UIFont systemFontOfSize:20];
    self.zrzEmptyLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.yzrEmptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(105 * FitWidth, 100 * FitHeight, kWIDTH - 210 * FitWidth, 110 * FitHeight)];
    [self.yjqTableView addSubview:self.yzrEmptyImageView];
    self.yzrEmptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.yzrEmptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(105 * FitWidth , 100 * FitHeight + self.yzrEmptyImageView.frame.size.height, kWIDTH - 210 * FitWidth, 40 * FitHeight)];
    [self.yjqTableView addSubview:self.yzrEmptyLabel];
    
    self.yzrEmptyLabel.text = @"暂无数据!";
    self.yzrEmptyLabel.textColor = [UIColor lightGrayColor];
    self.yzrEmptyLabel.font = [UIFont systemFontOfSize:20];
    self.yzrEmptyLabel.textAlignment = NSTextAlignmentCenter;


}

/**
 *加载
 */
- (void)headerDataHandle {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, INVEST];
    
    NSDictionary *body = @{@"sid":MySid};
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType: 0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [hud dismiss];
        
        self.investing = [result objectForKey:@"investAmount"];
        
        self.interest = [result objectForKey:@"totalInterest"];
        
        self.expectedReturn = [result objectForKey:@"unrepaidInterest"];
        
        self.zaitouPriceLabel.text = self.investing;
        
        self.daishoubenjinLabel.text = self.expectedReturn;
        
        self.leijishouyiLabel.text = self.interest;
        


    } fail:^(NSError *error) {
        
    }];
}

/**
 *XXXXXXXX
 */
- (void)returningDataHandle {

    NSDictionary *body = @{@"sid":MySid,@"page":@"1"};
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, RETURNING];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [hud dismiss];
        
        self.returningDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        for (NSDictionary *dic in self.returningDataArr) {
            
            NSArray *arr = [dic objectForKey:@"order"];
            
            [self.returningArr addObject:arr];
        }
        
        if (self.returningArr.count > 0) {
            
            for (NSDictionary *dic in self.returningArr) {
                
                ReturningModel *model = [[ReturningModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.returningMainArr addObject:model];
            }
        }
        
        if (self.returningMainArr.count > 0) {
            
            [self.hkzTableView reloadData];
            
            self.kzrEmptyImageView.hidden = YES;
            
            self.kzrEmptyLabel.hidden = YES;
            
        }else{
            
            self.kzrEmptyImageView.hidden = NO;
            
            self.kzrEmptyLabel.hidden = NO;
        }
        
        if (self.returningMainArr.count == 0) {
            
            self.kzrEmptyImageView.hidden = NO;
            
            self.kzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.kzrEmptyImageView.hidden = YES;
            
            self.kzrEmptyLabel.hidden = YES;
            
        }

    } fail:^(NSError *error) {
        
    }];
   }


/**
 *XXXXXXX
 */
- (void)confirmDataHandle {
    
    NSDictionary *body = @{@"sid":MySid,@"page":@"1"};
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, CONFIRM];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];

    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {

        
        [hud dismiss];

        self.confirmDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        for (NSDictionary *dic in self.confirmDataArr) {
            
            NSArray *arr = [dic objectForKey:@"order"];
            
            [self.confirmArr addObject:arr];
        }
        
        if (self.confirmArr.count > 0) {
            
            for (NSDictionary *dic in self.confirmArr) {
                
                ConfirmModel *model = [[ConfirmModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.confirmMainArr addObject:model];
            }
        }
        
        if (self.confirmMainArr.count > 0) {
            
            [self.dqrTableView reloadData];
            
        }
        
        if (self.confirmMainArr.count == 0) {
            
            self.zrzEmptyImageView.hidden = NO;
            
            self.zrzEmptyLabel.hidden = NO;
            
        }else{
            
            self.zrzEmptyImageView.hidden = YES;
            
            self.zrzEmptyLabel.hidden = YES;
        }
    } fail:^(NSError *error) {
        
    }];
}




/**
 * XXXXXXXX
 */
- (void)returnedDataHandle {
    
    NSDictionary *body = @{@"sid":MySid,@"page":@"1"};
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, RETURNED];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {

        
        [hud dismiss];

        self.returnedDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        for (NSDictionary *dic in self.returnedDataArr) {
            
            NSArray *arr = [dic objectForKey:@"order"];
            
            [self.returnedArr addObject:arr];
        }
        
        if (self.returnedArr.count > 0) {
            
            for (NSDictionary *dic in self.returnedArr) {
                
                ReturnedModel *model = [[ReturnedModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.returnedMainArr addObject:model];
            }
        }
        
        if (self.returnedMainArr.count > 0) {
            
            [self.yjqTableView reloadData];
            
        }
        
        if (self.returnedMainArr.count == 0) {
            
            self.yzrEmptyImageView.hidden = NO;
            
            self.yzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.yzrEmptyImageView.hidden = YES;
            
            self.yzrEmptyLabel.hidden = YES;
            
        }
    } fail:^(NSError *error) {
        
    }];
}

/**
 *XXXX
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
 *XXXXXXXXXXX
 */
- (void)createHeadView {
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 120 * FitHeight)];
    
    [self.view addSubview:self.headView];
    
    self.headView.backgroundColor = [XXColor imagasAsetsSum];
    
    UILabel *zaitoubenjinLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15 * FitHeight, [UIScreen mainScreen].bounds.size.width / 3, 20 * FitHeight)];
    
    [self.headView addSubview:zaitoubenjinLabel];
    
    zaitoubenjinLabel.textAlignment = NSTextAlignmentCenter;
    
    zaitoubenjinLabel.textColor = [UIColor whiteColor];
    
    zaitoubenjinLabel.font = [UIFont systemFontOfSize:11];
    
    zaitoubenjinLabel.text = @" 在投本金（元）";

    self.zaitouPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15 * FitHeight + zaitoubenjinLabel.frame.size.height, zaitoubenjinLabel.frame.size.width, 30 * FitHeight)];
    
    [self.headView addSubview:self.zaitouPriceLabel];
    
    self.zaitouPriceLabel.textAlignment = NSTextAlignmentCenter;
    
    self.zaitouPriceLabel.textColor = [UIColor whiteColor];
    
    self.zaitouPriceLabel.font = [UIFont systemFontOfSize:13];
    
    UIView *line1View = [[UIView alloc] initWithFrame:CGRectMake(zaitoubenjinLabel.frame.size.width, 20 * FitHeight, 1, 40 * FitHeight)];
    
    [self.headView addSubview:line1View];
    
    line1View.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *daishoubenxiLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 15 * FitHeight, [UIScreen mainScreen].bounds.size.width / 3, 20 * FitHeight)];
    
    [self.headView addSubview:daishoubenxiLabel];
    
    daishoubenxiLabel.textAlignment = NSTextAlignmentCenter;
    
    daishoubenxiLabel.textColor = [UIColor whiteColor];
    
    daishoubenxiLabel.font = [UIFont systemFontOfSize:11];
    
    daishoubenxiLabel.text = @" 待收本息（元）";
    
    self.daishoubenjinLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 15 * FitHeight + zaitoubenjinLabel.frame.size.height, zaitoubenjinLabel.frame.size.width, 30 * FitHeight)];
    
    [self.headView addSubview:self.daishoubenjinLabel];
    
    self.daishoubenjinLabel.textAlignment = NSTextAlignmentCenter;
    
    self.daishoubenjinLabel.textColor = [UIColor whiteColor];
    
    self.daishoubenjinLabel.font = [UIFont systemFontOfSize:13];
    
    NSString *str1 = [self.investing stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    NSString *str2 = [self.expectedReturn stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    double num1 = str1.doubleValue;
    
    double num2 = str2.doubleValue;
    
    double sum = num1 + num2;
    
    NSString *sumStr = [NSString stringWithFormat:@"%.2f", sum];
    
    UIView *line2View = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2, 20 * FitHeight, 1, 40 * FitHeight)];
    
    [self.headView addSubview:line2View];
    
    line2View.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *leijisy = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2, 15 * FitHeight, [UIScreen mainScreen].bounds.size.width / 3, 20 * FitHeight)];
    
    [self.headView addSubview:leijisy];
    
    leijisy.textAlignment = NSTextAlignmentCenter;
    
    leijisy.textColor = [UIColor whiteColor];
    
    leijisy.font = [UIFont systemFontOfSize:11];
    
    leijisy.text = @"累计收益（元）";
    
    self.leijishouyiLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2, 15 * FitHeight + zaitoubenjinLabel.frame.size.height, zaitoubenjinLabel.frame.size.width, 30 * FitHeight)];
    
    [self.headView addSubview:self.leijishouyiLabel];
    
    self.leijishouyiLabel.textAlignment = NSTextAlignmentCenter;
    
    self.leijishouyiLabel.textColor = [UIColor whiteColor];
    
    self.leijishouyiLabel.font = [UIFont systemFontOfSize:13];
    
    self.hkzButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.hkzButton.frame = CGRectMake(0, 80 * FitHeight, [UIScreen mainScreen].bounds.size.width / 3, 40 * FitHeight);
    
    [self.headView addSubview:self.hkzButton];
    
    [self.hkzButton setTitle:@"回款中" forState:UIControlStateNormal];
    
    self.hkzButton.titleLabel.font = [UIFont systemFontOfSize:13];
    
    self.hkzButton.backgroundColor = [UIColor whiteColor];
    
    if ([self.pageTage isEqualToString:@"1"]) {
        
        [self.hkzButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    }else{
        
        [self.hkzButton setTitleColor:[
         XXColor goldenColor] forState:UIControlStateNormal];

    }
    
    self.hkzButton.tag = 500000;
    
    [self.hkzButton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.hkzView = [[UIView alloc] initWithFrame:CGRectMake(self.hkzButton.frame.size.width / 6, 37.5 * FitHeight, self.hkzButton.frame.size.width / 6 * 4, 2.5 * FitHeight)];
    
    [self.hkzButton addSubview:self.hkzView];
    
    if ([self.pageTage isEqualToString:@"1"]) {
        
        self.hkzView.backgroundColor = [UIColor clearColor];

    }else{
        
        self.hkzView.backgroundColor = [XXColor goldenColor];

    }
    
    self.dqrButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.dqrButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 80 * FitHeight, [UIScreen mainScreen].bounds.size.width / 3, 40 * FitHeight);
    
    [self.headView addSubview:self.dqrButton];
    
    [self.dqrButton setTitle:@"待确认" forState:UIControlStateNormal];
    
    self.dqrButton.titleLabel.font = [UIFont systemFontOfSize:13];
    
    self.dqrButton.backgroundColor = [UIColor whiteColor];
    
    if ([self.pageTage isEqualToString:@"1"]) {
        
        [self.dqrButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];

    }else{
        
        [self.dqrButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    }
    
    self.dqrButton.tag = 500001;
    
    [self.dqrButton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.dqrView = [[UIView alloc] initWithFrame:CGRectMake(self.dqrButton.frame.size.width / 6, 37.5 * FitHeight, self.dqrButton.frame.size.width / 6 * 4, 2.5 * FitHeight)];
    
    [self.dqrButton addSubview:self.dqrView];
    
    if ([self.pageTage isEqualToString:@"1"]) {
        
        self.dqrView.backgroundColor = [XXColor goldenColor];

    }else{
        
        self.dqrView.backgroundColor = [UIColor clearColor];

    }

    self.yjqButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.yjqButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2, 80 * FitHeight, [UIScreen mainScreen].bounds.size.width / 3, 40 * FitHeight);
    
    [self.headView addSubview:self.yjqButton];
    
    [self.yjqButton setTitle:@"已结清" forState:UIControlStateNormal];
    
    self.yjqButton.titleLabel.font = [UIFont systemFontOfSize:13];
    
    self.yjqButton.backgroundColor = [UIColor whiteColor];
    
    [self.yjqButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.yjqButton.tag = 500002;
    
    [self.yjqButton addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.yjqView = [[UIView alloc] initWithFrame:CGRectMake(self.yjqButton.frame.size.width / 6, 37.5 * FitHeight, self.yjqButton.frame.size.width / 6 * 4, 2.5 * FitHeight)];
    
    [self.yjqButton addSubview:self.yjqView];
    
    self.yjqView.backgroundColor = [UIColor clearColor];
}

/**
 *可转让按钮
 */
- (void)btnClicked:(UIButton *)button  {
    if (button.tag == 500000) {
        
        if (self.hkzButton.selected != YES) {
            
            [self.hkzButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
            
            self.hkzView.backgroundColor = [XXColor goldenColor];
            
            [self.dqrButton setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            [self.yjqButton setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            self.dqrView.backgroundColor = [UIColor clearColor];
            
            self.yjqView.backgroundColor = [UIColor clearColor];
            
            self.dqrButton.selected = NO;
            
            self.yjqButton.selected = NO;
            
            [self hkzTableViewHeaderRefreshing];
            
            self.scrollView.contentOffset = CGPointMake(0, 0);
        }
        
        
    }else if (button.tag == 500001) {
        
        if (self.dqrButton.selected != YES) {
            
            [self.dqrButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
            
            self.dqrView.backgroundColor = [XXColor goldenColor];
            
            [self.hkzButton setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            [self.yjqButton setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            self.hkzView.backgroundColor = [UIColor clearColor];
            
            self.yjqView.backgroundColor = [UIColor clearColor];
            
            self.hkzButton.selected = NO;
            
            self.yjqButton.selected = NO;
            
            [self dqrTableViewHeaderRefreshing];
            
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
        }
        
    }else if (button.tag == 500002) {
        
        if (self.yjqButton.selected != YES) {
            
            [self.yjqButton setTitleColor:[XXColor goldenColor] forState:UIControlStateNormal];
            
            self.yjqView.backgroundColor = [XXColor goldenColor];
            
            [self.hkzButton setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            [self.dqrButton setTitleColor:[UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0] forState:UIControlStateNormal];
            
            self.hkzView.backgroundColor = [UIColor clearColor];
            
            self.dqrView.backgroundColor = [UIColor clearColor];
            
            self.hkzButton.selected = NO;
            
            self.dqrButton.selected = NO;
            
            [self yjqTableViewHeaderRefreshing];
            
            self.scrollView.contentOffset = CGPointMake(self.view.frame.size.width * 2, 0);
        }
        
    }
  
    
}

/**
 * XXXXXXXXX
 */
- (void)createHKZTableView {
    
    self.hkzTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 120 * FitHeight) style:UITableViewStyleGrouped];
    
    [self.scrollView addSubview:self.hkzTableView];
    
    self.hkzTableView.dataSource = self;
    
    self.hkzTableView.delegate = self;
    
    self.hkzTableView.rowHeight = 150 * FitHeight;
    
    self.hkzTableView.tag = 600000;
    
    [self.hkzTableView addHeaderWithTarget:self action:@selector(hkzTableViewHeaderRefreshing)];
    
    [self.hkzTableView addFooterWithTarget:self action:@selector(hkzTableViewFooterRefreshing)];
    
    
    
}


/**
 * XXXXXXXXX
 */
- (void)hkzTableViewHeaderRefreshing {
    
    [self.returningMainArr removeAllObjects];
    
    [self.returningArr removeAllObjects];
    NSDictionary *body = @{@"sid":MySid,@"page":@"1"};
//    NSString *body = [NSString stringWithFormat:@"sid=%@&page=1", self.sid];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, RETURNING];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
   
        
    
[VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
    
} success:^(id result) {
    
        [hud dismiss];

        self.returningDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        for (NSDictionary *dic in self.returningDataArr) {
            
            NSArray *arr = [dic objectForKey:@"order"];
            
            [self.returningArr addObject:arr];
        }
        
        if (self.returningArr.count > 0) {
            
            for (NSDictionary *dic in self.returningArr) {
                
                ReturningModel *model = [[ReturningModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.returningMainArr addObject:model];
            }
        }
        
        if (self.returningMainArr.count > 0) {
            
            [self.hkzTableView reloadData];
            
        }
        
        if (self.returningMainArr.count == 0) {
            
            self.kzrEmptyImageView.hidden = NO;
            
            self.kzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.kzrEmptyImageView.hidden = YES;
            
            self.kzrEmptyLabel.hidden = YES;
        }
        
        [self.hkzTableView headerEndRefreshing];
        
    } fail:^(NSError *error) {
    
    }];
    
    
}


/**
 * XXXXXXXXX
 */
- (void)hkzTableViewFooterRefreshing {
    
    self.returningPage++;
    
    [self.returningArr removeAllObjects];
    

    NSDictionary *body = [NSDictionary dictionaryWithObjectsAndKeys:@"sid",MySid,@"page",(long)self.returningPage, nil];
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, RETURNING];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {

        
        [hud dismiss];

        self.returningDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
            
        for (NSDictionary *dic in self.returningDataArr) {
                
            NSArray *arr = [dic objectForKey:@"order"];
                
            [self.returningArr addObject:arr];
        }
            
        if (self.returningArr.count > 0) {
                
            for (NSDictionary *dic in self.returningArr) {
                    
                ReturningModel *model = [[ReturningModel alloc] init];
                    
                [model setValuesForKeysWithDictionary:dic];
                    
                [self.returningMainArr addObject:model];
            }
        }

        if (self.returningMainArr.count > 0) {
            
            [self.hkzTableView reloadData];
            
        }
        
        if (self.returningMainArr.count == 0) {
            
            self.kzrEmptyImageView.hidden = NO;
            
            self.kzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.kzrEmptyImageView.hidden = YES;
            
            self.kzrEmptyLabel.hidden = YES;
            
        }
        
            
        [self.hkzTableView footerEndRefreshing];
            
    } fail:^(NSError *error) {
        
    }];
    
    if (self.returningMaxPageId) {
    
        self.hkzTableView.footerHidden = YES;
    }
    
}

/**
 * XXXXXXXXX
 */
- (void)createDQRTableView {
    
    self.dqrTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 120 * FitHeight) style:UITableViewStyleGrouped];
    
    [self.scrollView addSubview:self.dqrTableView];
    
    self.dqrTableView.dataSource = self;
    
    self.dqrTableView.delegate = self;
    
    self.dqrTableView.rowHeight = 120 * FitHeight;
    
    self.dqrTableView.tag = 600001;
    
    [self.dqrTableView addHeaderWithTarget:self action:@selector(dqrTableViewHeaderRefreshing)];
    
    [self.dqrTableView addFooterWithTarget:self action:@selector(dqrTableViewFooterRefreshing)];
    
}

/**
 * XXXXXXXXX
 */
- (void)dqrTableViewHeaderRefreshing {
    
    [self.confirmMainArr removeAllObjects];
    
    [self.confirmArr removeAllObjects];

    NSDictionary *body = @{@"sid":MySid,@"page":@"1"};
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, CONFIRM];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        [hud dismiss];

        self.confirmDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        for (NSDictionary *dic in self.confirmDataArr) {
            
            NSArray *arr = [dic objectForKey:@"order"];
            
            [self.confirmArr addObject:arr];
        }
        
        if (self.confirmArr.count > 0) {
            
            for (NSDictionary *dic in self.confirmArr) {
                
                ConfirmModel *model = [[ConfirmModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.confirmMainArr addObject:model];
            }
        }

        if (self.confirmMainArr.count > 0) {
            
            [self.dqrTableView reloadData];
            
        }

        if (self.confirmMainArr.count == 0) {
            
            self.zrzEmptyImageView.hidden = NO;
            
            self.zrzEmptyLabel.hidden = NO;
            
        }else{
            
            self.zrzEmptyImageView.hidden = YES;
            
            self.zrzEmptyLabel.hidden = YES;
            
        }
        
        [self.dqrTableView headerEndRefreshing];
        
    } fail:^(NSError *error) {
        
    }];
    
    
}


/**
 * XXXXXXXXX
 */
- (void)dqrTableViewFooterRefreshing {
    
    self.confirmPage++;
    
    [self.confirmArr removeAllObjects];
    

     NSDictionary *body = [NSDictionary dictionaryWithObjectsAndKeys:@"sid",MySid,@"page",self.confirmPage, nil];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, CONFIRM];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        [hud dismiss];

        self.confirmDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        for (NSDictionary *dic in self.confirmDataArr) {
            
            NSArray *arr = [dic objectForKey:@"order"];
            
            [self.confirmArr addObject:arr];
        }
        
        if (self.confirmArr.count > 0) {
            
            for (NSDictionary *dic in self.confirmArr) {
                
                ConfirmModel *model = [[ConfirmModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.confirmMainArr addObject:model];
            }
        }

        if (self.confirmMainArr.count > 0) {
            
            [self.dqrTableView reloadData];
            
        }
        
        
        if (self.confirmMainArr.count == 0) {
            
            self.zrzEmptyImageView.hidden = NO;
            
            self.zrzEmptyLabel.hidden = NO;
            
        }else{
            
            self.zrzEmptyImageView.hidden = YES;
            
            self.zrzEmptyLabel.hidden = YES;
            
        }
        
        [self.dqrTableView footerEndRefreshing];
        
    } fail:^(NSError *error) {
        
    }];
    
    if (self.confirmMaxPageId) {
        
        self.dqrTableView.footerHidden = YES;
    }
    
}


/**
 * XXXXXXXXX
 */
- (void)createYJQTableView {
    
    self.yjqTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 120 * FitHeight) style:UITableViewStyleGrouped];
    
    [self.scrollView addSubview:self.yjqTableView];
    
    self.yjqTableView.dataSource = self;
    
    self.yjqTableView.delegate = self;
    
    self.yjqTableView.rowHeight = 140 * FitHeight;
    
    self.yjqTableView.tag = 600002;
    
    [self.yjqTableView addHeaderWithTarget:self action:@selector(yjqTableViewHeaderRefreshing)];
    
    [self.yjqTableView addFooterWithTarget:self action:@selector(yjqTableViewFooterRefreshing)];
}


/**
 * XXXXXXXXX
 */
- (void)yjqTableViewHeaderRefreshing {

    [self.returnedMainArr removeAllObjects];
    
    [self.returnedArr removeAllObjects];
    
    NSDictionary *body = @{@"sid":MySid,@"page":@"1"};
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, RETURNED];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        [hud dismiss];

        self.returnedDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        for (NSDictionary *dic in self.returnedDataArr) {
            
            NSArray *arr = [dic objectForKey:@"order"];
            
            [self.returnedArr addObject:arr];
        }
        
        if (self.returnedArr.count > 0) {
            
            for (NSDictionary *dic in self.returnedArr) {
                
                ReturnedModel *model = [[ReturnedModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.returnedMainArr addObject:model];
            }
        }
        
        if (self.returnedMainArr.count > 0) {
            
            [self.yjqTableView reloadData];
            
        }
        
        if (self.returnedMainArr.count == 0) {
            
            self.yzrEmptyImageView.hidden = NO;
            
            self.yzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.yzrEmptyImageView.hidden = YES;
            
            self.yzrEmptyLabel.hidden = YES;
            
        }
        
        
        [self.yjqTableView headerEndRefreshing];
    }fail:^(NSError *error) {
    
    }];
    
    
}


/**
 * XXXXXXXXX
 */
- (void)yjqTableViewFooterRefreshing {
    
    self.returnedPage++;
    
    [self.returnedArr removeAllObjects];
    
  
     NSDictionary *body = [NSDictionary dictionaryWithObjectsAndKeys:@"sid",MySid,@"page",self.returnedPage, nil];
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, RETURNED];
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        [hud dismiss];

        self.returnedDataArr = [[result objectForKey:@"orders"] objectForKey:@"items"];
        
        for (NSDictionary *dic in self.returnedDataArr) {
            
            NSArray *arr = [dic objectForKey:@"order"];
            
            [self.returnedArr addObject:arr];
        }
        
        if (self.returnedArr.count > 0) {
            
            for (NSDictionary *dic in self.returnedArr) {
                
                ReturnedModel *model = [[ReturnedModel alloc] init];
                
                [model setValuesForKeysWithDictionary:dic];
                
                [self.returnedMainArr addObject:model];
            }
        }
        
        if (self.returnedMainArr.count > 0) {
            
            [self.yjqTableView reloadData];
            
        }
        
        if (self.returnedMainArr.count == 0) {
            
            self.yzrEmptyImageView.hidden = NO;
            
            self.yzrEmptyLabel.hidden = NO;
            
        }else{
            
            self.yzrEmptyImageView.hidden = YES;
            
            self.yzrEmptyLabel.hidden = YES;
            
        }
        
        
        [self.yjqTableView footerEndRefreshing];
    }fail:^(NSError *error) {
        
    }];
    
    if (self.returnedMaxPageId) {
        
        self.yjqTableView.footerHidden = YES;
    }
    
}



/**
 * XXXXXXXXX
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (tableView.tag == 600000) {
        
        if (self.returningMainArr.count > 0) {
            
            return self.returningMainArr.count;
        }
    }
    if (tableView.tag == 600001) {
        
        if (self.confirmMainArr.count > 0) {
            
            return self.confirmMainArr.count;
        }
    }
    if (tableView.tag == 600002) {
        
        if (self.returnedMainArr.count > 0) {
            
            return self.returnedMainArr.count;
        }
    }
    
    return 0;
}


/**
 * XXXXXXXXX
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

/**
 * XXXXXXXXX
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 600000) {
        
        HKZCell *hkzCell = [tableView dequeueReusableCellWithIdentifier:@"HKZCell"];
        
        if (!hkzCell) {
            
            hkzCell = [[HKZCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HKZCell"];
        }
        
        
        if (self.returningMainArr.count > 0) {
            
            hkzCell.model = [self.returningMainArr objectAtIndex:indexPath.section];

        }
        
        hkzCell.transferButton.tag = indexPath.section + 300000;
        
        [hkzCell.transferButton addTarget:self action:@selector(transferButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        if ([hkzCell.model.isTransfer isEqualToString:@"1"]) {
            
            hkzCell.transferButton.backgroundColor = [XXColor btnGoldenColor];
    
        }else{
            
            //不明颜色
            hkzCell.transferButton.backgroundColor = [UIColor lightGrayColor];
        }
        
        hkzCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return hkzCell;
        
    }
    
    if (tableView.tag == 600001) {
        
        DQRCell *dqrCell = [tableView dequeueReusableCellWithIdentifier:@"DQRCell"];
        
        if (!dqrCell) {
            
            dqrCell = [[DQRCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DQRCell"];
        }
        
        if (self.confirmMainArr.count > 0) {
            
            dqrCell.model = [self.confirmMainArr objectAtIndex:indexPath.section];
        }
        
        dqrCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return dqrCell;
        
    }
    
    if (tableView.tag == 600002) {
        
        YJQCell *yjqCell = [tableView dequeueReusableCellWithIdentifier:@"YJQCell"];
        
        if (!yjqCell) {
            
            yjqCell = [[YJQCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YJQCell"];
        }
        
        //NSLog(@"%ld", indexPath.section);
    
        if (self.returnedMainArr.count > 0) {
            
            yjqCell.model = [self.returnedMainArr objectAtIndex:indexPath.section];

        }
        
        yjqCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return yjqCell;
        
    }
    
    return nil;
}


/**
 * XXXXXXXXX
 */
- (void)transferButtonClicked:(UIButton *)button {
    
    ReturningModel *model = [[ReturningModel alloc] init];
    
    if (self.returningMainArr.count > 0) {
        
        model = [self.returningMainArr objectAtIndex:button.tag - 300000];
        
        if ([model.isTransfer isEqualToString:@"1"]) {
            
            ZRGZViewController *zrgz = [[ZRGZViewController alloc] init];
            
            zrgz.sid = self.sid;
            
            zrgz.tender_from = model.tender_from;
            
            zrgz.oid_tender_id = model.oid_tender_id;
            
            zrgz.pageTag = @"2";
            
            [self.navigationController showViewController:zrgz sender:nil];
            
        }
        
    }
    
}

/**
 * XXXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10 * FitHeight;
}


/**
 * XXXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

/**
 * XXXXXXXXX
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 600000) {
        
        if (self.returningMainArr.count > 0) {
            
            TZJLDetailViewController *tzjlDetailViewController = [[TZJLDetailViewController alloc] init];
            
            ReturningModel *model = [[ReturningModel alloc] init];
            
            model = [self.returningMainArr objectAtIndex:indexPath.section];
            
            tzjlDetailViewController.sid = self.sid;
            
            tzjlDetailViewController.oid_tender_id = model.oid_tender_id;
            
            tzjlDetailViewController.tender_from = model.tender_from;
            
            UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
            
            backIetm.title = @"回款计划";
            
            self.navigationItem.backBarButtonItem = backIetm;
            
            [self.navigationController pushViewController:tzjlDetailViewController animated:YES];
            
        }
    }
}



@end

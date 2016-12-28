//
//  JYJLViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/3/21.
//  Copyright © 2016年 Louding. All rights reserved.
//
//  交易记录的界面

#import "JYJLViewController.h"
#import "JYJLTableViewCell.h"
#import "MJRefresh.h"
#import "JYJLViewXX.h"
#import "UIView+Extension.h"

@interface JYJLViewController ()<UITableViewDataSource, UITableViewDelegate, JYJLViewXXDelegate>

@property (nonatomic, strong) UITableView *jyjlTableView;

@property (nonatomic, strong) JYJLViewXX *menuBackView;

@property (nonatomic, strong) UITableView *menuTableView;

@property (nonatomic, strong) UIView *moveView;

@property (nonatomic, assign) float myY;

@property (nonatomic, assign) float my2Y;

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, strong) NSArray *menuArr;

@property (nonatomic, copy  ) NSString * page;

@property (nonatomic, copy  ) NSString * typeFilter;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, assign) NSInteger listCount;

@property (nonatomic, strong) NSMutableArray *dateArr;

@property (nonatomic, copy) NSString *dateStr;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, assign) NSInteger newPage;

@property (nonatomic, strong) UIImageView *emptyImageView;

@property (nonatomic, strong) UILabel *emptyLabel;

//@property (nonatomic, strong) UIPopoverPresentationController *popoverVC;

@end

@implementation JYJLViewController


/**
 * XXXXXXXX
 */
- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

/**
 * XXXXXXXX
 */
- (void)viewWillAppear:(BOOL)animated {
    
    [self menuDataHandle];
    
}

/**
 * XXXXXXXX
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.dataArr = [NSMutableArray array];
    self.mainArr = [NSMutableArray array];
    self.menuArr = [NSArray array];
    self.my2Y = 0;
    self.page = @"0";
    self.typeFilter = @"0";
    self.dateArr = [NSMutableArray array];
    self.maxPageId = 100;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor * color = [UIColor whiteColor];
    
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.navigationItem.title = @"交易记录";
    
    [self dataHandle];
    
    [self createMenuView];
    
    [self createTableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"caidan"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonCilcked:)];
    
    self.emptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kWIDTH/ 2 -83*FitWidth, 270 * FitHeight - 64, 165 * FitWidth, 110 * FitHeight)];
    
    [self.jyjlTableView addSubview:self.emptyImageView];
    
    self.emptyImageView.image = [UIImage imageNamed:@"empty"];
    
    self.emptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWIDTH/2 -105*FitWidth , 280 * FitHeight + self.emptyImageView.frame.size.height - 64, 210 * FitWidth, 40 * FitHeight)];
    
    [self.jyjlTableView addSubview:self.emptyLabel];
    
    self.emptyLabel.text = @"暂无数据!";
    
    self.emptyLabel.textColor = [UIColor lightGrayColor];
    
    self.emptyLabel.font = [UIFont systemFontOfSize:20];
    
    self.emptyLabel.textAlignment = NSTextAlignmentCenter;
    
    self.emptyImageView.hidden = YES;
    
    self.emptyLabel.hidden = YES;

}


/**
 * XXXXXXXX
 */
- (void)menuDataHandle {
    
    NSString *url = [NSString stringWithFormat:@"%@/account/isloan", HOSTURL];
    NSDictionary *dic = @{@"sid":self.sid};
    [VVNetWorkTool postWithUrl:url body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {

        
        self.listCount = [[result objectForKey:@"listCnt"] integerValue];
        
        
        
        if (self.listCount > 0) {
            
            //self.menuArr = @[@"全部", @"充值", @"提现", @"投资", @"回款", @"返现", @"融资冻结", @"融资放款", @"服务费", @"还款"];
            
            self.menuArr = @[@"全部", @"充值", @"提现", @"投资", @"回款", @"返现", @"服务费", @"还款"];
            
            self.menuTableView.height = kHEIGHT - 44;
            
        }else{
            
            self.menuArr = @[@"全部", @"充值", @"提现", @"投资", @"回款", @"返现"];
            
            self.menuTableView.height = kHEIGHT - 44;
        }
        
        [self.menuTableView reloadData];
        
     } fail:^(NSError *error) {
     
     }];
}


/**
 * XXXXXXXX
 */
- (void)dataHandle {
    
    //NSString *body = [NSString stringWithFormat:@"sid=%@&page=%ld&typeFilter=%ld", self.sid, (long)self.page, (long)self.typeFilter];
    NSDictionary *dic = @{@"sid":self.sid,@"page":self.page,@"typeFilter":self.typeFilter};
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, JYJL];
    
    [VVNetWorkTool postWithUrl:url body:dic bodyType:1 httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.dataArr = [[result objectForKey:@"balanceLogList"] objectForKey:@"items"];
        
        NSString *date = [NSString string];
        
        NSString *newDate = [NSString string];
        

        NSMutableArray *newArr = [NSMutableArray array];
        
        for (int i = 0; i < self.dataArr.count; i++) {
            
            newDate = [[[self.dataArr objectAtIndex:i] objectForKey:@"createTime" ] substringToIndex:7];
            
            if (newDate != date) {
                
                NSDictionary *dic = [NSDictionary dictionaryWithObject:newDate forKey:@"date"];
                
                [newArr addObject:dic];
                
                [newArr addObject:[self.dataArr objectAtIndex:i]];
                
            }else{
                
                [newArr addObject:[self.dataArr objectAtIndex:i]];

            }
            
            date = [[[self.dataArr objectAtIndex:i] objectForKey:@"createTime"] substringToIndex:7];
        
        }
    
        for (NSDictionary *dic in newArr) {
            
            JYJLModel *model = [[JYJLModel alloc] init];

            if ([dic objectForKey:@"date"] != nil) {
                
                model.transactionType = @"";
                
                model.beginningBalance = @"";
                
                model.transactionId = 0;
                
                model.operationAmount = @"";
                
                model.available = @"";
                
                model.createTime = [dic objectForKey:@"date"];
                
            }else{
                
                [model setValuesForKeysWithDictionary:dic];
            }
            
            
            [self.mainArr addObject:model];
        }
        
        [self.jyjlTableView reloadData];
        
        if (self.mainArr.count == 0) {
            
            self.emptyImageView.hidden = NO;
            
            self.emptyLabel.hidden = NO;
            
        }else{
            
            self.emptyImageView.hidden = YES;
            
            self.emptyLabel.hidden = YES;
        }
        
         } fail:^(NSError *error) {
             
    }];
}


/**
 * XXXXXXXX
 */
- (void)rightBarButtonCilcked:(UIButton *)button {

    if (self.menuBackView.hidden == YES) {
        
        self.menuBackView.hidden = NO;
        
    }else{
        
        self.menuBackView.hidden = YES;
    }
    
}


/**
 * XXXXXXXX
 */
- (void)createMenuView {
    
    self.menuBackView = [[JYJLViewXX alloc] initWithFrame:CGRectMake(0, 64, kWIDTH, kHEIGHT)];
    
    self.menuBackView.delegate = self;
    
    [self.navigationController.view addSubview:self.menuBackView];
    
    self.menuBackView.hidden = YES;
    
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT-20)];
    
    [self.menuBackView addSubview:grayView];
    
    grayView.backgroundColor = [UIColor blackColor];
    
    grayView.alpha = 0.3;
    
    self.menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(kWIDTH, 0, kWIDTH - 150 * FitWidth, 200) style:UITableViewStyleGrouped];
    [UIView animateWithDuration:1.0 animations:^{
        
    }];
    [UIView animateWithDuration: 1 delay: 0.35 options: UIViewAnimationOptionCurveEaseInOut animations: ^{
        self.menuTableView.x = 150*FitWidth;
    } completion: ^(BOOL finished) {
        
    }];
    
    
    [self.menuBackView addSubview:self.menuTableView];
    
    self.menuTableView.delegate = self;
    
    self.menuTableView.dataSource = self;
    
    self.menuTableView.rowHeight = 40 * FitHeight;
    
    //self.menuTableView.scrollEnabled = NO;
    
    UILabel *myTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, FitHeight * 3, kWIDTH- 150 * FitWidth, FitHeight * 30)];
    
    [self.menuTableView addSubview:myTitleLabel];
    
    myTitleLabel.textAlignment = NSTextAlignmentCenter;
    
    myTitleLabel.textColor = [UIColor darkGrayColor];
    
    myTitleLabel.text = @"筛选";
    
    self.myY = 35 * FitHeight;
    
    self.moveView = [[UIView alloc] initWithFrame:CGRectMake(self.menuTableView.frame.size.width - FitWidth * 5, 42 * FitHeight, 5 * FitWidth, 30 * FitHeight)];
    
    [self.menuTableView addSubview:self.moveView];
    
    self.moveView.backgroundColor = [UIColor colorWithRed:249 / 255.0 green:106 / 255.0 blue:39 / 255.0 alpha:1.0];
    
    self.moveView.hidden = YES;

}

/**
 * 设置代理方法
 */
- (void)touchesBegan:(JYJLViewXX *)viewXX{
    
    self.menuBackView.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
     self.menuBackView.hidden = YES;
}


/**
 * XXXXXXXX
 */
- (void)closeButtonClicked:(UIButton *)button {
    
    button.selected = !button.isSelected;
    
    if (button.selected) {
        
        self.menuBackView.hidden = YES;
        
    }else{
        
        self.menuBackView.hidden = NO;
    }
}


/**
 * XXXXXXXX
 */
- (void)createTableView {
    
    self.jyjlTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, FitWidth * 375, FitHeight * 667 - 64) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.jyjlTableView];
    
    self.jyjlTableView.delegate = self;
    
    self.jyjlTableView.dataSource = self;
    
    self.jyjlTableView.rowHeight = 60 * FitHeight;
    
}



/**
 * XXXXXXXX
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.jyjlTableView) {
        
        if (self.mainArr.count == 0) {
            
            return 0;
        }
        
        NSString *str = [NSString string];
        
        NSString *newStr = [NSString string];
        
        JYJLModel *model = [[JYJLModel alloc] init];
        
        for (int i = 0; i < self.mainArr.count; i++) {
            
            model = [self.mainArr objectAtIndex:i];
            
            if (model.createTime.length == 7) {
                
                newStr = model.createTime;
                
                if (![newStr isEqualToString:str]) {
                    
                    str = newStr;
                    
                }else{
                    
                    [self.mainArr removeObject:[self.mainArr objectAtIndex:i]];
                }
            }
        }
        
        NSInteger arrCount = self.mainArr.count;
        
        if (arrCount > 0) {
            
            return arrCount;
            
        }else{
            
            return 0;
        }
        
    }else{
    
        if (self.menuArr.count > 0) {
            
            return self.menuArr.count;
            
        }else{
            
            return 0;
        }
    }
}


/**
 * XXXXXXXX
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == self.jyjlTableView) {
        
        NSString *str = [NSString string];
        
        NSString *newStr = [NSString string];
        
        JYJLModel *model = [[JYJLModel alloc] init];
        
        for (int i = 0; i < self.mainArr.count; i++) {
            
            model = [self.mainArr objectAtIndex:i];
            
            if (model.createTime.length == 7) {
                
                newStr = model.createTime;
                
                if (newStr != str) {
                    
                    str = newStr;
                    
                }else{
                    
                    [self.mainArr removeObject:[self.mainArr objectAtIndex:i]];
                }
            }
            
        }
        
        model = [self.mainArr objectAtIndex:indexPath.row];
        
        if ([model.transactionType isEqualToString:@""]) {
            
            UITableViewCell *titleCell= [tableView dequeueReusableCellWithIdentifier:@"JYJLTitleCell"];
            if (!titleCell) {
                
                titleCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JYJLTitleCell"];
            }
            
            NSString *str = [NSString stringWithFormat:@"%@年%@月", [model.createTime substringToIndex:4], [model.createTime substringFromIndex:5]];
            
            titleCell.textLabel.text = str;
            
            titleCell.backgroundColor = [UIColor groupTableViewBackgroundColor];
            
            titleCell.textLabel.font = [UIFont systemFontOfSize:14 * FitWidth];
            
            titleCell.textLabel.textColor = [UIColor darkGrayColor];
            
            return titleCell;
            
        }else{
            
            JYJLTableViewCell *jyjlCell = [tableView dequeueReusableCellWithIdentifier:@"JYJLTableViewCell"];
            
            if (!jyjlCell) {
                
                jyjlCell = [[JYJLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"JYJLTableViewCell"];
                
            }
            
            jyjlCell.model = [self.mainArr objectAtIndex:indexPath.row];
        
            NSString *first = [jyjlCell.operationAmountLabel.text substringToIndex:1];
            
            if ([first isEqualToString:@"-"]) {
            
                jyjlCell.operationAmountLabel.textColor = [UIColor colorWithRed:251 / 255.0 green:114 / 255.0 blue:43 / 255.0 alpha:1.0];
        
            }else{
                
                jyjlCell.operationAmountLabel.textColor = [UIColor colorWithRed:42 / 255.0 green:142 / 255.0 blue:0 / 255.0 alpha:1.0];
                
            }
        
            jyjlCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return jyjlCell;
            
        }
        
    }else{
        
        UITableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
        
        if (!menuCell) {
            
            menuCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCell"];
        }
        
        menuCell.textLabel.text = [self.menuArr objectAtIndex:indexPath.row];
        
        menuCell.textLabel.font = [UIFont systemFontOfSize:16 * FitWidth];
        
        menuCell.textLabel.textColor = [UIColor darkGrayColor];
        
        self.myY = menuCell.frame.size.height;
        
        return menuCell;
    }
}


/**
 * XXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.jyjlTableView) {
        
        if (self.mainArr.count > 0) {
            
            JYJLModel *model = [[JYJLModel alloc] init];
            
            model = [self.mainArr objectAtIndex:indexPath.row];
            
            if ([model.transactionType isEqualToString:@""]) {
                
                return 30 * FitHeight;
                
            }else{
                
                return 60 * FitHeight;
            }
            
        }
        else{
            
            return 35 * FitHeight;
        }
  
    }
    
    return 35 * FitHeight;
}


/**
 * XXXXXXXX
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.menuTableView) {
        
        [self.dataArr removeAllObjects];
        
        [self.mainArr removeAllObjects];

        self.typeFilter = [NSString stringWithFormat:@"%ld",indexPath.row];
        
        [self dataHandle];
        
        self.my2Y = 35 * FitHeight * indexPath.row;
        
        self.menuBackView.hidden = YES;
        
    }
    
}


/**
 * XXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}


/**
 * XXXXXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}



@end

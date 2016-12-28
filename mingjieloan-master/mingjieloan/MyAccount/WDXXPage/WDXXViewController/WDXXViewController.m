//
//  WDXXViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/3/28.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "WDXXViewController.h"
#import "WDXXTableViewCell.h"
#import "WDXXDetailViewController.h"
#import "MJRefresh.h"
#import "WDXXYBViewController.h"
#import "ZZNoDataPromptVC.h"

@interface WDXXViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *wdxxTableView;

@property (nonatomic, strong) UILabel *tishiLabel;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *myID;

@property (nonatomic, strong) ZZNoDataPromptVC *noDataPromptVC;

@end
//ZZNoDataPromptVC

@implementation WDXXViewController

- (ZZNoDataPromptVC *)noDataPromptVC{
    
    if (_noDataPromptVC == nil) {
        
        _noDataPromptVC = [[ZZNoDataPromptVC alloc] init];
        
        [self addChildViewController:_noDataPromptVC];
    }
    
    return  _noDataPromptVC;
}

/**
 *加载控制器
 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.page = 1;
        
        self.dataArr = [NSMutableArray array];
        
        self.mainArr = [NSMutableArray array];
    }
    
    return self;
}


/**
 * XXXXXXX
 */
- (void)viewWillAppear:(BOOL)animated {
    
    [self.wdxxTableView headerBeginRefreshing];
    
}


/**
 * XXXXXXX
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.navigationItem.title = @"全部消息";
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"全部消息" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self createTableView];
}


/**
 * XXXXXXX
 */
- (void)dataHandle {
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%ld", self.sid, (long)self.page];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDXX];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
                  self.dataArr = [result objectForKey:@"messageList"];
        
        for (NSDictionary *dic in self.dataArr) {
            
            WDXXModel *model = [[WDXXModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
        }
        
        if (self.mainArr.count > 0) {
        
            [self.wdxxTableView reloadData];
        }
        
        [self.wdxxTableView headerEndRefreshing];
        
    } fail:^(NSError *error) {
     
    }];
    

}

/**
 * XXXXXXX
 */
- (void)createTableView {
    
    self.wdxxTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, FitHeight * 375, 667 * FitHeight - 64) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.wdxxTableView];
    
    self.wdxxTableView.dataSource = self;
    
    self.wdxxTableView.delegate = self;
    
    [self.wdxxTableView addHeaderWithTarget:self action:@selector(headerRefreshing)];
    
    [self.wdxxTableView addFooterWithTarget:self action:@selector(footerRefreshing)];
    
}


/**
 * 下拉
 */
- (void)headerRefreshing {
    
    //把已经刷新的数据删除,否则越刷新重复数据越多
    [self.mainArr removeAllObjects];
    
    self.page = 1;
    
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%ld", self.sid, (long)self.page];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDXX];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {

        
        self.dataArr = [result objectForKey:@"messageList"];
        
        for (NSDictionary *dic in self.dataArr) {
            
            WDXXModel *model = [[WDXXModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
        }
        
        if (self.mainArr.count > 0) {
            
            [self.noDataPromptVC.view removeFromSuperview];
            [self.wdxxTableView reloadData];
            
        }
        
        else {
            
            //加载没有数据的界面
            [self.view addSubview:self.noDataPromptVC.view];
            
            self.noDataPromptVC.view.frame = self.view.frame;
        }

        
        [self.wdxxTableView headerEndRefreshing];
    }fail:^(NSError *error) {
        
    
    }];
    
}


/**
 *上啦刷新
 */
- (void)footerRefreshing
{
    self.page++;
    NSString *body = [NSString stringWithFormat:@"sid=%@&page=%ld", self.sid, self.page];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDXX];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {

        
        self.dataArr = [result objectForKey:@"messageList"];
        
        for (NSDictionary *dic in self.dataArr) {
            
            WDXXModel *model = [[WDXXModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
        }
        
        if (self.mainArr > 0) {
            
            [self.noDataPromptVC.view removeFromSuperview];
            
            [self.wdxxTableView reloadData];

        }
        
        else {
            
            //加载没有数据的界面
            [self.view addSubview:self.noDataPromptVC.view];
            
            self.noDataPromptVC.view.frame = self.view.frame;
        }
        
        
        [self.wdxxTableView footerEndRefreshing];
    }fail:^(NSError *error) {
        
    
    }];
    
    if (self.maxPageId) {
        
        self.wdxxTableView.footerHidden = YES;
    }
}


/**
 * XXXXX
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.mainArr.count > 0) {
        
        return self.mainArr.count;
        
    }else{
        
        return 0;
    }
}

/**
 * XXXXX
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}


/**
 * XXXXX
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WDXXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WDXXTableViewCell"];
    if (!cell) {
        
        cell = [[WDXXTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WDXXTableViewCell"];
    }

    if (self.mainArr.count > 0) {
        
        cell.model = [self.mainArr objectAtIndex:indexPath.section];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


/**
 * XXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 5 * FitWidth;
        
    }else{
        
        return 2 * FitWidth;
    }
}


/**
 * XXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == self.mainArr.count) {
        
        return 85 * FitWidth;
        
    }else{
    
        return 0.5 * FitWidth;
    }
    
}

/**
 * XXXXX
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.mainArr.count > 0) {
        
        WDXXModel *model = [[WDXXModel alloc] init];
        
        model = [self.mainArr objectAtIndex:indexPath.section];
        
        CGFloat height = [WDXXTableViewCell heightOfLabel:[NSString stringWithFormat:@"%@", model.subject] andWith:375 * FitWidth - 170 * FitWidth];
        
        return height + 110 * FitHeight;
    }
    
    
    return 0 ;
    
}

/**
 * XXXXX
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (section == self.mainArr.count) {
    
        self.tishiLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 , FitWidth * 375, 50 * FitHeight)];
        [tableView addSubview:self.tishiLabel];
        
        self.tishiLabel.textColor = [UIColor darkGrayColor];
        
        self.tishiLabel.font = [UIFont systemFontOfSize:12 * FitWidth];
        
        self.tishiLabel.textAlignment = NSTextAlignmentCenter;
        
        self.tishiLabel.text = @"提示: 仅显示最近 60 天的消息";
        
        return self.tishiLabel;
        
    }else{
    
        return nil;
    }
    
}

/**
 * XXXXX
 */
- (void)sendData {
    
    NSString *body = [NSString stringWithFormat:@"id=%@", self.myID];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, WDXXREAD];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
    }fail:^(NSError *error) {
        
    }];
}

/**
 * XXXXX
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
#if 1
    WDXXDetailViewController *wdxxDetailViewController = [[WDXXDetailViewController alloc] init];
    
    WDXXModel *model = [[WDXXModel alloc] init];
    
    model = [self.mainArr objectAtIndex:indexPath.section];
    
    self.myID = [NSString stringWithFormat:@"%@", model.id];
    
    [self sendData];
    
    
    if (model.msg_type.integerValue == 5) {
        
        WDXXYBViewController *yuebao = [[WDXXYBViewController alloc] init];
        
        yuebao.sid = self.sid;
        
        yuebao.msgTitle = model.subject;
        
        yuebao.date = model.ins_date;
        
        yuebao.month = model.subject;
        
        [self.navigationController pushViewController:yuebao animated:YES];
        
    }else{
        
        wdxxDetailViewController.msgTitle = model.subject;
        
        wdxxDetailViewController.date = model.ins_date;
        
        wdxxDetailViewController.msg = model.contents;
        
        UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
        
        backIetm.title =@"全部消息";
        
        self.navigationItem.backBarButtonItem = backIetm;
        
        
        [self.navigationController pushViewController:wdxxDetailViewController animated:YES];
    }
    
#endif
    

    
}




@end

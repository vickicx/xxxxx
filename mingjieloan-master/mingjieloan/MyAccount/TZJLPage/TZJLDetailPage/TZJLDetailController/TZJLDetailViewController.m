//
//  TZJLDetailViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/7/12.
//  Copyright © 2016年 Louding. All rights reserved.
//

#import "TZJLDetailViewController.h"
#import "TZJLTitleCell.h"
#import "TZJLDetail1Cell.h"
#import "TZJLDetail2Cell.h"
#import "TZJLDetailContractCell.h"
#import "TZJLDetail3Cell.h"
#import "ContractWebViewController.h"

@interface TZJLDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) NSArray *returnDataArr;

@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, strong) NSMutableArray *returnMainArr;

@property (nonatomic, strong) NSArray *contractArr;

@property (nonatomic, copy) NSString *url;

@end

@implementation TZJLDetailViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.dataArr = [NSArray array];
        
        self.returnDataArr = [NSArray array];
        
        self.mainArr = [NSMutableArray array];
        
        self.returnMainArr = [NSMutableArray array];
        
        self.contractArr = [NSArray array];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.navigationItem.title = @"回款详情";
    
    
    [self dataHandle];
    
    [self createTableView];
}

- (void)dataHandle
{
    NSString *body = [NSString stringWithFormat:@"sid=%@&oid_tender_id=%@&tender_from=%@", self.sid, self.oid_tender_id, self.tender_from];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, RETURNDETAIL];
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
    
       
//        self.dataArr = result;
        
        NSDictionary *dic = result;
        
        self.contractArr = [dic objectForKey:@"agreement_items"];
        
        self.url = [dic objectForKey:@"url"];
        
//        for (NSDictionary *dic in self.dataArr) {
//            
//            TZJLDetailModel *model = [[TZJLDetailModel alloc] init];
//            
//            [model setValuesForKeysWithDictionary:dic];
//            
//            [self.mainArr addObject:model];
//        }
        
        TZJLDetailModel *model = [[TZJLDetailModel alloc] init];
        
        [model setValuesForKeysWithDictionary:dic];
        
        [self.mainArr addObject:model];
        
        self.returnDataArr = [dic objectForKey:@"items"];
        
        for (NSDictionary *dic in self.returnDataArr) {
            
            ReturnItems *model = [[ReturnItems alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.returnMainArr addObject:model];
        }
        
        if (self.mainArr.count > 0) {
            
            
                [self.tableView reloadData];

            
        }
        
    } fail:^(NSError *error) {
     
    }];
}

- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.mainArr.count > 0) {
        
        if (section == 0) {
            
            return 2;
        }
        if (section == 1) {
            
            if (self.contractArr.count > 0) {
                
                return 4 + self.contractArr.count;
            }
            
        }
        
        if (section == 2) {
            
            if (self.returnMainArr.count > 0) {
                
                return self.returnMainArr.count + 2;
                
            }
            
        }
        
    }
    
    
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TZJLDetailModel *model = [[TZJLDetailModel alloc] init];
    
    if (self.mainArr.count > 0) {
        
        model = [self.mainArr objectAtIndex:0];

    }
    
    
    if (indexPath.row == 0) {
        
        TZJLTitleCell *titleCell = [tableView dequeueReusableCellWithIdentifier:@"TZJLTitleCell"];
        if (!titleCell) {
            
            titleCell = [[TZJLTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TZJLTitleCell"];
            
            if (indexPath.section == 0) {
                
                titleCell.titleLabel.font = [UIFont systemFontOfSize:15 * FitWidth];
                titleCell.titleLabel.text = model.products_title;
                
                titleCell.rightLabel.font = [UIFont systemFontOfSize:15 * FitWidth];
                titleCell.rightLabel.textColor = [UIColor colorWithRed:47 / 255.0 green:55 / 255.0 blue:85 / 255.0 alpha:1.0];
                titleCell.rightLabel.textAlignment = NSTextAlignmentRight;
                titleCell.rightLabel.text = model.products_status;
                
                
                
            }
            
            if (indexPath.section == 1) {
                
                titleCell.titleLabel.text = @"应收本息";
                
                titleCell.rightLabel.font = [UIFont systemFontOfSize:14 * FitWidth];
                titleCell.rightLabel.textColor = [XXColor labGoldenColor];
                titleCell.rightLabel.textAlignment = NSTextAlignmentRight;
                titleCell.rightLabel.text = [NSString stringWithFormat:@"¥%@元", model.total_and_extra];
                
            }
            
            if (indexPath.section == 2) {
                
                titleCell.titleLabel.font = [UIFont systemFontOfSize:14 * FitWidth];
                titleCell.titleLabel.text = @"回款明细";
                
            }
        }
        
        
        titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return titleCell;
        
    }else{
        
        if (indexPath.section == 0) {
            
            TZJLDetail1Cell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"TZJLDetail1Cell"];
            if (!cell1) {
                    
                cell1 = [[TZJLDetail1Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TZJLDetail1Cell"];
                
            }
            
            cell1.model = model;
            
            
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell1;
            
        }
        
    
        if (indexPath.section == 1) {
            
            if (indexPath.row < 4) {
                
                TZJLDetail2Cell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"TZJLDetail2Cell"];
                
                if (!cell2) {
                    
                    cell2 = [[TZJLDetail2Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TZJLDetail2Cell"];
                    
                }
                
                if (indexPath.row == 1) {
                    
                    cell2.titleLabel.text = @"应收本金";
                    
                    cell2.priceLabel.text = [NSString stringWithFormat:@"%@元", model.finance_amount];
                }
                if (indexPath.row == 2){
                    
                    cell2.titleLabel.text = @"应收利息";
                    
                    cell2.priceLabel.text = [NSString stringWithFormat:@"%@元", model.extra];
                }
                if (indexPath.row == 3) {
                    
                    cell2.titleLabel.text = @"应收违约金";
                    
                    cell2.priceLabel.text = [NSString stringWithFormat:@"%@元", model.penalbond];
                }
                
                cell2.selectionStyle = UITableViewCellSelectionStyleNone;
                
                return cell2;
                
            }else{
                
                TZJLDetailContractCell *contractCell = [tableView dequeueReusableCellWithIdentifier:@"TZJLDetailContractCell"];
                if (!contractCell) {
                    
                    contractCell = [[TZJLDetailContractCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TZJLDetailContractCell"];
                }
                
//                if (indexPath.row == 4) {
//                    
//                    contractCell.titleLabel.text = @"借款合同";
//                    
//                    contractCell.statusLabel.text = @"已签署";
//                }
//                if (indexPath.row == 5) {
//                    
//                    contractCell.titleLabel.text = @"保证合同";
//                    
//                    contractCell.statusLabel.text = @"已签署";
//                }
//                if (indexPath.row == 6) {
//                    
//                    contractCell.titleLabel.text = @"出借人咨询服务协议";
//                    
//                    contractCell.statusLabel.text = @"已签署";
//                }
                
                if (self.contractArr.count > 0) {
                    
                    contractCell.titleLabel.text = [self.contractArr objectAtIndex:indexPath.row - 4];
                    
                    contractCell.statusLabel.text = @"已签署";
                    
                }
                
                
                
                contractCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                contractCell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                return contractCell;
            }

            
        
        }

        if (indexPath.section == 2) {

            TZJLDetail3Cell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"TZJLDetail3Cell"];
        
            if (!cell3) {

                cell3 = [[TZJLDetail3Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TZJLDetail3Cell"];

            }
            
            if (indexPath.row == 1) {
                
                cell3.receiveDateLabel.text = @"回款日期";
                cell3.principalLabel.text = @"本金(元)";
                cell3.rateLabel.text = @"利息(元)";
                cell3.totalLabel.text = @"总额(元)";
                cell3.statusLabel.text = @"状态";
            }else{
                
                
                if (self.returnMainArr.count > 0) {
                    
                    cell3.model = [self.returnMainArr objectAtIndex:indexPath.row - 2];

                }
                
                
                
            }
            
            cell3.selectionStyle = UITableViewCellSelectionStyleNone;

            return cell3;
            
        }
        
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        return 40 * FitHeight;
    }else{
        
        if (indexPath.section == 0) {
            
            return 100 * FitHeight;
            
        }else if (indexPath.section == 1){
            
            if (indexPath.row < 4) {
                
               return 30 * FitHeight;
            }else{
                
                return 40 * FitHeight;
            }
            
        }else{
            
            return 30 * FitHeight;
        }
        
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10 * FitHeight;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.1;
}


// MARK: - 查看合同
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        
        if (indexPath.row >= 4) {
            
            if (self.contractArr.count > 0) {
                
                ContractWebViewController *contractWebController = [[ContractWebViewController alloc] init];
                
                contractWebController.url = [NSString stringWithFormat:@"%@%@", ProtocolURL, self.url];
                
                UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
                
                backIetm.title = @"返回";
                
                self.navigationItem.backBarButtonItem = backIetm;
                
                [self.navigationController pushViewController:contractWebController animated:YES];
                
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

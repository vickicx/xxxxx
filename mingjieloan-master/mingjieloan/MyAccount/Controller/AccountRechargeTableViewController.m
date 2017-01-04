//
//  AccountRechargeTableViewController.m
//  mingjieloan
//
//  Created by vicki on 2017/1/4.
//  Copyright © 2017年 mingjie. All rights reserved.
//

#import "AccountRechargeTableViewController.h"

@interface AccountRechargeTableViewController ()

@end

@implementation AccountRechargeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hasError = false;
    self.zhanghuyue = @"0.00";
    self.title = @"充值";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeAction:) name:UITextFieldTextDidChangeNotification object:nil];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//- (void)changeAction:(NSNotification *)ification
//{
//    
//    UITextField *textFiled = ification.object;
//    
//    self.accountLab.text = [NSString stringWithFormat:@"%@元", textFiled.text];
//    self.zhanghuyue = textFiled.text;
//    
//}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"充值";
    UIBarButtonItem *backIetm = [[UIBarButtonItem alloc] init];
    backIetm.title =@"返回";
    self.navigationItem.backBarButtonItem = backIetm;
    [self headerDataHandle];
    
    
}

- (void)headerDataHandle {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, RECHARGEMSG];
    
    NSDictionary *body = @{@"sid":self.sid};
    
    JGProgressHUD *hud = [[JGProgressHUD alloc] initWithStyle:0];
    
    hud.textLabel.text = @"加载中...";
    
    [hud showInView:self.view];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType: 0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        [hud dismiss];
        
        self.accountLab.text = [NSString stringWithFormat:@"%@元",[result objectForKey:@"available"]];
//
//        self.interest = [result objectForKey:@"totalInterest"];
//        
//        self.expectedReturn = [result objectForKey:@"unrepaidInterest"];
//        
//        self.zaitouPriceLabel.text = self.investing;
//        
//        self.daishoubenjinLabel.text = self.expectedReturn;
//        
//        self.leijishouyiLabel.text = self.interest;
        
        
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        return 80*FitHeight;
    }else {
        return 60*FitHeight;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    if (indexPath.row == 0) {
        UILabel *yue = [[UILabel alloc] initWithFrame:CGRectMake(30*FitWidth, 5 * FitHeight, 100*FitWidth, cell.height)];
        yue.text = @"账户余额：";
        yue.font = [UIFont systemFontOfSize:12];
        yue.textColor = [UIColor grayColor];
        [cell addSubview:yue];
        self.accountLab = [[UILabel alloc] initWithFrame:CGRectMake(yue.right + 5 * FitWidth, yue.top, yue.width, yue.height)];
        self.accountLab.text = [NSString stringWithFormat:@"%@元", self.zhanghuyue];
        self.accountLab.font = [UIFont systemFontOfSize:12];
        self.accountLab.textColor = [XXColor labelGoldenColor];
        [cell addSubview:self.accountLab];
    }else if(indexPath.row == 1) {
        UILabel *czLab = [[UILabel alloc] initWithFrame:CGRectMake( -5 * FitWidth, 5 * FitHeight, 80 * FitWidth, cell.height)];
        czLab.text = @" 充值金额:";
        czLab.textAlignment = NSTextAlignmentCenter;
        czLab.font = [UIFont systemFontOfSize:12];
        czLab.textColor = [UIColor grayColor];
        self.money = [[UITextField alloc] initWithFrame:CGRectMake((kWIDTH - cell.width - 20 ) / 2, 0, cell.width + 20 , cell.height)];
        self.money.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.money.leftView = czLab;
        self.money.leftViewMode = UITextFieldViewModeAlways;
        self.money.placeholder = @"0元<充值金额<1000万";
         self.money.font = [UIFont systemFontOfSize:12];
        self.money.keyboardType = UIKeyboardTypeDecimalPad;
        [cell addSubview:self.money];
    
    }else if(indexPath.row == 2) {
        self.czBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.czBtn.frame = CGRectMake((kWIDTH - cell.width + 40) / 2, 20 , cell.width - 40 , 35);
        self.czBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.czBtn.backgroundColor = [XXColor btnGoldenColor];
        self.czBtn.titleLabel.textColor = [UIColor whiteColor];
        
        [self.czBtn setTitle:@"确定充值" forState:0];
        [self.czBtn addTarget:self action:@selector(rechargebutton:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:self.czBtn];
    }else if(indexPath.row == 3) {
        UIButton *dsf = [UIButton buttonWithType:UIButtonTypeCustom];
        dsf.frame = CGRectMake(30*FitWidth, 5 * FitHeight, 120 * FitWidth, 35);
        dsf.titleLabel.font = [UIFont systemFontOfSize:13];
        dsf.titleLabel.textColor = [UIColor lightGrayColor];
        [dsf setTitle:@"平台第三方合作充值渠道：" forState:0];
        [cell addSubview:dsf];
    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
}
//充值按钮点击事件
-(void)rechargebutton:(UIButton *)button {
    
}
//第三方合作充值渠道
-(void)dsfbutton:(UIButton *)button {
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

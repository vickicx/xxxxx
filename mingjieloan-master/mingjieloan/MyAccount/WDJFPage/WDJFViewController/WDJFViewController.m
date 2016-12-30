//
//  WDJFViewController.m
//  Yilicai
//
//  Created by 盐商 on 16/3/28.
//  Copyright © 2016年 Louding. All rights reserved.
//
//  积分商城的主界面

#import "WDJFViewController.h"
#import "WDJFCollectionViewCell.h"
#import "ExchangeViewController.h"
#import "ExchangeView.h"
#import "DidExchangedView.h"
#import "MJRefresh.h"
#import "XXColor.h"
#import "UIView+Extension.h"

@interface WDJFViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *wdjfCollectionView;

@property (nonatomic, strong) UIImageView *headImageView;

@property (nonatomic, strong) UIView *headView;

@property (nonatomic, strong) UISegmentedControl *headSegmentedControl;

@property (nonatomic, strong) ExchangeView *exchangeView;

@property (nonatomic, strong) DidExchangedView *didExchangedView;

@property (nonatomic, assign) NSInteger exchangeNumber;

@property (nonatomic, copy) NSString *exchangeTitle;

@property (nonatomic, strong) ExchangeViewController *exchangeViewController;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *mainArr;

@property (nonatomic, copy) NSString *ex_title;

@property (nonatomic, copy) NSString *cost_point;

@property (nonatomic, copy) NSString *commodity_id;

@property (nonatomic, copy) NSString *red_packet_id;

/** 创建1个View */
@property (strong, nonatomic) UIView *viewXX1;
@property (strong, nonatomic) UIView *viewXX2;

@end

@implementation WDJFViewController

/**
 * XXXXXXX
 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.dataArr = [NSMutableArray array];
        
        self.mainArr = [NSMutableArray array];
    }
    
    return self;
}

/**
 * XXXXXXX
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIColor * color = [UIColor whiteColor];
    
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
    self.navigationItem.title = @"积分商城";
    
    [self dataHandle];
    
    [self createCollectionView];
    
    self.exchangeView = [[ExchangeView alloc] initWithFrame:CGRectMake(0, 64, kWIDTH, kHEIGHT- 64)];
    [self.view addSubview:self.exchangeView];
    
    self.exchangeView.hidden = YES;
    
    //self.exchangeTitle = @"您确定使用积分兑换现金券吗?";
    self.exchangeView.exchangeTitleLabel.text = self.exchangeTitle;
    
    [self.exchangeView.closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.exchangeView.okButton addTarget:self action:@selector(okButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.didExchangedView = [[DidExchangedView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, kHEIGHT)];
    
    [self.view addSubview:self.didExchangedView];
    
    self.didExchangedView.hidden = YES;
    
    [self.didExchangedView.closeButton addTarget:self action:@selector(didCloseButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}


/**
 * 我要兑换button
 */
- (void)exchangeBtnClicked:(UIButton *)button {
    
    NSInteger num = button.tag - 100000;
    
    JFSCModel *model = [[JFSCModel alloc] init];
    
    if (self.mainArr.count > 0) {
        
        model = [self.mainArr objectAtIndex:num];
        
        self.ex_title = model.title;
        
        self.cost_point = model.cost_point;
        
        self.commodity_id = model.commodity_id;
        
        self.red_packet_id = model.red_packet_id;
        
        self.exchangeView.hidden = NO;
        
        self.exchangeView.exchangeTitleLabel.text = [NSString stringWithFormat:@"您确定使用%@积分兑换%@吗?", self.cost_point, self.ex_title];
    }
    
}

/**
 * 取消兑换button
 */
- (void)closeButtonClicked:(UIButton *)button {
    
    self.exchangeView.hidden = YES;
    
}

/**
 * 确定兑换button
 */
- (void)okButtonClicked:(UIButton *)button {
    
    self.exchangeView.hidden = YES;
    
    self.didExchangedView.hidden = NO;
    
    self.didExchangedView.picImageView.image = [UIImage imageNamed:@""];
    
    self.didExchangedView.titleLabel.text = @"";
    
    self.didExchangedView.msgLabel.text = @"";
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, JFMALLEXCHANGE];
    

    NSDictionary *body = [NSDictionary dictionaryWithObjectsAndKeys:@"sid",MySid,@"commodity_id",self.commodity_id,@"red_packet_id",self.red_packet_id,@"cost_point",self.cost_point, nil];
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        NSString *is_success = [result objectForKey:@"is_success"];
        
        if ([is_success isEqualToString:@"fail"]) {
            
            self.didExchangedView.picImageView.image = [UIImage imageNamed:@"ex_fail"];
            
            self.didExchangedView.titleLabel.text = @"对不起 ！";
            
            self.didExchangedView.msgLabel.text = @"您的积分不足 ！";
            
        }else{
            
            self.didExchangedView.picImageView.image = [UIImage imageNamed:@"ex_success"];
            
            self.didExchangedView.titleLabel.text = @"恭喜您 ！";
            
            self.didExchangedView.msgLabel.text = [NSString stringWithFormat:@"兑换“%@”成功！", self.ex_title];
        }
        
        [self headerRefreshing];
    
    } fail:^(NSError *error) {

    }];
    
}


/**
 *关闭兑换成功button
 */
- (void)didCloseButtonClicked:(UIButton *)button {
    
    self.didExchangedView.hidden = YES;
}

/**
 *确认兑换
 */
- (void)exchangeDataHandle
{
//    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, JFMALLEXCHANGE];
//    NSString *body = [NSString stringWithFormat:@"sid=%@&commodity_id=%@&red_packet_id=%@&cost_point=%@", self.sid, self.commodity_id, self.red_packet_id, self.cost_point];

}

/**
 *XXXXXX
 */
- (void)dataHandle {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, JFMALL];
    
    NSDictionary *body = [NSDictionary dictionaryWithObjectsAndKeys:@"sid", MySid,@"type", (long)self.type, nil];
    
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.dataArr = [result objectForKey:@"mallMapList"];
        
        for (NSDictionary *dic in self.dataArr) {
            
            JFSCModel *model = [[JFSCModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
        }
    
        if (self.mainArr.count > 0) {
            
            [self.wdjfCollectionView reloadData];
        }
        
    } fail:^(NSError *error) {

    }];
}


/**
 *XXXXXXXXX
 */
- (void)createCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

    
    //单元格最小行间距
    flowLayout.minimumLineSpacing = 5 * FitWidth;
    
    //最小的左右间距
    flowLayout.minimumInteritemSpacing = 3 * FitWidth;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(5 * FitHeight, 0, 0, 0);

    self.wdjfCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kHEIGHT) collectionViewLayout:flowLayout];
    
    [self.view addSubview:self.wdjfCollectionView];
    
    self.wdjfCollectionView.dataSource = self;
    
    self.wdjfCollectionView.delegate = self;
    
    self.wdjfCollectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.wdjfCollectionView registerClass:[WDJFCollectionViewCell class] forCellWithReuseIdentifier:@"WDJFCollectionViewCell"];
    
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, FitHeight * 150)];
    
    [self.wdjfCollectionView addSubview:self.headView];
    
    self.headView.backgroundColor = [UIColor whiteColor];
    
    self.headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWIDTH, 100 * FitHeight)];
    
    [self.headView addSubview:self.headImageView];
    
    self.headImageView.image = [UIImage imageNamed:@"jifenhead"];
    
    //初始化选择器
    [self setupSegmentedControl];
    
    [self.wdjfCollectionView addHeaderWithTarget:self action:@selector(headerRefreshing)];
    
}

/**
 *设置选择器
 */
- (void)setupSegmentedControl{
    
    self.headSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"全部商品", @"现金券"]];
    
    self.headSegmentedControl.tintColor = [UIColor clearColor];
    
    [self.headView addSubview:self.headSegmentedControl];
    
    self.headSegmentedControl.frame = CGRectMake(15 * FitWidth, 10 * FitHeight + self.headImageView.frame.size.height, kWIDTH - 30 * FitWidth, 30 * FitHeight);
    self.viewXX1 = [[UIView alloc] init];
    self.viewXX1.backgroundColor = [UIColor clearColor];
    self.viewXX1.frame = CGRectMake(15 * FitWidth + 20, 10 * FitHeight + self.headImageView.frame.size.height + self.headSegmentedControl.frame.size.height, (kWIDTH - 30 * FitWidth - 40),2);
    [self.headView addSubview:self.viewXX1];
    
    self.viewXX2 = [[UIView alloc] init];
    self.viewXX2.backgroundColor = [XXColor goldenColor];
    self.viewXX2.frame = CGRectMake(0, 0, self.viewXX1.width * 0.5 - 20, 2);
    [self.viewXX1 addSubview:self.viewXX2];
    
    self.headSegmentedControl.selectedSegmentIndex = 0;
    
    [self.headSegmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:(UIControlEventValueChanged)];
    
    
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    
    dic1[NSForegroundColorAttributeName] = [XXColor goldenColor];
    
    dic1[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
    
    dic2[NSForegroundColorAttributeName] = [UIColor colorWithRed:23/255.0 green:23/255.0 blue:23/255.0 alpha:1.0];
    
    dic2[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    
    [self.headSegmentedControl setTitleTextAttributes:dic1 forState:UIControlStateSelected];
    [self.headSegmentedControl setTitleTextAttributes:dic2 forState:UIControlStateNormal];

}

/**
 *XXXXXXXXXX
 */
- (void)headerRefreshing {
    [self.mainArr removeAllObjects];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", HOSTURL, JFMALL];
    
    
    NSDictionary *body = [NSDictionary dictionaryWithObjectsAndKeys:@"sid", MySid,@"type", (long)self.type, nil];
    
    [VVNetWorkTool postWithUrl:url body:body bodyType:BodyTypeDictionary httpHeader:nil responseType:0 progress:^(NSProgress *progress) {
        
    } success:^(id result) {
        
        self.dataArr = [result objectForKey:@"mallMapList"];
        
        for (NSDictionary *dic in self.dataArr) {
            
            JFSCModel *model = [[JFSCModel alloc] init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.mainArr addObject:model];
        }
        
        
        if (self.mainArr.count > 0) {
            
            [self.wdjfCollectionView reloadData];
        }
        
        [self.wdjfCollectionView headerEndRefreshing];
       
         } fail:^(NSError *error) {
             
    }];
}




#pragma mark segment的点击事件
/**
 *pragma mark segment的点击事件
 */
-(void)segmentAction:(UISegmentedControl *)segment{
    
    switch (segment.selectedSegmentIndex) {
            
        case 0:{
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.viewXX2.x = 0;
            }];
            
            [self.mainArr removeAllObjects];
            
            self.type = 0;
            
            [self dataHandle];
            
            break;
        }
            
        case 1:{
            
            [UIView animateWithDuration:0.3 animations:^{
                
                self.viewXX2.x = self.viewXX1.width * 0.5 + 20;
            }];
            
            [self.mainArr removeAllObjects];
            
            self.type = 1;
            
            [self dataHandle];
            
            break;
        }
            
        default:
            break;
    }
    
}



#pragma mark 返回头尾视图的高度
/**
 *返回头尾视图的高度
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(self.view.frame.size.width, 150 * FitHeight);
    
}

/**
 *XXXXXXXXXXX
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.mainArr.count > 0) {
        
        return self.mainArr.count;
        
    }else{
        
        return 0;
    }
}

/**
 *XXXXXXXX
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"WDJFCollectionViewCell";
    
    WDJFCollectionViewCell *wdjfCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (self.mainArr.count > 0) {
        
        wdjfCell.model = [self.mainArr objectAtIndex:indexPath.item];
    }
    
    if ([wdjfCell.restLabel.text isEqualToString:@"库存0个"]) {
        
        [wdjfCell.exchangeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [wdjfCell.exchangeBtn.layer setBorderColor:[UIColor grayColor].CGColor];
        
        wdjfCell.exchangeBtn.userInteractionEnabled = NO;
        
    }else{
        
        [wdjfCell.exchangeBtn setTitleColor:[XXColor borderAllColor] forState:UIControlStateNormal];
        
        [wdjfCell.exchangeBtn.layer setBorderColor:[XXColor borderAllColor].CGColor];
        
         wdjfCell.exchangeBtn.userInteractionEnabled = YES;
    }
    
    wdjfCell.exchangeBtn.tag = indexPath.item + 100000;
    
    [wdjfCell.exchangeBtn addTarget:self action:@selector(exchangeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return wdjfCell;
}

/**
 *XXXXXXXXXX
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((kWIDTH - 5) / 2, FitHeight * 220);
}



@end

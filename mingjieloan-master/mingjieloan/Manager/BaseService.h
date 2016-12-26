//
//  BaseService.h
//  mingjieloan
//
//  Created by vicki on 2016/12/21.
//  Copyright © 2016年 vicki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseService : NSObject
#define response_status_ok 0 //操作成功
#define response_status_not_login 10000 //未登录
#define response_status_params_error 9999 //操作失败
#define response_status_page_error 10002 //翻页接口 页码不合法

#define HTTP @"http"

/* 正式地址 */
//let HOST = "www.dlmjcf.com/mapp"
//let ProtocolHost = "www.dlmjcf.com"



//let HOST = "www.dlmjcf.com:9080/mapp"
//let ProtocolHost = "www.dlmjcf.com:9080"

//let HOST = "yanshangkj.f3322.net:5151/mapp"
//let ProtocolHost = "yanshangkj.f3322.net:5151"

//自己的测试地址192.168.1.134
//let HOST = "192.168.1.151:8080/mapp"
//let ProtocolHost = "192.168.1.151:8080"


// MARK: - RegisterService

// MARK: - 发送注册手机验证码
#define SENDCODE @"/reg/sendcode"

// MARK: - 普通注册
#define REGISTER @"/register/noOauth"


// MARK: - LoginService

// MARK: - 获取验证码
#define CAPTCHA @"/etc/captcha"

// MARK: - 普通登录，账号和密码
#define LOGIN @"/login/noOauth"

// MARK: - 登出
#define LOGOUT @"/logout/true"

// MARK: - ProductService

// MARK: - 产品列表
#define PRODUCTALL @"/product/all"

// MARK: - 产品详情（有参数）
#define PRODUCTDETAIL @"/product/personal-loan/detail"

// MARK: - 债权产品详情（有参数）
#define TRANSFERDETAIL @"/product/personal-loan/detail-transfer"

// MARK: - 普通产品和债权产品的下单接口在ProductService

// MARK: - 下单成功后获取易宝参数接口在ProductService

// MARK: - 服务协议，下单用
#define SERVICE @"/protocol/service"

// MARK: - 借款协议（有参数）
#define CONTRACT @"/protocol/contract"

// MARK: - app banner
#define BANNER @"/appadv"


// MARK: - UserService

// MARK: - 用户基本信息
#define MY @"/my"

// MARK: - 动态获取积分的数量
#define INTEGRAL @"/point/all"

// MARK: - 签到
#define SIGN @"/my/user/sign"

// MARK: - 添加用户名
#define NAME @"/my/name"

// MARK: - 修改密码
#define PASSWORD @"/my/password"

// MARK: - 添加用户身份证信息
#define ACCOUNTREGISTER @"/account/register"

// MARK: - 用户基本信息
#define MYBASIC @"/my/basic"

// MARK: - 红包管理
#define MYCASH @"/my/cash"

// MARK: - 可用现金券
#define ENABLECASH @"/product/enablecash"

// MARK: - 交易记录
#define MYBILL @"/my/bill"

// MARK: - 投资纪录 - 回款中
#define MYORDER @"/my/order"

// MARK: - 投资纪录 - 待确认（进行中的投资）
#define MYORDERPENDING @"/my/order/pending"

// MARK: - 投资纪录 - 已结清的投资
#define MYORDERCLOSED @"/my/order/closed"

// MARK: - 投资纪录 - 已流标的投资
#define MYORDERABORTED @"/my/order/aborted"

// MARK: - 我的邀请记录
#define INVITATION @"/my/invitation"

// MARK: - 绑定银行卡
#define BINDCARD @"/account/bindcard"

// MARK: - 交易记录(借贷方判断)
#define BINDCARDISLOAN @"/account/bindcard/isloan"

// MARK: - AccountService

// MARK: - 用户充值页信息
#define RECHARGEMSG @"/account/recharge/info"

// MARK: - 用户充值
#define RECHARGE @"/account/recharge"

// MARK: - 用户提现
#define WITHDRAW @"/account/withdraw"

// MARK: - 用户提现（手续费等提示信息）
#define WITHDRAWBILL @"/my/withdraw-bill"

// MARK: - AppService

// MARK: - 公告列表
#define ANNOUNCE @"/article/announce"

// MARK: - 获取最新版本
#define VERSIONGET @"/api/version/get"


// MARK: - FindBackService

// MARK: - 获取sid用于找回密码
#define ISLOGIN @"/islogin"

// MARK: - 给手机发送验证码用于找回密码
#define FINDBACKSENDCODE @"/findback/sendcode"

// MARK: - 验证手机验证码是否正确
#define FINDBACK @"/findback/find"

// MARK: - 重新设置密码
#define FINDBACKRESET @"/findback/reset"

// MARK: - 修改交易密码
#define CHANGETRADINGPASSWORD @"/account/changepaypassword"

typedef NS_ENUM(NSInteger, ResponseRrrorMessage) {
    network,
    data_error,
    param_error,
    not_login,
    unknow_error
};

#define getResponseRrrorMessage (ResponseRrrorMessage == nil ? ResponseRrrorMessage = [[NSArray alloc] initWithObjects:\
@"数据错误,请重试！",\
@"数据有误,请重试！",\
@"参数有误！请重试！",\
@"用户未登录",\
@"未知错误", nil nil] : ResponseRrrorMessage)


//如传入network 则返回数据错误,请重试！
#define ResponseRrrorMessageString(type) ([getResponseRrrorMessage objectAtIndex:type])


@end

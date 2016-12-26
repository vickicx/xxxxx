//
//  LoginUser.m
//  mingjieloan
//
//  Created by vicki on 2016/12/21.
//  Copyright © 2016年 mingjie. All rights reserved.
//

#import "LoginUser.h"

@implementation LoginUser
-(BOOL)saveLoginUser:(LoginModel *)loginModel {
    //获得文件路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"LoginUser.txt"];
    
        BOOL success =  [NSKeyedArchiver archiveRootObject:loginModel toFile:filePath];
   
    if ( success ) {
        return true;
    }else{
        return false;
    }
}

-(LoginModel *)readLoginUser {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"LoginUser.txt"];
    NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    LoginModel *login = [[LoginModel alloc]initWithDictionary:dic];
    if (dic != nil) {
        return login;
    }else {
        return nil;
    }
}

-(void)removeLoginUser{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"LoginUser.txt"];
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager isDeletableFileAtPath:filePath]) {
        [defaultManager removeItemAtPath:filePath error:nil];
    }
    
    
}


@end

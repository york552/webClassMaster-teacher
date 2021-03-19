//
//  HttpManager.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/16.
//

#import "HttpManager.h"
#import "URL.h"
#import <YYModel/YYModel.h>

typedef NS_ENUM(NSInteger, HttpType) {
    HttpTypeGet            = 0,
    HttpTypePost,
    HttpTypePut,
    HttpTypeDelete,
};
#define HttpTypeStrings  (@[@"GET",@"POST",@"PUT",@"DELETE"])


@implementation HttpManager
//创建房间
+ (void)schduleClassWithConfig:(SchduleClassConfiguration *)config  success:(OnSchduleClassSuccessBlock)successBlock failure:(OnHttpFailureBlock)failureBlock {
    
    AFHTTPSessionManager *sessionManager = [HttpManager sessionManager];
    
    NSString *url = [NSString stringWithFormat:HTTP_SCHDULE_CLASS, BASE_URL, config.appId, config.roomUuid];
    
    //进行http basic认证
    NSString *authString = [NSString stringWithFormat:@"%@:%@", config.customerId, config.customerCertificate];
    NSData *data =[authString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authorization = [NSString stringWithFormat:@"Basic %@", [data base64EncodedStringWithOptions:0]];
    
    NSDictionary *headers = @{
        @"Content-Type": @"application/json",
        @"authorization": authorization};
    
    NSDictionary *parameters = @{
        @"roomName":config.roomName,
        @"roleConfig":config.roleConfig,
    };
    
    NSString *encodeUrl = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    [sessionManager POST:encodeUrl parameters:parameters headers:headers progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SchduleModel *model = [SchduleModel yy_modelWithDictionary:responseObject];
        if(successBlock){
            successBlock(model);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
//进入房间
+ (void)entryClassWithConfig:(SchduleClassConfiguration *)config  success:(OnEntryClassSuccessBlock)successBlock failure:(OnHttpFailureBlock)failureBlock {
    
    AFHTTPSessionManager *sessionManager = [HttpManager sessionManager];
    
    NSString *url = [NSString stringWithFormat:HTTP_JOIN_ROOM, BASE_URL, config.appId, config.roomUuid, config.userUuid];
    
    //进行http basic认证
    NSString *authString = [NSString stringWithFormat:@"%@:%@", config.customerId, config.customerCertificate];
    NSData *data =[authString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authorization = [NSString stringWithFormat:@"Basic %@", [data base64EncodedStringWithOptions:0]];
    
    NSDictionary *headers = @{
        @"Content-Type": @"application/json",
        @"authorization": authorization
    };
    
    NSDictionary *parameters = @{
        @"userName":config.userName,
        @"role": @"host",
        @"streamUuid": @"",
        @"publishType": @0
    };
    
    NSString *encodeUrl = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    [sessionManager POST:encodeUrl parameters:parameters headers:headers progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ClassroomModel *model = [ClassroomModel yy_modelWithDictionary:responseObject[@"data"]];
        if(successBlock){
            successBlock(model);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+ (AFHTTPSessionManager *)sessionManager {
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    sessionManager.requestSerializer.timeoutInterval = 10;
    return sessionManager;
}
@end

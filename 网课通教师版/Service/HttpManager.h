//
//  HttpManager.h
//  网课通教师版
//
//  Created by 约克 on 2021/3/16.
//

#import "ClassroomModel.h"
#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "HTTPConfiguration.h"
#import "SchduleModel.h"

#define BASE_URL @"https://api.agora.io"
#define APPID @"7299681c2f0241299b87edbb6ed63750"
#define KEY @"c8a6969c773a4c7bbe6af53b51f64090"
#define SECRET @"7ef1a3ed53574005a72d8df4bbd32342"


//请求失败的回调
typedef void(^OnHttpFailureBlock)(NSError * _Nonnull error, NSInteger statusCode);
//创建房间的回调
typedef void(^OnSchduleClassSuccessBlock)(SchduleModel * _Nonnull schduleModel);
//进入房间的回调
typedef void(^OnEntryClassSuccessBlock)(ClassroomModel * _Nonnull classModel);

NS_ASSUME_NONNULL_BEGIN

@interface HttpManager : NSObject

+ (void)schduleClassWithConfig:(SchduleClassConfiguration *)config  success:(OnSchduleClassSuccessBlock)successBlock failure:(OnHttpFailureBlock)failureBlock;

+ (void)entryClassWithConfig:(SchduleClassConfiguration *)config  success:(OnEntryClassSuccessBlock)successBlock failure:(OnHttpFailureBlock)failureBlock;

@end

NS_ASSUME_NONNULL_END

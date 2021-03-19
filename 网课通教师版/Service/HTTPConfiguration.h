//
//  HTTPConfiguration.h
//  网课通教师版
//
//  Created by 约克 on 2021/3/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SchduleClassConfiguration : NSObject
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *roomUuid;

@property (nonatomic, copy) NSString *customerId;
@property (nonatomic, copy) NSString *customerCertificate;

@property (nonatomic, copy) NSString *roomName;
@property (nonatomic, copy) NSDictionary *roleConfig;

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userUuid;

@end

@interface RoleConfiguration : NSObject
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, assign) NSInteger verifyType;//default:0
@property (nonatomic, assign) NSInteger subscribe;//default:1
@end

NS_ASSUME_NONNULL_END

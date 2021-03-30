//
//  StudentInfoModel.h
//  网课通教师版
//
//  Created by 约克 on 2021/3/19.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, StudentRole) {
    monitor = 0,    //班长
    secretary,      //团支书
    sportHead,      //体育委员
    disciplineHead, //纪律委员
    other           //群众
};

NS_ASSUME_NONNULL_BEGIN

@interface StudentInfoModel : NSObject 

@property (nonatomic, strong)NSString *num;

@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSString *gender;

@property (nonatomic, assign)NSNumber *age;

@property (nonatomic, strong)NSString *telephone;

@property (nonatomic, strong)NSString *GPA;

@property (nonatomic, strong)NSString *major;

@property (nonatomic, strong)NSString *studentClass;

@property (nonatomic, assign)NSNumber *attendance;

@property (nonatomic, assign)StudentRole role;
@end

NS_ASSUME_NONNULL_END

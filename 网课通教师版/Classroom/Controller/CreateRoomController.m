//
//  CreateRoomController.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/16.
//

#import "CreateRoomController.h"
#import "ClassViewController.h"
#import "HttpManager.h"
#import "HTTPConfiguration.h"
#import "YKTool.h"
#import <Masonry/Masonry.h>
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface CreateRoomController ()
@property (nonatomic, strong) UIButton *enterButtom;
@property (nonatomic, strong) UITextField *roomNum;
@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) MBProgressHUD* toastView;//弹出提示
@property (nonatomic, strong) SchduleClassConfiguration *schduleClassModel;
@property (nonatomic, strong) ClassViewController *classView;
@property (nonatomic, strong) ClassroomModel *classModel;
@end

@implementation CreateRoomController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI {
    UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Classroom_bg"]];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.enterButtom];
    [self.view addSubview:self.roomNum];
    [self.view addSubview:self.userName];
    [self.view addSubview:backgroundImage];
    
    [self.enterButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(UIScreen.mainScreen.bounds.size.width - 80, 40));
        make.bottom.equalTo(self.view.mas_bottom).offset(-90);
        make.centerX.equalTo(self.view);
    }];
    [backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width * 0.68));
        make.top.equalTo(self.view);
        make.centerX.equalTo(self.view);
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(UIScreen.mainScreen.bounds.size.width - 120, 70));
        make.centerX.equalTo(self.view);
        make.top.equalTo(backgroundImage.mas_bottom).offset(80);
    }];
    [self.roomNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(UIScreen.mainScreen.bounds.size.width - 120, 70));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.userName.mas_bottom).offset(30);
    }];
    
    [self.enterButtom addTarget:self action:@selector(enterRoom) forControlEvents:UIControlEventTouchUpInside];
}
//MARK:-action
- (void)enterRoom {
    if ([self.userName.text isEqualToString:@""]) {
        [self getToastString:@"用户名不可以为空"];
    }else if ([self.roomNum.text isEqualToString:@""]) {
        [self getToastString:@"房间名不可以为空"];
    }else {
        [self requestCreate];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
//MARK:-lazy
- (UIButton *)enterButtom {
    if (!_enterButtom) {
        _enterButtom = [[UIButton alloc]init];
        _enterButtom.layer.cornerRadius = 6;
        _enterButtom.layer.masksToBounds = YES;
        [_enterButtom setTitle:@"创建教室" forState:UIControlStateNormal];
        _enterButtom.backgroundColor = UIColor.blackColor;
    }
    return _enterButtom;
}

- (UITextField *)roomNum {
    if (!_roomNum) {
        _roomNum = [[UITextField alloc]init];
        _roomNum.placeholder = @"房间名";
    }
    return _roomNum;
}

- (UITextField *)userName {
    if (!_userName) {
        _userName = [[UITextField alloc]init];
        _userName.placeholder = @"你的姓名";
    }
    return _userName;
}

- (ClassViewController *)classView {
    if (!_classView) {
        _classView = [[ClassViewController alloc]init];
        _classView.classModel = self.classModel;
    }
    return _classView;
}
-(MBProgressHUD*) toastView{
    
    if (!_toastView) {
        _toastView = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        _toastView.minShowTime = 2;
        [_toastView setMode:MBProgressHUDModeText];
        _toastView.contentColor = [UIColor grayColor];
        _toastView.bezelView.backgroundColor = [UIColor blackColor];
    }
    return _toastView;
}

//MARK:-config
- (void)configModel {
    self.schduleClassModel = [SchduleClassConfiguration new];
    self.schduleClassModel.appId = APPID;
    self.schduleClassModel.customerId = KEY;
    self.schduleClassModel.customerCertificate = SECRET;
    self.schduleClassModel.roomName = self.roomNum.text;
    self.schduleClassModel.roomUuid = [YKTool base64EncodedString:self.roomNum.text];
    self.schduleClassModel.userName = self.userName.text;
    self.schduleClassModel.userUuid = [YKTool base64EncodedString:self.userName.text];
    NSMutableDictionary *roleConfigDic = [NSMutableDictionary dictionary];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@1, @"limit", nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@-1, @"limit", nil];
    roleConfigDic[@"host"] = dic1;
    roleConfigDic[@"audience"] = dic2;
    self.schduleClassModel.roleConfig = roleConfigDic;
}
//MARK:-net
- (void)requestCreate {
    NSLog(@"创建教室");
    [self configModel];
    [HttpManager schduleClassWithConfig:self.schduleClassModel success:^(SchduleModel * _Nonnull schduleModel) {
        [self getToastString:@"创建房间成功"];
        NSLog(@"创建教室成功");
        [self requestEntry];
    } failure:^(NSError * _Nonnull error, NSInteger statusCode) {
        [self getToastString:@"创建房间失败"];
        NSLog(@"创建教室失败");
        NSLog(@"%ld", statusCode);
    }];
}

- (void)requestEntry {
    NSLog(@"进入教室");
    [self configModel];
    [HttpManager entryClassWithConfig:self.schduleClassModel success:^(ClassroomModel * _Nonnull classModel) {
        [self getToastString:@"进入房间成功"];
        self.classModel = classModel;
        [self.navigationController pushViewController: self.classView animated:YES];
    } failure:^(NSError * _Nonnull error, NSInteger statusCode) {
        [self getToastString:@"进入房间失败"];
    }];
}
-(void)getToastString:(NSString*)str{

    self.toastView.label.text = str;
    [self.toastView hideAnimated:YES];
    __weak __typeof(self)weakSelf = self;
    self.toastView.completionBlock = ^{
        [weakSelf.toastView removeFromSuperview];
        weakSelf.toastView = nil;
    };
}
@end

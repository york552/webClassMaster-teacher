//
//  MainTabBarController.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/16.
//

#import "MainTabBarController.h"
#import "CreateRoomController.h"

@interface MainTabBarController ()
@property (nonatomic, strong) UINavigationController *nav1;
@property (nonatomic, strong) UIViewController *vc2;
@property (nonatomic, strong) UIViewController *vc3;
@property (nonatomic, strong) UIViewController *vc4;
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

// MARK:UI
- (void)setUI{
    self.viewControllers = @[self.nav1,self.vc2,self.vc3,self.vc4];
    self.tabBar.tintColor = UIColor.blackColor;
}

// MARK:lazy
- (UINavigationController *)nav1 {
    if (!_nav1) {
        _nav1 = [[UINavigationController alloc] initWithRootViewController:[[CreateRoomController alloc]init]];
        _nav1.tabBarItem.image = [UIImage imageNamed:@"Main_class"];
        _nav1.tabBarItem.title = @"上课";
    }
    return _nav1;
}

- (UIViewController *)vc2{
    if (!_vc2) {
        _vc2 = [[UIViewController alloc]init];
        _vc2.tabBarItem.image = [UIImage imageNamed:@"Main_student"];
        _vc2.tabBarItem.title = @"学生";
    }
    return _vc2;
}
- (UIViewController *)vc3{
    if (!_vc3) {
        _vc3 = [[UIViewController alloc]init];
        _vc3.tabBarItem.image = [UIImage imageNamed:@"Main_student"];
        _vc3.tabBarItem.title = @"学生";
    }
    return _vc3;
}
- (UIViewController *)vc4{
    if (!_vc4) {
        _vc4 = [[UIViewController alloc]init];
        _vc4.tabBarItem.image = [UIImage imageNamed:@"Main_student"];
        _vc4.tabBarItem.title = @"学生";
    }
    return _vc4;
}
@end

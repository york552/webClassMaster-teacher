//
//  MainTabBarController.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/16.
//

#import "MainTabBarController.h"
#import "CreateRoomController.h"
#import "StudentInfoListController.h"

@interface MainTabBarController ()
@property (nonatomic, strong) UINavigationController *nav1;
@property (nonatomic, strong) UINavigationController *nav2;
@property (nonatomic, strong) UINavigationController *nav3;
@property (nonatomic, strong) UINavigationController *nav4;
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

// MARK:UI
- (void)setUI{
    self.viewControllers = @[self.nav1,self.nav2,self.nav3,self.nav4];
    self.tabBar.tintColor = UIColor.blackColor;
}

// MARK:lazy
- (UINavigationController *)nav1 {
    if (!_nav1) {
        _nav1 = [[UINavigationController alloc] initWithRootViewController:[[CreateRoomController alloc]init]];
        _nav1.tabBarItem.image = [UIImage imageNamed:@"Classroom_tabIcon"];
        _nav1.tabBarItem.title = @"上课";
    }
    return _nav1;
}

- (UINavigationController *)nav2{
    if (!_nav2) {
        _nav2 = [[UINavigationController alloc]init];
        _nav2.tabBarItem.image = [UIImage imageNamed:@"Class_tabIcon"];
        _nav2.tabBarItem.title = @"课程";
    }
    return _nav2;
}
- (UINavigationController *)nav3{
    if (!_nav3) {
        _nav3 = [[UINavigationController alloc] initWithRootViewController:[[StudentInfoListController alloc]init]];
        _nav3.tabBarItem.image = [UIImage imageNamed:@"Student_tabIcon"];
        _nav3.tabBarItem.title = @"学生信息";
    }
    return _nav3;
}
- (UINavigationController *)nav4{
    if (!_nav4) {
        _nav4 = [[UINavigationController alloc]init];
        _nav4.tabBarItem.image = [UIImage imageNamed:@"Set_tabIcon"];
        _nav4.tabBarItem.title = @"设置";
    }
    return _nav4;
}
@end

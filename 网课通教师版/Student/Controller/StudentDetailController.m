//
//  StudentDetailController.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/25.
//

#import "StudentDetailController.h"
#import "StudentDetailViewCell.h"
#import "UIColor+YKColor.h"
#import <Masonry/Masonry.h>

@interface StudentDetailController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *introArray;
@end

@implementation StudentDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"学生详情";
    self.view.backgroundColor = [UIColor colorWithHex:0xF7F8FA];
    self.introArray = @[@"姓名",@"学号",@"年龄",@"性别",@"专业",@"班级",@"绩点",@"电话",@"职位",@"出勤次数"];
    [self setUI];
}

#pragma mark -UI
- (void)setUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(12);
        make.left.equalTo(self.view).offset(12);
        make.right.equalTo(self.view).offset(-12);
        make.height.mas_equalTo(520);
    }];
}

#pragma mark -Set
- (void)setStudentModel:(StudentInfoModel *)studentModel {
    _studentModel = studentModel;
}

#pragma mark -Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.layer.cornerRadius = 6;
        _tableView.layer.masksToBounds = YES;
        [_tableView setScrollEnabled:NO];
        [_tableView registerClass:[StudentDetailViewCell class] forCellReuseIdentifier:NSStringFromClass([StudentDetailViewCell class])];
    }
    return _tableView;
}

#pragma mark -Delegate && DataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    StudentDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([StudentDetailViewCell class])];
    if (indexPath.row == 0) {
        cell.leftText = @"姓名";
        cell.rightText = self.studentModel.name;
    } else if (indexPath.row == 1) {
        cell.leftText = @"学号";
        cell.rightText = self.studentModel.num;
    } else if (indexPath.row == 2) {
        cell.leftText = @"年龄";
        cell.rightText = [NSString stringWithFormat:@"%@",self.studentModel.age];
    } else if (indexPath.row == 3) {
        cell.leftText = @"性别";
        cell.rightText = self.studentModel.gender;
    } else if (indexPath.row == 4) {
        cell.leftText = @"专业";
        cell.rightText = self.studentModel.major;
    } else if (indexPath.row == 5) {
        cell.leftText = @"班级";
        cell.rightText = [NSString stringWithFormat:@"%@",self.studentModel.class];
    } else if (indexPath.row == 6) {
        cell.leftText = @"绩点";
        cell.rightText = self.studentModel.GPA;
    } else if (indexPath.row == 7) {
        cell.leftText = @"电话";
        cell.rightText = self.studentModel.telephone;
    } else if (indexPath.row == 8) {
        cell.leftText = @"职位";
        cell.rightText = [NSString stringWithFormat:@"%ld",(long)self.studentModel.role];
    } else if (indexPath.row == 9) {
        cell.leftText = @"出勤次数";
        cell.rightText = [NSString stringWithFormat:@"%@",self.studentModel.attendance];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;
}
@end

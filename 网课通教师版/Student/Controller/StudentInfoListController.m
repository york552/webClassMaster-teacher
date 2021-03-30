//
//  StudentInfoListController.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/23.
//

#import "StudentInfoListController.h"
#import "StudentDetailController.h"
#import "UIColor+YKColor.h"
#import "StudentInfoViewCell.h"
#import "StudentInfoModel.h"
#import <BmobSDK/Bmob.h>
#import <YYModel/YYModel.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Masonry/Masonry.h>

@interface StudentInfoListController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) StudentDetailController *detailViewController;
@property (nonatomic, strong) UICollectionView *studentCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *modelArray;
@end

@implementation StudentInfoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"学生信息";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor colorWithHex:0xF7F8FA];
    self.modelArray = [[NSMutableArray alloc]init];
    [self getStudentInfoModel];
    [self setUpUI];
}

- (void)setUpUI {
    [self.view addSubview:self.studentCollectionView];
    [self.studentCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}

#pragma mark -Lazy
-(UICollectionViewFlowLayout*)flowLayout{
    if(!_flowLayout){
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical; //设定滚动方向
        _flowLayout.sectionInset = UIEdgeInsetsMake(12,12, 0, 12); //设定全局的区内边距
        _flowLayout.minimumInteritemSpacing = 10; //设定全局的Cell间距
        _flowLayout.minimumLineSpacing = 10; //设定全局的行间距
        _flowLayout.itemSize = CGSizeMake(([[UIScreen mainScreen] bounds].size.width -44) / 3, ([[UIScreen mainScreen] bounds].size.width -44) / 3 * 1.4);
    }
    return _flowLayout;
}

- (UICollectionView *)studentCollectionView {
    if(!_studentCollectionView) {
        _studentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _studentCollectionView.backgroundColor = [UIColor colorWithHex:0xF7F8FA];
        _studentCollectionView.delegate = self;
        _studentCollectionView.dataSource = self;
        _studentCollectionView.showsHorizontalScrollIndicator = false;
        _studentCollectionView.showsVerticalScrollIndicator = false;
        [_studentCollectionView registerClass:[StudentInfoViewCell class] forCellWithReuseIdentifier:NSStringFromClass([StudentInfoViewCell class])];
    }
    return _studentCollectionView;
}

- (StudentDetailController *)detailViewController {
    if (!_detailViewController) {
        _detailViewController = [[StudentDetailController alloc]init];
    }
    return _detailViewController;
}

#pragma mark -Datasourse && Delegate
- (__kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    StudentInfoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([StudentInfoViewCell class]) forIndexPath:indexPath];
    cell.studentModel = self.modelArray[indexPath.item];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"index is %ld:",(long)indexPath.item);
    [self showStudentDetail:self.modelArray[indexPath.item]];
}

#pragma mark -Action
- (void)showStudentDetail:(StudentInfoModel *)model {
    [self.navigationController pushViewController:self.detailViewController animated:YES];
    self.detailViewController.studentModel = model;
}

#pragma mark -Net
- (void)getStudentInfoModel {
    BmobQuery *bquery = [BmobQuery queryWithClassName:@"StudentInfo"];
    [MBProgressHUD showHUDAddedTo:self.studentCollectionView animated:YES];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        [MBProgressHUD hideHUDForView:self.studentCollectionView animated:YES];
        if (error){
            return;
        }else if (array) {
            for (BmobObject *obj in array) {
                StudentInfoModel *model = [[StudentInfoModel alloc]init];
                model.name = [obj objectForKey:@"name"];
                model.num = [obj objectForKey:@"num"];
                model.gender = [obj objectForKey:@"gender"];
                model.GPA = [obj objectForKey:@"GPA"];
                model.age = [obj objectForKey:@"age"];
                model.attendance = [obj objectForKey:@"attendance"];
                model.major = [obj objectForKey:@"major"];
                model.role = [[obj objectForKey:@"role"] intValue];
                model.telephone = [obj objectForKey:@"telephone"];
                model.studentClass = [obj objectForKey:@"studentClass"];
                [self.modelArray addObject:model];
            }
            NSLog(@"请求完成");
            [self.studentCollectionView reloadData];
        }
    }];
}



@end

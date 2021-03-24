//
//  StudentInfoListController.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/23.
//

#import "StudentInfoListController.h"
#import "UIColor+YKColor.h"


@interface StudentInfoListController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *studentCollectionView;
@property (nonatomic,strong,nullable) UICollectionViewFlowLayout *flowLayout;
@end

@implementation StudentInfoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"学生档案";
    self.view.backgroundColor = [UIColor colorWithHex:0xF7F8FA];
    [self setUpUI];
    
}

- (void)setUpUI {
    [self.view addSubview:self.studentCollectionView];
    
}

#pragma mark -LAZY
-(UICollectionViewFlowLayout*)flowLayout{
    if(!_flowLayout){
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical; //设定滚动方向
        _flowLayout.sectionInset = UIEdgeInsetsMake(0,12, 0, 12); //设定全局的区内边距
        _flowLayout.minimumInteritemSpacing = 10; //设定全局的Cell间距
        _flowLayout.minimumLineSpacing = 0; //设定全局的行间距
    }
    return _flowLayout;
}

- (UICollectionView *)studentCollectionView {
    if(!_studentCollectionView) {
        _studentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _studentCollectionView.frame = CGRectMake(0, 44.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 44.0);
        _studentCollectionView.backgroundColor = [UIColor colorWithHex:0xF7F8FA];
        _studentCollectionView.delegate = self;
        _studentCollectionView.dataSource = self;
        _studentCollectionView.showsHorizontalScrollIndicator = false;
        _studentCollectionView.showsVerticalScrollIndicator = false;
    }
    return _studentCollectionView;
}

#pragma mark -DATASOURSE && DELEGATE
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    <#code#>
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    <#code#>
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _filterList.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_filterList[section].items count];
}


#pragma mark -NET




@end

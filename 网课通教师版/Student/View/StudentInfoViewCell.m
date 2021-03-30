//
//  StudentInfoViewCell.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/24.
//

#import "StudentInfoViewCell.h"
#import "UIColor+YKColor.h"
#import <Masonry/Masonry.h>

@interface StudentInfoViewCell()
@property (nonatomic, strong)UIImageView *headImage;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *majorLabel;
@end
@implementation StudentInfoViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = UIColor.whiteColor;
        self.layer.cornerRadius = 12;
        self.layer.masksToBounds = YES;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    [self.contentView addSubview:self.headImage];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.majorLabel];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-25);
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width / 2, self.frame.size.width / 2));
    }];
    [self.majorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.headImage.mas_bottom).offset(20);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.majorLabel.mas_bottom).offset(10);
    }];
}

#pragma mark -set
- (void)setStudentModel:(StudentInfoModel *)studentModel {
    _studentModel = studentModel;
    self.nameLabel.text = studentModel.name;
    self.majorLabel.text = studentModel.studentClass;
    self.headImage.image = [UIImage imageNamed:[self.studentModel.gender isEqualToString:@"男"]  ? @"Student_maleHead":@"Student_femaleHead"];
}

#pragma mark -lazy
- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
        _headImage.backgroundColor = [UIColor colorWithHex:0xF7F8FA];
        _headImage.layer.cornerRadius = self.frame.size.width / 4;
        _headImage.layer.masksToBounds = YES;
    }
    return _headImage;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = [UIColor colorWithHex:0x414141];
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}

- (UILabel *)majorLabel {
    if (!_majorLabel) {
        _majorLabel = [[UILabel alloc]init];
        _majorLabel.textColor = [UIColor colorWithHex:0x414141];
        _majorLabel.font = [UIFont systemFontOfSize:16];
    }
    return _majorLabel;
}
@end

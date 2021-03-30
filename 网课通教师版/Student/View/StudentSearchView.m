//
//  StudentSearchView.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/30.
//

#import "StudentSearchView.h"
#import "UIColor+YKColor.h"
#import <Masonry/Masonry.h>

@interface StudentSearchView()<UITextFieldDelegate>
@property (nonatomic, strong)UITextField *imputTF;
@property (nonatomic, strong)UIImageView *searchIcon;
@end

@implementation StudentSearchView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

#pragma mark -UI
- (void)setUI {
    [self addSubview:self.imputTF];
    [self addSubview:self.searchIcon];
    [self.searchIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.centerY.equalTo(self);
        make.height.width.mas_equalTo(15);
    }];
    [self.imputTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.searchIcon.mas_right).offset(6);
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-12);
    }];
}


#pragma mark -set
- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholder = placeholder;
    NSDictionary * attributes = @{
        NSFontAttributeName: [UIFont systemFontOfSize:13],
        NSForegroundColorAttributeName: [UIColor colorWithHex:0x969799],
    };
    self.imputTF.attributedPlaceholder = [[NSAttributedString alloc]initWithString:placeholder attributes:attributes];
}

#pragma mark -lazy
- (UITextField *)imputTF {
    if (!_imputTF) {
        _imputTF = [[UITextField alloc]init];
        _imputTF.delegate = self;
        _imputTF.font = [UIFont systemFontOfSize:13];
    }
    return _imputTF;
}

- (UIImageView *)searchIcon {
    if (!_searchIcon) {
        _searchIcon = [[UIImageView alloc]init];
        _searchIcon.image = [UIImage imageNamed:@"Student_search"];
    }
    return _searchIcon;
}
@end

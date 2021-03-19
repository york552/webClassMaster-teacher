//
//  ClassViewController.h
//  网课通教师版
//
//  Created by 约克 on 2021/3/11.
//

#import "ClassroomModel.h"
#import <AgoraRtcKit/AgoraRtcEngineKit.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClassViewController : UIViewController <AgoraRtcEngineDelegate>
@property (nonatomic, strong) AgoraRtcEngineKit *agoraKit;
@property (nonatomic, strong) ClassroomModel *classModel;
@end

NS_ASSUME_NONNULL_END

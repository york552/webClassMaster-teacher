//
//  ClassViewController.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/11.
//

#import "ClassViewController.h"
#import "HttpManager.h"

@interface ClassViewController ()
// 定义 localView 变量
@property (nonatomic, strong) UIView *localView;
// 定义 remoteView 变量
@property (nonatomic, strong) UIView *remoteView;
@end

@implementation ClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 调用初始化视频窗口函数
    [self initViews];
    // 后续步骤调用 Agora API 使用的函数
    [self initializeAgoraEngine];
    [self setChannelProfile];
    [self setClientRole];
    [self setupLocalVideo];
    [self joinChannel];
}

// 设置视频窗口布局
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.remoteView.frame = self.view.bounds;
    self.localView.frame = CGRectMake(self.view.bounds.size.width - 90, 0, 90, 160);
}

- (void)viewWillDisappear:(BOOL)animated {
    [self leaveChannel];
}

- (void)initViews {
    // 初始化远端视频窗口。只有当远端用户为主播时，才会显示视频画面
    self.remoteView = [[UIView alloc] init];
    [self.view addSubview:self.remoteView];
    // 初始化本地视频窗口。只有当本地用户为主播时，才会显示视频画面
    self.localView = [[UIView alloc] init];
    [self.view addSubview:self.localView];
}
// 初始化AgoraRtcEngineKit 对象
- (void)initializeAgoraEngine {
    self.agoraKit = [AgoraRtcEngineKit sharedEngineWithAppId:APPID delegate:self];
}
// 设置频道场景
- (void)setChannelProfile {
    [self.agoraKit setChannelProfile:AgoraChannelProfileLiveBroadcasting];
}
// 设置用户角色
- (void)setClientRole {
    // 设置用户角色为主播
    [self.agoraKit setClientRole:AgoraClientRoleBroadcaster];
    // 设置用户角色为观众
//    [self.agoraKit setClientRole:AgoraClientRoleAudience];
}
// 设置本地视图
- (void)setupLocalVideo {
    // 启用视频模块
    [self.agoraKit enableVideo];
    AgoraRtcVideoCanvas *videoCanvas = [[AgoraRtcVideoCanvas alloc] init];
    videoCanvas.uid = 0;
    videoCanvas.renderMode = AgoraVideoRenderModeHidden;
    videoCanvas.view = self.localView;
    // 设置本地视图
    [self.agoraKit setupLocalVideo:videoCanvas];
}
// 加入频道
- (void)joinChannel {
    [self.agoraKit joinChannelByToken:@"0067299681c2f0241299b87edbb6ed63750IAAFuRgx3Jjp7PXmimQ8O4Krdm+hbFzBy6zeDerOqZ8DglUJZ04AAAAAEABfjXZE+BNUYAEAAQD4E1Rg" channelId:self.classModel.room.roomInfo.roomUuid info:nil uid:0 joinSuccess:^(NSString * _Nonnull channel, NSUInteger uid, NSInteger elapsed) {
        NSLog(@"进入了教室");
    }];
}
// 设置远端视图
// 监听 firstRemoteVideoDecodedOfUid 回调
// SDK 接收到第一帧远端视频并成功解码时，会触发该回调
- (void)rtcEngine:(AgoraRtcEngineKit *)engine firstRemoteVideoDecodedOfUid:(NSUInteger)uid size: (CGSize)size elapsed:(NSInteger)elapsed {
    AgoraRtcVideoCanvas *videoCanvas = [[AgoraRtcVideoCanvas alloc] init];
    videoCanvas.uid = uid;
    videoCanvas.renderMode = AgoraVideoRenderModeHidden;
    videoCanvas.view = self.remoteView;
    // 设置远端视图
    [self.agoraKit setupRemoteVideo:videoCanvas];
}
// 离开频道
- (void)leaveChannel {
    [self.agoraKit leaveChannel:nil];
}

@end

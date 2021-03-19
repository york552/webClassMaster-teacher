//
//  URL.h
//  网课通
//
//  Created by 约克 on 2021/3/17.
//

//创建房间
#define HTTP_SCHDULE_CLASS @"%@/scene/apps/%@/v1/rooms/%@/config"

//进入房间
#define HTTP_JOIN_ROOM @"%@/scene/apps/%@/v1/rooms/%@/users/%@/entry"

//获取用户列表
#define HTTP_GET_USER @"%@/scene/apps/%@/v1/rooms/%@/users"

//更新用户状态（禁言）
#define HTTP_UPDATE_USER @"%@/scene/apps/%@/v1/rooms/%@/users/%@"

//踢出用户/离开房间
#define HTTP_LEAVE_ROOM @"%@/scene/apps/%@/v1/rooms/%@/users/%@/exit"

// /apps/{appId}/v1/rooms/{roomUuid}/snapshot
#define HTTP_SYNC_TOTAL_ROOM @"%@/apps/%@/v1/rooms/%@/snapshot"

// /apps/{appId}/v1/rooms/{roomUuid}/sequences
#define HTTP_SYNC_INCREASE_ROOM @"%@/apps/%@/v1/rooms/%@/sequences"

// apps/{appId}/v1/rooms/{roomUuid}/users/streams
#define HTTP_GET_STREAM @"%@/apps/%@/v1/rooms/%@/users/streams"

// apps/{appId}/v1/rooms/{roomUuid}/users/userStreams
#define HTTP_GET_USER_STREAM @"%@/apps/%@/v1/rooms/%@/users/userStreams"

// apps/{appId}/v1/rooms/{roomUuid}/users/{userUuid}/streams/{streamUuid}
#define HTTP_CREATE_STREAM @"%@/apps/%@/v1/rooms/%@/users/%@/streams/%@"

// apps/{appId}/v1/rooms/{roomUuid}/users/{userUuid}/streams/{streamUuid}
#define HTTP_UPDATE_STREAM @"%@/apps/%@/v1/rooms/%@/users/%@/streams/%@"

// apps/{appId}/v1/rooms/{roomUuid}/users/{userUuid}/streams/{streamUuid}
#define HTTP_DELETE_STREAM @"%@/apps/%@/v1/rooms/%@/users/%@/streams/%@"

// apps/{appId}/v1/rooms/{roomUuid}/chat/channel
#define HTTP_ROOM_CHAT @"%@/apps/%@/v1/rooms/%@/chat/channel"

// apps/{appId}/v1/rooms/{roomUuid}/users/{toUserUuid}/chat/peer
#define HTTP_USER_CHAT @"%@/apps/%@/v1/rooms/%@/users/%@/chat/peer"

// apps/{appId}/v1/rooms/{roomUuid}/message/channel
#define HTTP_ROOM_MESSAGE @"%@/apps/%@/v1/rooms/%@/message/channel"

// apps/{appId}/v1/rooms/{roomUuid}/users/{toUserUuid}/messages/peer
#define HTTP_USER_MESSAGE @"%@/apps/%@/v1/rooms/%@/users/%@/messages/peer"

// apps/{appId}/v1/process/{processUuid}/start
#define HTTP_START_ACTION_PROCESS @"%@/apps/%@/v1/process/%@/start"

// apps/{appId}/v1/process/{processUuid}/stop
#define HTTP_STOP_ACTION_PROCESS @"%@/apps/%@/v1/process/%@/stop"

// apps/{appId}/v1/rooms/{roomUuid}/properties/{key}
#define HTTP_ROOM_PROPERTIES @"%@/apps/%@/v1/rooms/%@/properties/%@"

// apps/{appId}/v1/rooms/{roomUuid}/users/{userUuid}/properties/{key}
#define HTTP_USER_PROPERTIES @"%@/apps/%@/v1/rooms/%@/users/%@/properties/%@"



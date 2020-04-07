//
//  KTypes.h
//  KH264Kit
//
//  Created by yulu kong on 2020/4/7.
//  Copyright © 2020 yulu kong. All rights reserved.
//

#ifndef KTypes_h
#define KTypes_h

typedef NS_ENUM(NSInteger, KAuthorizationStatus) {
    KAuthorizationStatusNotDetermined,
    KAuthorizationStatusDenied,
    KAuthorizationStatusRestricted,
    KAuthorizationStatusAuthorized,
};

//捕获类型
typedef NS_ENUM(int, KVideoCaptureType) {
    KVideoCaptureTypeVideo = 0,
    KVideoCaptureTypeAudio ,
    KVideoCaptureTypeAll
};

//捕获视频信息
typedef struct KVideoInfo{
    NSUInteger width;     //视频宽度
    NSUInteger height;    //视频高度
}VideoInfo;

//错误回调
typedef void (^KErrorHandler)(NSError * _Nonnull error);
//权限获取结果回调
typedef void (^KAuthorizationResultHandler)(KAuthorizationStatus);
//视频流捕获数据回调
typedef void (^KVideoCaptureResultHandler)(CMSampleBufferRef data, KVideoCaptureType type);

#endif /* KTypes_h */

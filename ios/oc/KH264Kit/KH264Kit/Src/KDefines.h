//
//  KTypes.h
//  KH264Kit
//
//  Created by yulu kong on 2020/4/7.
//  Copyright © 2020 yulu kong. All rights reserved.
//

#ifndef KTypes_h
#define KTypes_h

#import <AVFoundation/AVFoundation.h>

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

#pragma mark - SDK错误通知状态分类
typedef enum KH264KitErrorDomain
{
    KH264KitErrorDomainRecord       = 10,   // 录音设备出错
    KH264KitErrorDomainVAD          = 20,   // 数据处理过程出错
    KH264KitErrorDomainCommom      = 40,   // 其他错误
} KH264KitErrorDomain;

#pragma mark - SDK错误通知状态
typedef enum KH264KitErrorCode
{
    KH264KitErrorCodeRecoderException = (KH264KitErrorDomainRecord << 16) | (0x0000FFFF & 1),                // 录音设备异常
    KH264KitErrorCodeRecoderNoPermission = (KH264KitErrorDomainRecord << 16) | (0x0000FFFF & 2),             // 无录音权限
    KH264KitErrorCodeRecoderUnAvailable = (KH264KitErrorDomainRecord << 16) | (0x0000FFFF & 3),              // 录音设备不可用
    KH264KitErrorCodeInterruption = (KH264KitErrorDomainRecord << 16) | (0x0000FFFF & 4),                    // 录音中断
    
    KH264KitErrorDomainCommomEnqueueError = (KH264KitErrorDomainCommom << 16) | (0x0000FFFF & 3)               // 数据enqueue失败
} KH264KitErrorCode;


#pragma mark - 回调函数
//错误回调
typedef void (^KErrorHandler)(NSError * _Nonnull error);
//权限获取结果回调
typedef void (^KAuthorizationResultHandler)(KAuthorizationStatus);
//视频流捕获数据回调
typedef void (^KVideoCaptureResultHandler)(CMSampleBufferRef data, KVideoCaptureType type);

#endif /* KTypes_h */

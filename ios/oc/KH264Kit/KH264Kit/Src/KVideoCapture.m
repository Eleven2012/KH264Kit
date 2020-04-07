//
//  KVideoCapture.m
//  KH264Kit
//
//  Created by yulu kong on 2020/4/7.
//  Copyright © 2020 yulu kong. All rights reserved.
//

#import "KVideoCapture.h"

@interface KVideoCapture()<AVCaptureAudioDataOutputSampleBufferDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>

/// 是否正在进行
@property(nonatomic, assign) BOOL isRunning;

/// 会话句柄
@property(nonatomic, strong) AVCaptureSession *captureSession;

/// 代理队列
@property(nonatomic, strong) dispatch_queue_t captureQueue;

#pragma mark - 音频相关属性

/// 音频输入设备
@property(nonatomic, strong) AVCaptureDeviceInput *audioInputDevice;

/// 输出 数据接收
@property(nonatomic, strong) AVCaptureAudioDataOutput *audioDataOutput;

/// 捕获连接器
@property(nonatomic, strong) AVCaptureConnection *audioConnection;

#pragma mark - 视频相关属性

/// 视频输入设备
@property(nonatomic, weak) AVCaptureDeviceInput *videoInputDevice;

/// 前置摄像头
@property(nonatomic, strong) AVCaptureDeviceInput *frontCamera;

/// 后置摄像头
@property(nonatomic, strong) AVCaptureDeviceInput *backCamera;

///  视频数据输出
@property(nonatomic, strong) AVCaptureVideoDataOutput *videoDataOutput;

/// 视频连接器
@property(nonatomic, strong) AVCaptureConnection *videoConnection;

/// 视频预览层
@property(nonatomic, strong) AVCaptureVideoPreviewLayer *prelayer;

/// 视频预览层大小
@property(nonatomic, assign) CGSize prelayerSize;
@end


@implementation KVideoCapture

@end

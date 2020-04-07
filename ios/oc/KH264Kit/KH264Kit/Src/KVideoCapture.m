//
//  KVideoCapture.m
//  KH264Kit
//
//  Created by yulu kong on 2020/4/7.
//  Copyright © 2020 yulu kong. All rights reserved.
//

#import "KVideoCapture.h"



@interface KVideoCapture()<AVCaptureAudioDataOutputSampleBufferDelegate, AVCaptureVideoDataOutputSampleBufferDelegate> {
    //视频捕获类型
    KVideoCaptureType captureType;
}

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

- (instancetype)initWithType:(KVideoCaptureType)type {
    self = [super init];
    if (self) {
        captureType = type;
    }
    return self;
}

#pragma mark - 对外接口

/// 开始捕获
/// @param resultHandler 捕获数据回调
/// @param errorHandler 错误回调
- (void)startWithResult:(KVideoCaptureResultHandler)resultHandler error:(KErrorHandler)errorHandler {
    
}

/// 停止捕获
- (void)stop {
    
}

#pragma mark - 初始化音视频会话

/// 初始化音频会话相关服务
- (void) setupAudioSession {
    
}

/// 初始化视频会话相关服务
- (void) setupVideoSession {
    
}


#pragma mark - 辅助函数

/// 准备捕获
- (void) prepareCapture {
    [self prepareWithPreviewSize:CGSizeZero];
}

/// 准备捕获音视频
/// @param size 预览窗口大小
- (void) prepareWithPreviewSize:(CGSize)size {
    _prelayerSize = size;
    
    switch (captureType) {
        case KVideoCaptureTypeAudio://捕获音频
            [self setupAudioSession];
            break;
        case KVideoCaptureTypeVideo://捕获视频
            [self setupVideoSession];
            break;
        case KVideoCaptureTypeAll://捕获音频和视频
            [self setupAudioSession];
            [self setupAudioSession];
            break;
            
        default:
            break;
    }
}


/// 切换前后摄像头
- (void) switchCamera {
    [self.captureSession beginConfiguration];
    //先移除之前的设备
    [self.captureSession removeInput:self.videoInputDevice];
    if ([self.videoInputDevice isEqual:self.frontCamera]) {
        //如果是前置摄像头，则切换为后置摄像头
        self.videoInputDevice = self.backCamera;
    } else {
        //如果是后置摄像头，则切换当前摄像头为前置摄像头
        self.videoInputDevice = self.frontCamera;
    }
    //将摄像头重新添加到会话
    [self.captureSession addInput:self.videoInputDevice];
    //提交配置,让新的配置生效
    [self.captureSession commitConfiguration];
}

@end

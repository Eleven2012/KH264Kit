//
//  KVideoCapture.h
//  KH264Kit
//
//  Created by yulu kong on 2020/4/7.
//  Copyright © 2020 yulu kong. All rights reserved.
//

/*
     处理系统视频，音频捕捉功能
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "KDefines.h"

NS_ASSUME_NONNULL_BEGIN


@protocol KVideoCaptureDelegate <NSObject>

@optional
- (void) didCaptureSampleBuffer:(CMSampleBufferRef)sampleBuffer streamType:(KVideoCaptureType)type;

@end

@interface KVideoCapture : NSObject

/// 预览层view
@property(nonatomic, strong) UIView *preview;

/// 捕获数据回调代理
@property(nonatomic, weak) id<KVideoCaptureDelegate> delegate;

/// 捕获视频信息（宽度，高度）
@property (nonatomic, assign, readonly) struct KVideoInfo videoInfo;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/// 构造函数
/// @param type 要捕获的视频流类型
- (instancetype)initWithType:(KVideoCaptureType) type;


/// 开始捕获
/// @param resultHandler 捕获数据回调
/// @param errorHandler 错误回调
- (void) startWithResult:(KVideoCaptureResultHandler _Nonnull) resultHandler error: (KErrorHandler _Nonnull) errorHandler;

/// 停止捕获
- (void) stop;


@end

NS_ASSUME_NONNULL_END

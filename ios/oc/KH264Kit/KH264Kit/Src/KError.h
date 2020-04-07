//
//  KError.h
//  KH264Kit
//
//  Created by yulu kong on 2020/4/7.
//  Copyright © 2020 yulu kong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KError : NSObject
+ (NSError *) errorWithCode:(NSInteger) errorCode message:(NSString *) message;
+ (NSError *) notAuthorizationError;
@end

NS_ASSUME_NONNULL_END

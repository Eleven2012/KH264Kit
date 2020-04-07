//
//  KError.m
//  KH264Kit
//
//  Created by yulu kong on 2020/4/7.
//  Copyright © 2020 yulu kong. All rights reserved.
//

#import "KError.h"
#import "KDefines.h"

@implementation KError

+ (NSError *) errorWithCode:(NSInteger) errorCode message:(NSString *) message {
    return [NSError errorWithDomain:@"KH264KitError" code:errorCode userInfo:@{NSLocalizedDescriptionKey: message}];
}

+ (NSError *) notAuthorizationError {
    return [self errorWithCode:KH264KitErrorCodeRecoderNoPermission message:@"未授权，请先调用 sdk 中的授权 API"];
}
@end

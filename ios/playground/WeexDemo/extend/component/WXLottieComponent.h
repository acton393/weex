//
//  WXLottieComponent.h
//  WeexDemo
//
//  Created by zifan.zx on 22/02/2017.
//  Copyright © 2017 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK.h>

@interface WXLottieComponent : WXComponent
@property (nonatomic, assign) BOOL loop;
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, strong) NSString *sourceName;
@end

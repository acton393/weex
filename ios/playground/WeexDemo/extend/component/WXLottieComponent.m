//
//  WXLottieComponent.m
//  WeexDemo
//
//  Created by zifan.zx on 22/02/2017.
//  Copyright © 2017 taobao. All rights reserved.
//

#import "WXLottieComponent.h"
#import <Lottie/Lottie.h>

#import <WeexSDK.h>
typedef LOTAnimationView WXLottieView;

@interface WXLottieComponent()
@property (nonatomic, strong) NSDictionary *sourceJson;
@property (nonatomic, strong) NSString * src;
@end

@implementation WXLottieComponent

- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance {
    
    if (self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance]) {
        if (attributes[@"src"]) {
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:attributes[@"src"]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
                _sourceJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            }];
        }
    
    }
    
    return self;
}

- (UIView *)loadView {
    WXLottieView * view = [WXLottieView animationFromJSON:_sourceJson];
    return view;
}

- (void)viewDidLoad {
    WXLottieView * view  = (WXLottieView *)self.view;
    [view play];
}

@end

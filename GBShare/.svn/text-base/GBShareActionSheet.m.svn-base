//
//  ShareActionSheet.m
//  自定义shareSheet
//
//  Created by midas on 2017/2/13.
//  Copyright © 2017年 midas. All rights reserved.
//

#import "GBShareActionSheet.h"
#import "GBShareView.h"

//#import <ShareSDKUI/ShareSDKUI.h>
#import <ShareSDK/ShareSDK.h>
//#import <ShareSDKUI/SSUIShareActionSheetStyle.h>
#import <objc/runtime.h>
#import "UIAlertController+GB.h"
#import "Share.h"

#define btnWidth self.bounds.size.width / 4
@interface GBShareActionSheet () <ShareViewDelegate>

@property (nonatomic, strong) GBShareView *shareView;

//@property (nonatomic, strong) Share *share;
@end
@implementation GBShareActionSheet

// 添加到window
- (void)didMoveToWindow {
    
    self.frame = [UIScreen mainScreen].bounds;
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    self.alpha = 0;
    
    GBShareView *shareView = [[GBShareView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 2 * btnWidth)];
    shareView.delegate = self;
    [self addSubview:shareView];
    
    _shareView = shareView;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1;
        _shareView.transform = CGAffineTransformMakeTranslation(0, -2 * btnWidth);
    }];
}

static Share *_share;
static char kStateCodeKey;

+ (void)showShareActionSheetWithObject:(id)shareModel stateCode:(void (^)(NSInteger))stateCode {
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    [window addSubview:[[self alloc] init]];
    
    objc_setAssociatedObject(window, &kStateCodeKey, stateCode, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    _share = shareModel;
}

// shareView代理方法
- (void)shareView:(GBShareView *)shareView dismissShareActionSheetWithIndex:(NSInteger)index {
    
    // 消失
    [self dismiss];
    
    // 跳转到目标app分享
    [self gotoShareWithIndex:index];
    
}

// 跳转到目标app分享
- (void)gotoShareWithIndex:(NSInteger )index {
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    void (^stateCode)(NSInteger stateCode) = objc_getAssociatedObject(window, &kStateCodeKey);
    
    SSDKPlatformType platformType;
    switch (index) {
        case 0:
            platformType = SSDKPlatformSubTypeWechatSession;
            break;
            
        case 1:
            platformType = SSDKPlatformSubTypeWechatTimeline;
            break;
            
        case 2:
            platformType = SSDKPlatformSubTypeWechatFav;
            break;
            
        case 3:
            platformType = SSDKPlatformSubTypeQQFriend;
            break;
            
        case 4:
            platformType = SSDKPlatformSubTypeQZone;
            break;
            
        default:
            break;
    }
    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    
    if (_share.title && _share.img && _share.url && _share.content) {
        
        // 设置分享参数
        [shareParams SSDKSetupShareParamsByText:_share.title images:_share.img url:_share.url title:_share.content type:SSDKContentTypeAuto];
    } else {
        
        [MBProgressHUD showError:@"分享失败!"];
    }
    
    // 调用shareSDK的无UI分享类型
    [ShareSDK share:platformType parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        
        switch (state) {
            case SSDKResponseStateSuccess:
            {
                stateCode(1);
                [UIAlertController presentAlertControllerWithTitle:@"分享成功!" message:nil preferredStyle:UIAlertControllerStyleAlert cancelActionTitle:@"确定" otherActionTitles:nil handler:nil];
                break;
            }
            case SSDKResponseStateFail:
            {
                stateCode(0);
                 [UIAlertController presentAlertControllerWithTitle:@"分享成功!" message:nil preferredStyle:UIAlertControllerStyleAlert cancelActionTitle:@"确定" otherActionTitles:nil handler:nil];
                break;
            }
            default:
                break;
        }
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismiss];
}

// 消失
- (void)dismiss {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 0;
        _shareView.transform = CGAffineTransformMakeTranslation(0, 2 * btnWidth);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        [_shareView removeFromSuperview];
    }];
}
@end

//
//  ShareActionSheet.h
//  自定义shareSheet
//
//  Created by midas on 2017/2/13.
//  Copyright © 2017年 midas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GBShareActionSheet;
@protocol ShareActionSheetDelegate <NSObject>

@required
// show shareSheet and goto share
- (void)shareActionSheet:(GBShareActionSheet *)shareActionSheet showShareWithIndex:(NSInteger)index;

@end
@interface GBShareActionSheet : UIView

@property (nonatomic, strong) id <ShareActionSheetDelegate> delegate;

/**
 显示分享

 @param shareModel share模型
 @param stateCode 状态码 1表示分享成功 0表示分享失败
 */
+ (void)showShareActionSheetWithObject:(id)shareModel stateCode:(void (^)(NSInteger))stateCode;
@end

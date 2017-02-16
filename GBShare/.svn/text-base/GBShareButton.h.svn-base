//
//  ShareButton.h
//  自定义shareSheet
//
//  Created by midas on 2017/2/14.
//  Copyright © 2017年 midas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GBShareButton;

@protocol ShareButtonDelegete <NSObject>

@required
// 点击哪一个button
- (void)shareButton:(GBShareButton *)shareButton clickedWithIndex:(NSInteger)index;

@end

@interface GBShareButton : UIButton

@property (nonatomic, assign) id<ShareButtonDelegete>delegate;

// 设置图片和文字
- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title;
@end

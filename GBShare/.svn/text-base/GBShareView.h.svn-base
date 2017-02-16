//
//  ShareView.h
//  自定义shareSheet
//
//  Created by midas on 2017/2/13.
//  Copyright © 2017年 midas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GBShareView;
@protocol ShareViewDelegate <NSObject>

@required
// remove ShareActionSheet and subviews
- (void)shareView:(GBShareView *)shareView dismissShareActionSheetWithIndex:(NSInteger)index;

@end

@interface GBShareView : UIView

@property (nonatomic, assign) id <ShareViewDelegate> delegate;
@end

//
//  ShareView.m
//  自定义shareSheet
//
//  Created by midas on 2017/2/13.
//  Copyright © 2017年 midas. All rights reserved.
//

#import "GBShareView.h"
#import "GBShareButton.h"

#define btnWidth self.bounds.size.width / 4
#define btnHeight self.bounds.size.height / 2
@interface GBShareView () <ShareButtonDelegete>

@property (strong, nonatomic) NSMutableArray *btns;
@property (strong, nonatomic) NSMutableArray *verticalLineViews;

@end

@implementation GBShareView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpAllChildView];
    }
    
    return self;
}

// button的代理方法
- (void)shareButton:(GBShareButton *)shareButton clickedWithIndex:(NSInteger)index {
    
    NSLog(@"index:%ld",index);
    
    if ([_delegate respondsToSelector:@selector(shareView:dismissShareActionSheetWithIndex:)]) {
        
        [_delegate shareView:self dismissShareActionSheetWithIndex:index];
    }
}

- (void)setUpAllChildView {
    
    // 按钮
    [self setUpShareBtns];
    // 垂直线
    [self setUpVerticalLineView];
    // 水平线
    [self setUpHorizontalLineView];
}

// 设置分享buttons
- (void)setUpShareBtns {
    
    NSArray *btnImages = @[@"wechat",@"wechat_circle",@"wechat_collection",@"qq",@"qq_zone"];
    NSArray *btnTitles = @[@"微信",@"微信朋友圈",@"微信收藏",@"QQ",@"QQ空间"];
    
    for (int i = 0; i < btnImages.count; i++) {
        
        GBShareButton *btn = [GBShareButton buttonWithType:UIButtonTypeCustom];
        btn.delegate = self;
        
        btn = [btn initWithImage:[UIImage imageNamed:btnImages[i]] title:btnTitles[i]];
        
        [self addSubview:btn];
        
        btn.tag = i;
        
        [self.btns addObject:btn];
    }
}

// 设置垂直线
- (void)setUpVerticalLineView {
    
    for (int i = 0; i < self.btns.count; i++) {
        
        UIView * verticalLineView= [UIView new];
        verticalLineView.backgroundColor = COLOR(245, 245, 245);
        [self addSubview:verticalLineView];
        
        [self.verticalLineViews addObject:verticalLineView];
    }
}
// 设置水平线
- (void)setUpHorizontalLineView {
    
    UIView *horizontalLineView = [UIView new];
    horizontalLineView.backgroundColor = COLOR(245, 245, 245);
    [self addSubview:horizontalLineView];
    horizontalLineView.frame = CGRectMake(0, btnHeight, self.bounds.size.width, 1);
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    NSInteger cols = 4;
    
//    NSInteger rows = (self.btns.count-1)/cols + 1;
    // button Frame
    for (int i = 0; i < self.btns.count; i++) {
        
        GBShareButton *btn = self.btns[i];
        
        btn.frame = CGRectMake((i % cols) * btnWidth, (i / cols) * btnHeight, btnWidth, btnHeight);
    }
    // 垂直线 Frame
    for (int i = 0; i < self.verticalLineViews.count; i++) {
        
        UIView *verticalLineView = self.verticalLineViews[i];
        
        verticalLineView.frame = CGRectMake((i % 4 + 1) *btnWidth, (i / cols), 1, btnHeight);
    }
  
}

- (NSMutableArray *)btns {
    
    if (_btns == nil) {
        
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (NSMutableArray *)verticalLineViews {
    
    if (_verticalLineViews == nil) {
        
        _verticalLineViews = [NSMutableArray array];
    }
    return _verticalLineViews;
}
@end

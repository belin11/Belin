//
//  ShareButton.m
//  自定义shareSheet
//
//  Created by midas on 2017/2/14.
//  Copyright © 2017年 midas. All rights reserved.
//

#import "GBShareButton.h"

@implementation GBShareButton
// 取消高亮状态
- (void)setHighlighted:(BOOL)highlighted {
    // 什么都不写
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title {
    
    [self setImage:image forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[[UIColor blackColor] colorWithAlphaComponent:0.8] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

- (void)click:(GBShareButton *)button {
    
    if ([_delegate respondsToSelector:@selector(shareButton:clickedWithIndex:)]) {
        
        [_delegate shareButton:button clickedWithIndex:button.tag];
    }
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat imageW = self.imageView.bounds.size.width;
    CGFloat imageH = self.imageView.bounds.size.height;
    
    CGFloat titleW = self.titleLabel.bounds.size.width;
    CGFloat titleH = self.titleLabel.bounds.size.height;

    self.imageEdgeInsets = UIEdgeInsetsMake(-titleH - 1, 0, 0, -titleW);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageW, -imageH-1, 0);

#if 0
    CGFloat marginH = (self.frame.size.height - self.imageView.frame.size.height - self.titleLabel.frame.size.height)/3;
    
    //图片
    CGPoint imageCenter = self.imageView.center;
    imageCenter.x = self.frame.size.width/2;
    imageCenter.y = self.imageView.frame.size.height/2 + marginH;
    self.imageView.center = imageCenter;
    //文字
    CGRect newFrame = self.titleLabel.frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.frame.size.height - newFrame.size.height - marginH;
    newFrame.size.width = self.frame.size.width;
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
#endif
}
@end

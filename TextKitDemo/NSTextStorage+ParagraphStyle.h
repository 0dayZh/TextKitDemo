//
//  NSTextStorage+ParagraphStyle.h
//  TextKitDemo
//
//  Created by 0day on 14-4-10.
//  Copyright (c) 2014年 0dayzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSTextStorage (ParagraphStyle)

- (void)setFirstLineHeadIndent:(CGFloat)headIndent;
- (void)setLineSpacing:(CGFloat)lineSpacing;
- (void)setParagraphSpacingBefore:(CGFloat)spacing;

@end

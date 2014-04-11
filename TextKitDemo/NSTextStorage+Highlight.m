//
//  NSTextStorage+Highlight.m
//  TextKitDemo
//
//  Created by 0day on 14-4-10.
//  Copyright (c) 2014年 0dayzh. All rights reserved.
//

#import "NSTextStorage+Highlight.h"

@implementation NSTextStorage (Highlight)

- (void)hightlightString:(NSString *)string withColor:(UIColor *)color {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:string
                                                                           options:0
                                                                             error:nil];
    
    NSArray *matches = [regularExpression matchesInString:self.string
                                                  options:0
                                                    range:NSMakeRange(0, self.string.length)];
    
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match range];
        [self addAttribute:NSForegroundColorAttributeName
                     value:color
                     range:matchRange];
    }
}

@end

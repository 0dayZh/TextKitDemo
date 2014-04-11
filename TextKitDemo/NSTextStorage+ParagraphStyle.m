//
//  NSTextStorage+ParagraphStyle.m
//  TextKitDemo
//
//  Created by 0day on 14-4-10.
//  Copyright (c) 2014年 0dayzh. All rights reserved.
//

#import "NSTextStorage+ParagraphStyle.h"

@implementation NSTextStorage (ParagraphStyle)

- (void)setFirstLineHeadIndent:(CGFloat)headIndent {
    __block NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.firstLineHeadIndent = headIndent;
    
    [self enumerateAttributesInRange:NSMakeRange(0, self.length)
                             options:NSAttributedStringEnumerationReverse
                          usingBlock:^(NSDictionary *attributes, NSRange range, BOOL *stop){
                              NSMutableDictionary *attributesM = [attributes mutableCopy];
                              NSParagraphStyle *originalParagraphStyle = attributesM[NSParagraphStyleAttributeName];
                              if (originalParagraphStyle) {
                                  paragraphStyle = [originalParagraphStyle mutableCopy];
                                  paragraphStyle.firstLineHeadIndent = headIndent;
                              }
                              
                              [attributesM setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
                              [self addAttributes:attributesM range:range];
                          }];
}

- (void)setLineSpacing:(CGFloat)lineSpacing {
    __block NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    
    [self enumerateAttributesInRange:NSMakeRange(0, self.length)
                             options:NSAttributedStringEnumerationReverse
                          usingBlock:^(NSDictionary *attributes, NSRange range, BOOL *stop){
                              NSMutableDictionary *attributesM = [attributes mutableCopy];
                              NSParagraphStyle *originalParagraphStyle = attributesM[NSParagraphStyleAttributeName];
                              if (originalParagraphStyle) {
                                  paragraphStyle = [originalParagraphStyle mutableCopy];
                                  paragraphStyle.lineSpacing = lineSpacing;
                              }
                              
                              [attributesM setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
                              [self addAttributes:attributesM range:range];
                          }];
}

- (void)setParagraphSpacingBefore:(CGFloat)spacing {
    __block NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.paragraphSpacingBefore = spacing;
    
    [self enumerateAttributesInRange:NSMakeRange(0, self.length)
                             options:NSAttributedStringEnumerationReverse
                          usingBlock:^(NSDictionary *attributes, NSRange range, BOOL *stop){
                              NSMutableDictionary *attributesM = [attributes mutableCopy];
                              NSParagraphStyle *originalParagraphStyle = attributesM[NSParagraphStyleAttributeName];
                              if (originalParagraphStyle) {
                                  paragraphStyle = [originalParagraphStyle mutableCopy];
                                  paragraphStyle.paragraphSpacingBefore = spacing;
                              }
                              
                              [attributesM setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
                              [self addAttributes:attributesM range:range];
                          }];

}

@end

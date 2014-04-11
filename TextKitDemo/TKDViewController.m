//
//  TKDViewController.m
//  TextKitDemo
//
//  Created by 0day on 14-4-10.
//  Copyright (c) 2014年 0dayzh. All rights reserved.
//

#import "TKDViewController.h"

#import "NSTextStorage+Highlight.h"
#import "NSTextStorage+ParagraphStyle.h"

@interface TKDViewController ()

@property (nonatomic, strong) NSTextStorage *textStorage;

@end

@implementation TKDViewController

- (void)testHightlight {
    [self.textStorage hightlightString:@"他" withColor:[UIColor redColor]];
    [self.textStorage hightlightString:@"了" withColor:[UIColor orangeColor]];
}

- (void)testParagraphStyle1 {
    [self.textStorage setFirstLineHeadIndent:15];
}

- (void)testParagraphStyle2 {
    [self.textStorage setLineSpacing:5];
}

- (void)testParagraphStyle3 {
    [self.textStorage setParagraphSpacingBefore:10];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Text Storage
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:@""];
    self.textStorage = textStorage;
    
    // Layout Manager
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager: layoutManager];
    
    // Text Container
    NSTextContainer *textContainer = [[NSTextContainer alloc] init];
    [layoutManager addTextContainer: textContainer];
    
    // Text View
    UITextView *textView = [[UITextView alloc] initWithFrame:(CGRect){5.0f, 20.0f, 310.0f, 420.0f}
                                               textContainer:textContainer];
    textView.editable = NO;
    [self.view addSubview:textView];
    
    [self initText];
    
    // test 1
    [self testHightlight];
    
    // test 2
    [self testParagraphStyle1];
    
    // test 3
    [self testParagraphStyle2];
    
    // test 4
    [self testParagraphStyle3];
}

- (void)initText {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"txt"];
    NSData *textData = [[NSData alloc] initWithContentsOfFile:path];
    NSString *text = [[NSString alloc] initWithData:textData encoding:NSUTF8StringEncoding];
    
    [self.textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:text];
}

@end

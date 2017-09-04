//
//  WebConfig.m
//  SimplePG
//
//  Created by Jeson on 08/08/2017.
//  Copyright © 2017 Jeson. All rights reserved.
//

#import "WebConfig.h"

@interface WebConfig ()<WKScriptMessageHandler>

@end

@implementation WebConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.preferences = [[WKPreferences alloc] init];
        self.preferences.minimumFontSize = 10;
        self.preferences.javaScriptEnabled = YES;
        self.preferences.javaScriptCanOpenWindowsAutomatically = true;
        self.userContentController=[[WKUserContentController alloc]init];
        [self.userContentController addScriptMessageHandler:self name:@"jumpios_function1"];
        [self.userContentController addScriptMessageHandler:self name:@"jumpios_function2"];
        [self.userContentController addScriptMessageHandler:self name:@"jumpios_function3"];
        [self.userContentController addScriptMessageHandler:self name:@"popToRN_function"];
    }
    return self;
}

// MARK: - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    // 如果在开始时就注入有很多的名称，那么我们就需要区分来处理
    if ([message.name isEqualToString:@"jumpios_function1"]) {
        NSLog(@"jumpios_function1打印：%@",message.body);
        
    }else if ([message.name isEqualToString:@"jumpios_function2"]) {
        NSLog(@"jumpios_function2打印：%@",message.body);
        
    }else if ([message.name isEqualToString:@"jumpios_function3"]) {
        NSLog(@"jumpios_function3打印：%@",message.body);
    }else if ([message.name isEqualToString:@"popToRN_function"]) {
        NSLog(@"++++++++++popToRN++++++++++++");
        /*[[NSNotificationCenter defaultCenter] postNotificationName:NOTIF_popToRN object:nil userInfo:@{@"name":@"popToRN"}];*/
    }
    
}

@end

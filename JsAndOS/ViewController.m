//
//  ViewController.m
//  JsAndOS
//
//  Created by Jeson on 17/07/2017.
//  Copyright © 2017 Jeson. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "WebConfig.h"


@interface ViewController ()<WKNavigationDelegate>

@property (nonatomic , strong) WKWebView *webView;


@end

@implementation ViewController

- (WKWebView *)webView {
    WebConfig *config = [[WebConfig alloc] init];
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) configuration:config];
        _webView.layer.borderWidth = 1.0;
        _webView.layer.borderColor = [[UIColor blackColor] CGColor];
        _webView.layer.masksToBounds = YES;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //  交互WKWeb
    [self.view addSubview:self.webView];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/// WKWebView代理
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"返回内容");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(nonnull NSError *)error {
    NSLog(@"加载失败err:%@",error.description);
}

@end

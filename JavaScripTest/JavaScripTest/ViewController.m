//
//  ViewController.m
//  JavaScripTest
//
//  Created by Moses on 14-4-23.
//  Copyright (c) 2014年 孙帅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mWebview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"text" ofType:@"html"]];
    [self.mWebview loadRequest:[NSURLRequest requestWithURL:url]];
    
    // this adds the listener for WebtrendsMobileLib.js
    //    self.webDelegate = [[WTUIWebViewDelegate alloc] init];
    
    [self.mWebview setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *requestUrl = request.URL.absoluteString;
    if ([requestUrl hasPrefix:@"bievent://"]) {
        NSString *command = [requestUrl substringFromIndex:10];
        if ([command isEqualToString:@"onBICustomEvent"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"88" message:@"我是从html调用的native alertview" delegate:nil cancelButtonTitle:@"造了" otherButtonTitles:nil];
            [alert show];
            
            
        }
        return NO;
    }
    NSLog(@"=====%@",request.URL);
    return YES;
}


#pragma mark - Webview delegate
- (void )webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"%s", __FUNCTION__);
    
}

- (void )webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%s", __FUNCTION__);
    
    [webView stringByEvaluatingJavaScriptFromString:@"test_alert('alert from nativeFunction');" ];
    
    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"javascript:writebutton(\'%@\')",@"你好"]];
    
}

@end

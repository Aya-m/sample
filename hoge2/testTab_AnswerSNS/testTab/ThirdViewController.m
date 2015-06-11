//
//  ThirdViewController.m
//  testTab
//
//  Created by S5-01 on 2015/01/28.
//  Copyright (c) 2015年 taniguti. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<UIWebViewDelegate> {
    IBOutlet UIWebView *testWebView;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    testWebView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:@"http://www.yahoo.co.jp"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [testWebView loadRequest:req];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ページ読込開始時にインジケータをくるくるさせる
-(void)webViewDidStartLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

// ページ読込完了時にインジケータを非表示にする
-(void)webViewDidFinishLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


-(IBAction)doReWind:(id)sender {
    [testWebView goBack];
}

-(IBAction)doReLoad:(id)sender {
    [testWebView reload];
}
@end

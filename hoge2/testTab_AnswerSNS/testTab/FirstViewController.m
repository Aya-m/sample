//
//  FirstViewController.m
//  testTab
//
//  Created by S5-01 on 2015/01/28.
//  Copyright (c) 2015年 taniguti. All rights reserved.
//

#import "FirstViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface FirstViewController ()<UITableViewDelegate,MFMailComposeViewControllerDelegate>{
    IBOutlet UITableView *myTableView;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    myTableView.delegate = self;
    myTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//必須デリゲートメソッド：セルの行数を指定
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
//必須デリゲートメソッド：セルに内容を表示　（セルの数だけ繰り返す）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // "cell"というkeyでcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    // cellデータが無い場合、UITableViewCellを生成して、"cell"というkeyでキャッシュする
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    

    cell.textLabel.text = @"tabView";
    

    
    
    return cell;
}
//デリゲートメソッド：タップされたとき　indexPathにタップした行数がはいる
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // cellがタップされた際の処理
    
    NSLog(@"isTap :%d",indexPath.row);
    
//    if(indexPath.row==0) [self mailStartUp];
//    if(indexPath.row==1) [self urlScheme];
//    else [self pressBtn];
    


    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除
}

- (void)urlScheme {
        NSURL *url = [NSURL URLWithString:@"mole://"];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    
}

- (void)pressBtn {
    
   
//    NSURL *url = [NSURL URLWithString:@"mole://"];
//    if ([[UIApplication sharedApplication] canOpenURL:url]) {
//        [[UIApplication sharedApplication] openURL:url];
//    }
//    
//    return;
    
    NSString *text = @"Hello World!";
    NSArray* actItems = [NSArray arrayWithObjects:text, nil];
    
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:actItems applicationActivities:nil] ;
    
    [self presentViewController:activityView animated:YES completion:^{
    }];
    
    
//    //保存したいイメージ
//    UIImage *saveImage = nil;
//    
//    // UIActivityViewController
//    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:@[saveImage] applicationActivities:@[]];
//    
//    // 表示
//    [self presentViewController:activityView animated:YES completion:nil];
}


// メールアプリ起動
- (void)mailStartUp
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass != nil)
    {
        MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
        mailPicker.mailComposeDelegate = self;
        [mailPicker setSubject:NSLocalizedString(@"件名", @"")];
        
        [mailPicker setMessageBody:@"本文" isHTML:NO];
        
        [mailPicker setToRecipients:@[@"受信メールアドレス"]];
        
        if ([mailClass canSendMail])
        {
            [self presentViewController:mailPicker animated:TRUE completion:nil];
        }
    }
}

// メール送信処理完了時のイベント
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    switch (result)
    {
            // キャンセル
        case MFMailComposeResultCancelled:
            break;
            // 保存
        case MFMailComposeResultSaved:
            break;
            // 送信
        case MFMailComposeResultSent:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"送信に成功しました。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
            // 送信失敗
        case MFMailComposeResultFailed:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"送信に失敗しました。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

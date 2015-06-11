//
//  FourthViewController.m
//  testTab
//
//  Created by S5-01 on 2015/02/02.
//  Copyright (c) 2015年 taniguti. All rights reserved.
//

#import "FourthViewController.h"
#import <MessageUI/MFMailComposeViewController.h>
#import <Social/Social.h>

@interface FourthViewController ()<MFMailComposeViewControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>{
    IBOutlet UIImageView *selectImageView;
}

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    selectImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesure = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
    [selectImageView addGestureRecognizer:tapGesure];
}
- (IBAction)doTap:(UITapGestureRecognizer*)sender {
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"選んでね" delegate:self cancelButtonTitle:@"とりけし" destructiveButtonTitle:nil otherButtonTitles:@"カメラ",@"アルバム", nil];
    as.tag=2;
    [as showInView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doMail:(id)sender {
    // メールビュー生成
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    // メール件名
    [picker setSubject:@"メールの件名をここに入力します"];
    
    // 添付画像
    NSData *myData = [[NSData alloc] initWithData:UIImageJPEGRepresentation(selectImageView.image, 1)];
    [picker addAttachmentData:myData mimeType:@"image/jpeg" fileName:@"image"];
    
    // メール本文
    [picker setMessageBody:@"メールの本文がここに入ります" isHTML:NO];
    
    // メールビュー表示
    [self presentViewController:picker animated:YES completion:nil];
}
// アプリ内メーラーのデリゲートメソッド
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            // キャンセル
            
            break;
        case MFMailComposeResultSaved:
            // 保存 (ここでアラート表示するなど何らかの処理を行う)
            
            break;
        case MFMailComposeResultSent:
            // 送信成功 (ここでアラート表示するなど何らかの処理を行う)
            
            break;
        case MFMailComposeResultFailed:
            // 送信失敗 (ここでアラート表示するなど何らかの処理を行う)
            
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction)doSafari:(id)sender {
    
    NSString *urlString = @"http://yahoo.co.jp";
    NSURL *url = [NSURL URLWithString:urlString];
    
    // ブラウザを起動する
    [[UIApplication sharedApplication] openURL:url];
    
}

-(IBAction)doSNS:(id)sender {
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"選んでください" delegate:self cancelButtonTitle:@"CXL" destructiveButtonTitle:nil otherButtonTitles:@"Twitter",@"facebook", nil];
    as.tag=1;
    [as showInView:self.view];
}

// アクションシートのボタンが押された時に呼ばれるデリゲート例文
-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            // １番目のボタンが押されたときの処理を記述する
            
        {
            if (actionSheet.tag==1) {
                // 処理
                NSLog(@"actionsheet.tag:%d",actionSheet.tag);
                if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ツイートエラー"
                                                                    message:@"Twitterアカウントが設定されていません。"
                                                                   delegate:nil
                                                          cancelButtonTitle:nil
                                                          otherButtonTitles:@"OK", nil];
                    [alert show];
                    return;
                }
                
                NSString *text = @"";
                NSURL *URL = [NSURL URLWithString:@""];
//                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"hogehoge"]];
                SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                [controller setInitialText:text];
                [controller addURL:URL];
                [controller addImage:selectImageView.image];
                controller.completionHandler =^(SLComposeViewControllerResult result){
                    [self dismissViewControllerAnimated:YES completion:nil];
                };
                [self presentViewController:controller animated:YES completion:nil];
                
            }else if(actionSheet.tag==2){
                // 処理
                NSLog(@"actionsheet.tag:%d",actionSheet.tag);
                UIImagePickerController *ipc = [[UIImagePickerController alloc] init] ; // 生成
                //もしカメラがつかえなければ
                if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    //returnは処理をここで停止する
                    return;
                }
                
                ipc.delegate = self;
                ipc.sourceType = UIImagePickerControllerSourceTypeCamera;//カメラorアルバム
                ipc.allowsEditing = YES;//変形を許可
                
                //モーダルビューでImagePickerControllerをよびだす
                [self presentViewController:ipc animated:YES completion:nil];
                
            }
        
            
        
        }
            
            
            break;
        case 1:
            // ２番目のボタンが押されたときの処理を記述する
            
        {
            if (actionSheet.tag==1) {
                if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"シェアエラー"
                                                                    message:@"facebookアカウントが設定されていません。"
                                                                   delegate:nil
                                                          cancelButtonTitle:nil
                                                          otherButtonTitles:@"OK", nil];
                    [alert show];
                    return;
                }
                
                NSString *text = @"hogehoge";
                NSURL *URL = [NSURL URLWithString:@"hogehoge"];
//                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"hogehoge"]];
                SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                [controller setInitialText:text];
                [controller addURL:URL];
                [controller addImage:selectImageView.image];
                controller.completionHandler =^(SLComposeViewControllerResult result){
                    [self dismissViewControllerAnimated:YES completion:nil];
                };
                [self presentViewController:controller animated:YES completion:nil];
            }else if(actionSheet.tag==2){
                UIImagePickerController *ipc = [[UIImagePickerController alloc] init] ; // 生成
                ipc.delegate = self;
                ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//カメラorアルバム
                ipc.allowsEditing = YES;//変形を許可
                
                //モーダルビューでImagePickerControllerをよびだす
                [self presentViewController:ipc animated:YES completion:nil];
            }
        }
            
            break;
        case 2:
            // ３番目のボタンが押されたときの処理を記述する
            break;
    }
    
}
//撮影完了時によばれるUIImagePickerControllerDelegateメソッド
- (void)imagePickerController: (UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"撮影");
    UIImage *tmpImage = [info objectForKey:UIImagePickerControllerEditedImage];
    selectImageView.image = tmpImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//撮影キャンセル時によばれるUIImagePickerControllerDelegateメソッド
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"キャンセル");
    [picker dismissViewControllerAnimated:YES completion:nil];
}



@end

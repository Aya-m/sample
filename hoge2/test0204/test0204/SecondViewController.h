//
//  SecondViewController.h
//  test0204
//
//  Created by S5-04 on 2015/02/04.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import <UIKit/UIKit.h>

//backで情報渡す設定　必ずimportの後ろで！
@protocol ScondViewControllerDelegate <NSObject>
-(void)getString:(NSString*)string;
@end
//backで情報渡す設定//

@interface SecondViewController : UIViewController

@property NSString *inputText;//Text Fieldに入れた中身を取得

//backで情報渡す設定
@property id<ScondViewControllerDelegate>delegate;

@end

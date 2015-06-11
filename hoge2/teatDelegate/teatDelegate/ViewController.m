//
//  ViewController.m
//  teatDelegate
//
//  Created by S5-04 on 2015/02/09.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UIActionSheetDelegate>{
    IBOutlet UITableView *myTableView;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //必須記載項目
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [myTableView reloadData];//必須！おまじない　再度データを読み込んでもらう

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//セルの行数指定 count で配列の数が返ってくる
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;//数字はカッコいらない
}


//セルの中身設定
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // "cell"というkeyでcellデータを取得
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    // cellデータが無い場合、UITableViewCellを生成して、"cell"というkeyでキャッシュする
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = @"hoge";
    //
    //    //2行目のみ変更の場合
    //    if (indexPath.row==2) {
    //        cell.textLabel.text = @"hogeeeee";
    //    }
    
    
    //ナンバーのみががでる 1 2 3....
    //cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    //ももばかりが出る
    //cell.textLabel.text = tmpArray[0];
    
    //順番に果物がでる
    //cell.textLabel.text = tmpArray[indexPath.row];
    
    return cell; //必ず一番下に書く
}


// cellがタップされた際の処理　ボタンとして処理はできない
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 選択状態の解除
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //int num = indexPath.row;//行数におうじての何番めかを取得　次のページに行く前に書く
    
    
    
//    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"次の画面に行きますか？" delegate:self
//                                           cancelButtonTitle:@"CXL" destructiveButtonTitle:nil otherButtonTitles:@"Yes", nil];
//    [as showInView:self.view];


    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"確認" message:@"移行してもよろしいですか？"
                              delegate:self cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
    [alert show];

    
    NSLog(@"タップしたよ");
    
    
    
    
}

/*-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
   // UIImagePickerController *ipc = [[UIImagePickerController alloc] init] ; // 生成
    switch (buttonIndex) {
        case 0:
            // 1番目のボタンが押されたときの処理を記述する
            
            //次のページにいく
            [self performSegueWithIdentifier:@"toSecond" sender:self];
            
            
            NSLog(@"1");
            break;
        case 1:
      
            break;
           }
}*/

// アラートのボタンが押された時に呼ばれるデリゲート例文
-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            //１番目のボタンが押されたときの処理を記述する
           
            break;
        case 1:
            //２番目のボタンが押されたときの処理を記述する
            
            
            //次のページにいく
            [self performSegueWithIdentifier:@"toSecond" sender:self];
            break;
    }
    
}




@end

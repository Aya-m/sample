//
//  ViewController.m
//  test0204
//
//  Created by S5-04 on 2015/02/04.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "ViewController.h"
#import "CustomImageView.h"
#import "SecondViewController.h"


@interface ViewController ()<UITextFieldDelegate,ScondViewControllerDelegate/*backで情報渡す設定*/>{
    IBOutlet UITextField *testField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //文字ボードのReturnを押すとキーボドが消える処理 -1
    testField.delegate = (id)self;

    
    
    //通常コード画像設定
    UIImageView *myImage = [[UIImageView alloc] init];
    myImage.frame = CGRectMake(10, 10, 75, 75);
    [self.view addSubview:myImage];
    myImage.image =  [UIImage imageNamed:@"mole_none.png"];
    

    
    
    
    
    
    // 20回繰り返す 20は含まない 0~19
    for (int i = 0; i < 8; i++) {
        
        int num = 0;
        num = (i%4)*75;//%は余り 3%4= 0.75 intは小数点以下は切り捨て なので0
        
        
        int hoge = 0;
        hoge = (i/4)*75;
        
        //画像表示
        //CustomImageViewで設定したinitの画像が呼ばれる
        CustomImageView *myImage2 = [[CustomImageView alloc] init];
        myImage2.frame = CGRectMake(10, 85, 75, 75);
        [self.view addSubview:myImage2];
        
        //UIImageView *myImage = [[UIImageView alloc] init];
        myImage2.frame = CGRectMake(10+num, 85+hoge, 75, 75);
        
        
        NSLog(@"%d", i);
        
        // CustomImageView.mで作ったtestメゾットにmyImage2の画像が上書きされる
        //[myImage2 test];
        
    }
    
}



    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

//文字ボードのReturnを押すとキーボドが消える処理 -2
//- (void)viewDidLoad 内にも　" testField.delegate = (id)self;　" 書く
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [testField resignFirstResponder];
    return YES;
}



- (IBAction)doNext:(id)sender {
    
    //length　textField内の文字数を数える　0よりも大きければ if なければ else
    if (testField.text.length>0){
        [self performSegueWithIdentifier:@"toSecond" sender:self];//selfの名前でないとダメ
    }else{
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"ご注意" message:@"1文字以上入力してください" delegate:nil cancelButtonTitle:@"閉じる" otherButtonTitles:nil, nil];//nil means empty
        [av show];//必ずshowする
    }
    
   

}

//次画面へのSegueの発動 内容を送りたい時 一番上に #import "SecondViewController.h" 書きインポート
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"コード追加したよ");
    if ([[segue identifier] isEqualToString:@"toSecond"]) {
        SecondViewController *svc = (SecondViewController*)[segue destinationViewController]; //svc　はインスタンス名
        svc.inputText = testField.text;//inputTextはSecondViewController.hでpropertyしたもの
        
        svc.delegate = self; //backで情報渡す設定
        
        
    }
    
}

//SecondViewControllerのデリゲートメゾット
//SecondViewControllerのbackを押した時に発動される コレ [self.delegate getString:@"Chocolate"];
-(void)getString:(NSString*)string{
    NSLog(@"get:%@",string);
    
}



@end

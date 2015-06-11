//
//  ViewController.m
//  test1222
//
//  Created by S5-04 on 2014/12/22.
//  Copyright (c) 2014年 msd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    //IBOutletしたものはalloc init処理しなくていい
    IBOutlet UITextField*inputTextField;
    IBOutlet UISegmentedControl*selectSeg;
    NSArray *tmpArray;
    IBOutlet UILabel *myLabel;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //文字ボードのReturnを押すとキーボドが消える処理
    inputTextField.delegate = (id)self;
    
    tmpArray = [[NSArray alloc] init];/*初期化しNSArrayメモリー確保処理*/
    tmpArray = @[@"りんご",@"みかん",@"ぶどう"];
    NSLog(@"%@",tmpArray[1]);
    
//    IOS7以後の配列処理の書き方
//    NSArray *tmpArray = [[NSArray alloc] init];/*初期化しNSArrayメモリー確保処理*/
//    tmpArray = @[@"りんご",@"みかん",@"ぶどう"];
//    NSLog(@"%@",tmpArray[0]);
    
    //IOS7以前の配列処理の書き方
    //NSArray *tmpArray = [NSArray arrayWithObjects:@"りんご",@"みかん",@"ぶどう",nil];
    //NSLog(@"%@",[tmpArray objectAtIndex:1]);
    
    //0からカウントされる　0=りんご, 1=みかん, 2=ぶどう
    
    //セグメント最初に選ばれているやつ
    selectSeg.selectedSegmentIndex=0;
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Nextボタンメソッド
-(IBAction)doNext:(id)sender{
    
    //Textfield 文字の処理
    NSString*string = [[NSString alloc] init];
    //UILabel*testLabel = [[UILabel alloc] init];
    //NSString alloc Means NSString のメモリー領域確保, init Means 初期化する
    
    string = inputTextField.text;
    NSLog(@"テキストの中身は%@",string);
    
    // Modal遷移処理
    [self performSegueWithIdentifier:@"toSecond" sender:self];
    
    /*
     string = inputTextField.text;
     NSLog(@"テキストの中身は%@",string);
     はこの一行でも成り立つ
     NSLog(@"テキストの中身は%@",inputTextField.text);
     */

  
}

//文字ボードのReturnを押すとキーボドが消える処理
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [inputTextField resignFirstResponder];
    return YES;
}

-(IBAction)doSelect:(UISegmentedControl*)sender{
    NSLog(@"segmented %ld",sender.selectedSegmentIndex); /*"%d"でも問題無い*/
//storyboardで右クリックし、Value changedとdoSelectを繋ぐ
    NSLog(@"選んだのは%@",tmpArray [sender.selectedSegmentIndex]);
    myLabel.text=@"なるほど！";
    
}

@end

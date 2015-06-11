//
//  SecondViewController.m
//  test0204
//
//  Created by S5-04 on 2015/02/04.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIPickerViewDelegate, UIPickerViewDataSource> {
     IBOutlet UILabel*testLabel01;
    IBOutlet UIPickerView*piv;
    NSArray *testArray;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     testLabel01.text = [NSString stringWithFormat:@"%@ さん" ,self.inputText];
    //testLabel01.text = self.inputText; さん無し
    NSLog(@"%@ さん" ,self.inputText);
    
    //UIPickerView
    piv.delegate = self;  // 必須　デリゲートを自分自身に設定
    piv.dataSource = self;  // 必須　データソースを自分自身に設定
    
    testArray = @[@"りんご",@"いちご",@"みかん",@"マンゴー",@"ゆず"];
    
   }




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 列数を返す
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 1; //列数は２つ
}
// 行数を返す
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    //return 10; // 1列目は10行
        return [testArray count];
    }
    
// 表示する内容を返す
-(NSString*)pickerView:(UIPickerView*)pickerView
           titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    // 行インデックス番号を返す
    //return [NSString stringWithFormat:@"%d", row];
    return testArray[row];

           }


//ピッカーの選択行が決まったときに呼ばれる
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    // 1列目の選択された行数を取得
    NSInteger val0 = [pickerView selectedRowInComponent:0];

    NSLog(@"%d行目が選択", val0);//0〜スタート
    NSLog(@"「%@」が選択", testArray[val0]);
   
}



- (IBAction)doBack:(id)sender{
    
    //backで戻った時に渡す情報
    [self.delegate getString:@"Chocolate"];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];//画面を閉じるときは、これコピペ
}


@end

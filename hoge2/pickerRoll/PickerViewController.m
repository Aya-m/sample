//
//  ViewController.m
//  pickerRoll
//
//  Created by S5-01 on 2015/02/16.
//  Copyright (c) 2015年 taniguti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    IBOutlet UIPickerView *selectPickerView;
    IBOutlet UIView *selectView;
    NSArray *selectArray;
    
    IBOutlet UILabel *choiceLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    selectArray = @[@"初級",@"中級",@"上級"];
    selectPickerView.delegate = self;
    selectPickerView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// デリゲートメソッドの実装
// 列数を返す例
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
    return 1; //列数は２つ
}

// 行数を返す例
-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [selectArray count];
    
}

// 表示する内容を返す例
-(NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    // 行インデックス番号を返す
    return [NSString stringWithFormat:@"%@", selectArray[row]];
    
}
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    choiceLabel.text = selectArray[[pickerView selectedRowInComponent:0]];
}


- (IBAction)doRoll:(id)sender {
    selectView.frame = CGRectMake(0, self.view.frame.size.height, selectView.frame.size.width, selectView.frame.size.height);
    [self.view addSubview:selectView];
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         // アニメーションをする処理
                         selectView.frame = CGRectMake(0, self.view.frame.size.height - selectView.frame.size.height, selectView.frame.size.width, selectView.frame.size.height);
                     }
                     completion:nil];
}
- (IBAction)doClose:(id)sender {
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         // アニメーションをする処理
                         selectView.frame = CGRectMake(0, self.view.frame.size.height, selectView.frame.size.width, selectView.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         // アニメーションが終わった後実行する処理
                         [selectView removeFromSuperview];
                     }];
    
    
}

@end

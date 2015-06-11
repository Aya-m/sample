//
//  CustomImageView.m
//  test0204
//
//  Created by S5-04 on 2015/02/04.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView


/*オーバーライド 継承される*/
- (id)init {
self = [super init];
if (self != nil) {



    //モグラdefの画像表示 selfはUIImageViewの意味
    self.image = [UIImage imageNamed:@"mole_def.png"];
    
    //GestureRecognizerクラス（タップ検知）
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
    //inputImageView(対象)にジェスチャーセット（タップ検知）
    [self addGestureRecognizer:tap];
    //inputImageView(対象)のアクションを許可（タップ検知）
    self.userInteractionEnabled = YES;
    

    
}
    
    return self;
}



-(IBAction)doTap:(id)sender{
    NSLog(@"タップしたよ");
    
    self.image = [UIImage imageNamed:@"mole_hit.png"];
}

-(void)test{
    self.image = [UIImage imageNamed:@"mole_miss.png"];
}

@end

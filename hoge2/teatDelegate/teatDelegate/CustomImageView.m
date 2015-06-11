//
//  CustomImageView.m
//  testDelegate
//
//  Created by S5-01 on 2015/02/09.
//  Copyright (c) 2015年 taniguti. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

/*オーバーライド*/
- (id)init {
    self = [super init];
    if (self != nil) {
        
        //initメソッドは「alloc init」の際に必ず呼ばれるので初期設定等はここでするのがいい。
        
        //タップジェスチャーを作成しタップ可能にしている
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isTap:)];
        [self addGestureRecognizer:tapGesture];
        self.userInteractionEnabled = YES;
        
    }
    
    return self;
}

//isTapViewでtagの番号を取得
-(IBAction)isTap:(id)sender {
    [self.delegate isTapView:(int)self.tag];
}

@end

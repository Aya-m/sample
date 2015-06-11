//
//  CustomLabel.m
//  testCode2
//
//  Created by S5-04 on 2015/02/03.
//  Copyright (c) 2015年 msd. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*オーバーライド 継承される*/
- (id)init {
    self = [super init];
    if (self != nil) {
    self.text = @"テキスト";
    }
    return self;
}

@end

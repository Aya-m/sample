//
//  CustomImageView.h
//  testDelegate
//
//  Created by S5-01 on 2015/02/09.
//  Copyright (c) 2015年 taniguti. All rights reserved.
//

#import <UIKit/UIKit.h>

//デリゲートメゾットを自作するときは下記を全て書く
@protocol CustomImageViewDelegate <NSObject>
-(void)isTapView:(int)tag;
@end

@interface CustomImageView : UIImageView

@property id<CustomImageViewDelegate>delegate;

@end

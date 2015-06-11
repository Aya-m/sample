//
//  SecondViewController.m
//  testTab
//
//  Created by S5-01 on 2015/01/28.
//  Copyright (c) 2015年 taniguti. All rights reserved.
//

#import "SecondViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SecondViewController ()<CLLocationManagerDelegate>{
    IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;
    MKCoordinateRegion region;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initLocation];
    [self initMapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initLocation {
    //Locaton Managerを作成
    locationManager = [[CLLocationManager alloc] init];
    //Location Managerの設定
    locationManager.delegate = self;
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    
    
    float iOSVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    NSLog(@"iOS %f", iOSVersion);
    if(iOSVersion >= 8.0)
    {
        //iOS 8.0以上の場合
        NSLog(@"iOS 8.0 or more!");
        
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [locationManager requestWhenInUseAuthorization];
        }
    }
    
    
    
    
    //位置情報取得開始
    [locationManager startUpdatingLocation];
}

//位置情報が更新された時呼ばれるメソッド
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    NSLog(@"%f", newLocation.coordinate.longitude);
    //現在地が移動したら、地図も追従
    region.center = newLocation.coordinate;
    [mapView setRegion:region];
//    [mapView setRegion:region animated:YES];
    [locationManager stopUpdatingLocation];
}
//位置取得失敗時に呼ばれるメソッド
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (error) {
    }
}
- (void)initMapView {
    //地図上に現在地マーカーを表示
    mapView.showsUserLocation = YES;
    //最初の中心点を東京タワーに設定
    region.center.latitude = 35.658609;
    region.center.longitude = 139.745447;
    //ズームの設定
    region.span.latitudeDelta = 0.005;
    region.span.longitudeDelta = 0.005;
    //地図の中心を移動
    [mapView setRegion:region];
//    [mapView setRegion:region animated:YES];
}

@end

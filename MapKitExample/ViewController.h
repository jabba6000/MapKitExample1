//
//  ViewController.h
//  MapKitExample
//
//  Created by Uri Fuholichev on 10/7/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

/*
 1) Небольшой ридми. Итак, для начала не забудь добавить в plist
     NSLocationWhenInUseUsageDescription
     NSLocationAlwaysUsageDescription
 Это чтобы иметь возможность эмулировать точки. Дальше. Импортируем МапКит и КорЛокэйшн фрэймворки. 
 2) На всякий случай я еще добавил Allow arbitrary loads в plist, чтобы иметь доступ к интернету.
 3) В сториборде добавляем на ВьюКонтроллер MapView. C этого момента, даже если не сделать оутлет, все будет работать.То есть в симуляторе будет показываться карта.
 4) Делаем оутлет МапВью (ну это, если конечно не добавляли его программно);
 5) Создаем объект Локайшн Менежер, и там все что записано во ВьюДидЛоад;
 6) Выставляем делегата МапВью;
*/
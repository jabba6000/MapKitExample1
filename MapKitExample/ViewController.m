//
//  ViewController.m
//  MapKitExample
//
//  Created by Uri Fuholichev on 10/7/16.
//  Copyright © 2016 Andrei Karpenia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    //Этот менеджер - ключевая фишка, чтобы отлавливать геоданные
    CLLocationManager *locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //не заубудь выставить делегата для мапВью
    self.mapView.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
//    locationManager.delegate = self;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //здесь мы делаем zoom над позицией пользователя, стороны прямоугольника 800х800 метров
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add an annotation: добавление аннотации. Здесь мы добавили булавку на карту, булавка соответствует стартовому положению пользователя. На булавку можно нажать и выскочит описание.
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
}

@end

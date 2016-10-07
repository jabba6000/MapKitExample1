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
    
    //здесь мы добавляем кастомную координату на карту (устанавливаем на нее маркер )
    CLLocationCoordinate2D restOneCoordinates = CLLocationCoordinate2DMake(53.909114, 27.555841);
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:restOneCoordinates];
    [annotation setTitle:@"Rest"];
    [annotation setSubtitle:@"One"];
    [self.mapView addAnnotation:annotation];

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

//по этой кнопке осуществляется переход на какую-то прописанную точку
- (IBAction)showAddressBtn:(UIButton *)sender {
    //создаем координату
    CLLocationCoordinate2D restOneCoordinates = CLLocationCoordinate2DMake(53.910549,27.557752);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(restOneCoordinates, 50000, 50000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];

    
}

@end

//
//  AppDelegate.h
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UINavigationController *navC;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain)HomeViewController *ViewController;


@end


//
//  HomeViewController.h
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController


@property(nonatomic,retain)IBOutlet UIImageView *imgLogo;
@property(nonatomic,retain)IBOutlet UIImageView *imgtextLogo;

-(IBAction)clickSignIn:(id)sender;
-(IBAction)clickSignUp:(id)sender;

@end

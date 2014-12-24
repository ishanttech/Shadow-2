//
//  SignInViewController.h
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;


@interface SignInViewController : UIViewController<UITextFieldDelegate>{
    NSMutableData *
    nsUrlResponseData;
    NSMutableArray * allData;
    MBProgressHUD *HUD;
    NSString *getUserID;
    NSString *getEmail;
    NSString *getUser_id;
}

@property(nonatomic,retain)IBOutlet UIImageView *imgLogo;

@property(nonatomic,retain)IBOutlet UITextField *fldShadowName;
@property(nonatomic,retain)IBOutlet UITextField *fldPassword;

-(IBAction)clickLogin:(id)sender;
-(IBAction)clickSignup:(id)sender;

@end

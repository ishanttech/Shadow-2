//
//  EditViewController.h
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,retain)IBOutlet UITextField *fldShadowName;
@property(nonatomic,retain)IBOutlet UITextField *fldUniversity;
@property(nonatomic,retain)IBOutlet UITextField *fldChangePass;
@property(nonatomic,retain)IBOutlet UITextField *fldEmail;
@property(nonatomic,retain)IBOutlet UITextField *fldGender;
-(IBAction)clickBack:(id)sender;

@end

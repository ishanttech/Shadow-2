//
//  PostEventDetailViewController.h
//  Shadow
//
//  Created by Test on 15/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostEventDetailViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>{
     UIDatePicker *datePicker;
    UIDatePicker *timePicker;

    UIImageView *topImage;
    UIButton *NewbtnCancel ;
    UIButton *newbtnDone ;
    
    NSString *user_id;
    NSString *getEmail;
    int tag;
}
@property(nonatomic,retain) UIImage *getImage;
@property(nonatomic,retain)IBOutlet UILabel *lblTime;
@property(nonatomic,retain)IBOutlet UILabel *lblDate;
@property(nonatomic,retain)IBOutlet UILabel *lblEmail;

@property(nonatomic,retain)IBOutlet UITextField *fldVenue;
@property(nonatomic,retain)IBOutlet UITextView  *fldAddress;
@property(nonatomic,retain)IBOutlet UITextView *fldDescription;



-(IBAction)clickDate:(id)sender;
-(IBAction)clickTime:(id)sender;

-(IBAction)clickNext:(id)sender;
-(IBAction)clickBack:(id)sender;

@end

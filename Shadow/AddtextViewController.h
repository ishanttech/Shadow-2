//
//  AddtextViewController.h
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface AddtextViewController : UIViewController<UITextViewDelegate>{
    NSString *getDate;
    NSString *getTime;
    NSMutableData *
    nsUrlResponseData;
    NSMutableArray * allData;
    MBProgressHUD *HUD;

}

@property(nonatomic,retain)IBOutlet  UITextView *txtcomment;

@property(nonatomic,retain) UIImage *getImage;
@property(nonatomic,retain)IBOutlet UIImageView *imgHidden;


-(IBAction)clickBack:(id)sender;
-(IBAction)clickNext:(id)sender;

@end

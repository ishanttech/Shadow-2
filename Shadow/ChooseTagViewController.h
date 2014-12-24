//
//  ChooseTagViewController.h
//  Shadow
//
//  Created by Test on 15/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface ChooseTagViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableData *
    nsUrlResponseData;
    NSMutableArray * allData;
    MBProgressHUD *HUD;
    NSArray *getData ;
   
    NSMutableArray *arSelectedRows;
   // UIImageView *dot;

    
}
@property(nonatomic,retain)IBOutlet UIButton *btnShare;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property(nonatomic,retain)IBOutlet UIImageView *imgHidden;
@property(nonatomic,retain)UIImage *getImage;

@property(nonatomic,retain)NSString *strEmail;
@property(nonatomic,retain)NSString *strdate;
@property(nonatomic,retain)NSString *strTime;
@property(nonatomic,retain)NSString *strVenue;
@property(nonatomic,retain)NSString *strAddress;
@property(nonatomic,retain)NSString *strDescription;
          

@property(nonatomic,retain)IBOutlet UITableView *TblTags;

-(IBAction)clickBack:(id)sender;
-(IBAction)clickShare:(id)sender;

@end

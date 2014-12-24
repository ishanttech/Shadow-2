//
//  SignUpViewController.h
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface SignUpViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
    NSMutableData *
    nsUrlResponseData;
    NSMutableArray * allData;
    NSMutableArray * universityData;
    MBProgressHUD *HUD;
    NSString *getUserID;
    int tag;
    long getindex;
    NSString *getUniversityid;
    
    

}
//@property(nonatomic,reta)

@property(nonatomic,retain)IBOutlet UIImageView *imgLogo;

@property(nonatomic,retain)IBOutlet UITableView *tblUniversitry;

@property(nonatomic,retain)IBOutlet UIImageView *imgtblHeader;
@property(nonatomic,retain)IBOutlet UIButton *btnCross;

@property(nonatomic,retain)IBOutlet UITextField *fldShadowName;
@property(nonatomic,retain)IBOutlet UITextField *fldPassword;
//@property(nonatomic,retain)IBOutlet UITextField *fldUniversity;
@property(nonatomic,retain)IBOutlet UITextField *fldEmail;

@property(nonatomic,retain)IBOutlet UILabel *lblUniversity;


-(IBAction)clickSignup:(id)sender;
-(IBAction)clickUniversity:(id)sender;
-(IBAction)clickBack:(id)sender;

-(IBAction)clickCross:(id)sender;

@end

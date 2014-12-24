//
//  MenuViewController.h
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    int tag;
    BOOL checked;
     NSArray *settingItem;
}
@property(nonatomic,retain)IBOutlet UIImageView *imgFirstArrow;
@property(nonatomic,retain)IBOutlet UIImageView *imgSecondArrow;
@property(nonatomic,retain)IBOutlet UITableView *tblNotification;

@property(nonatomic,retain)IBOutlet UIButton *btnLogout;

@property(nonatomic,retain)IBOutlet UILabel *lblLogout;
@property(nonatomic,retain)IBOutlet UIImageView *imgLogoutIcon;

-(IBAction)clickBack:(id)sender;
-(IBAction)clickUserProfile:(id)sender;
-(IBAction)clickSetting:(id)sender;
-(IBAction)clickNotification:(id)sender;

-(IBAction)clickLogout:(id)sender;

@end

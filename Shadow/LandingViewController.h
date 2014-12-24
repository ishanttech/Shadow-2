//
//  LandingViewController.h
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBProgressHUD;

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)

@interface LandingViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableData *
    nsUrlResponseData;
    NSMutableArray * allData;
    MBProgressHUD *HUD;
    NSMutableArray *getData;
    NSString *getUrl;
}
@property (nonatomic, retain) UICollectionView *_collectionView;

-(IBAction)clickRecent:(id)sender;
-(IBAction)clickFeatured:(id)sender;
-(IBAction)clickTags:(id)sender;
-(IBAction)clickUniversity:(id)sender;
-(IBAction)clickMenu:(id)sender;
-(IBAction)clickAddEvents:(id)sender;
-(IBAction)clickGridView:(id)sender;
-(IBAction)clickTableView:(id)sender;

@end

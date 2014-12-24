//
//  ProfileViewController.h
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray *recipeImages;
}
@property (nonatomic, retain) UICollectionView *_collectionView;

-(IBAction)clickGridView:(id)sender;
-(IBAction)clickTableView:(id)sender;
-(IBAction)clickAddPost:(id)sender;
-(IBAction)clickMenu:(id)sender;
-(IBAction)clickeditProfile:(id)sender;

@end

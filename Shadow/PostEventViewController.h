//
//  PostEventViewController.h
//  Shadow
//
//  Created by Test on 15/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostEventViewController : UIViewController

@property(nonatomic,retain)IBOutlet UIImageView *imgEvent;
@property(nonatomic,retain) UIImage *getImage;

-(IBAction)clickNext:(id)sender;
-(IBAction)clickBack:(id)sender;

@end

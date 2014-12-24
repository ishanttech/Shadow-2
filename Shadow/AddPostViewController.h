//
//  AddPostViewController.h
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPostViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIImage *chosenImage;
    int tag;
}


@property(nonatomic,retain)IBOutlet UIImageView *imgPost;

@property(nonatomic,retain)IBOutlet UILabel *lblTextPost;
@property(nonatomic,retain)IBOutlet UILabel *lbltextType;


-(IBAction)clickBack:(id)sender;
-(IBAction)clickText:(id)sender;
-(IBAction)clickEvent:(id)sender;

@end

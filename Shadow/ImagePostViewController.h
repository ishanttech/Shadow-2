//
//  ImagePostViewController.h
//  Shadow
//
//  Created by Test on 15/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePostViewController : UIViewController<UITextFieldDelegate>{
    NSMutableData *
    nsUrlResponseData;
    NSMutableArray * allData;
}

@property(nonatomic,retain)IBOutlet UIButton *btnNext;
          

@property(nonatomic,retain)IBOutlet UITextView *fldText;
@property(nonatomic,retain)IBOutlet UIImageView *imgPost;
@property(nonatomic,retain) UIImage *getImage;
-(IBAction)clickBack:(id)sender;
-(IBAction)clickNext:(id)sender;

@end

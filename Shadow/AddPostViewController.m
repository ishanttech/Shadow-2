//
//  AddPostViewController.m
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "AddPostViewController.h"
#import "AddtextViewController.h"
#import "PostEventViewController.h"
#import "ImagePostViewController.h"

@interface AddPostViewController ()

@end

@implementation AddPostViewController
@synthesize imgPost;
@synthesize lblTextPost,lbltextType;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)clickEvent:(id)sender{
    tag=1;
   // [self showActionSheet];
    [self useCameraRoll];
    
}
-(IBAction)clickCamera:(id)sender{
    tag=2;
    [self showActionSheet];
    
}
- (void)showActionSheet //Define method to show action sheet
{
    NSString *actionSheetTitle = @"Shadow"; //Action Sheet Title
    //  NSString *destructiveTitle = @"Destructive Button"; //Action Sheet Button Titles
    NSString *other1 = @"Choose Existing";
    NSString *other2 = @"Camera";
    
    
    NSString *cancelTitle = @"Cancel Button";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle
                                                             delegate:self
                                                    cancelButtonTitle:cancelTitle
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:other1, other2, nil];
    
    [actionSheet showInView:self.view];
    
}

#pragma mark -
#pragma mark UIActionSheetDelegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Choose Existing"]) {
        
        
        [self useCameraRoll];
        
        
        
        
    }
    if ([buttonTitle isEqualToString:@"Camera"]) {
        
        [self useCamera];
    }
}
- (void)useCameraRoll
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)useCamera{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    chosenImage = info[UIImagePickerControllerOriginalImage];
    imgPost.image = chosenImage;
    lbltextType.hidden=YES;
    lblTextPost.hidden=YES;
   
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    if(tag==1){
        PostEventViewController *edit =[[PostEventViewController alloc]initWithNibName:@"PostEventViewController" bundle:nil];
        edit.getImage= chosenImage;
        [self.navigationController pushViewController:edit animated:YES];

    }
    else{
        ImagePostViewController *image =[[ImagePostViewController alloc]initWithNibName:@"ImagePostViewController" bundle:nil];
         image.getImage= chosenImage;
        [self.navigationController pushViewController:image animated:YES];
        
           }
    
    
    
}

-(IBAction)clickText:(id)sender{
    
    AddtextViewController *edit =[[AddtextViewController alloc]initWithNibName:@"AddtextViewController" bundle:nil];
    edit.getImage= chosenImage;
    [self.navigationController pushViewController:edit animated:YES];
   
}



@end

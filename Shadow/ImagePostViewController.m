//
//  ImagePostViewController.m
//  Shadow
//
//  Created by Test on 15/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "ImagePostViewController.h"
#import "LandingViewController.h"
#import "JSON.h"

@interface ImagePostViewController ()

@end

@implementation ImagePostViewController
@synthesize imgPost,fldText,getImage,btnNext;

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             
                                             
                                             
                                             initWithTarget: self
                                             
                                             
                                             
                                             action: @selector(hideKeyboard:)];
    
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
   imgPost.image = getImage;
    // Do any additional setup after loading the view from its nib.
}
- (void) keyboardWillShow {
    
    
    CGRect frame = self.view.frame;
    
    frame.origin.y = -150;
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = frame;
        
    }];
    
}
- (void) keyboardDidHide {
    
    
    
    // move the view back to the origin
    
    CGRect frame = self.view.frame;
    
    frame.origin.y = 0;
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = frame;
        
    }];
    
}
- (void)hideKeyboard:(UITapGestureRecognizer *)sender {
    [self keyboardDidHide];
    [fldText resignFirstResponder];
    
    
    
    
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    //[self keyboardWillShow];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [fldText resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        // txtAdd.text = @"Pet's Address";
        [self keyboardDidHide];
        [fldText resignFirstResponder];
       // [fldDescription resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickBack:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(IBAction)clickNext:(id)sender{
    [btnNext setEnabled: NO];
     if(fldText.text.length==0){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                          message:@"Please  Enter Title Of Post"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
         [btnNext setEnabled: YES];
        
    }
     else{
         
         UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
         ai.center = self.view.center;
         [ai startAnimating];
         [self.view addSubview:ai];
    
    [self saveImagePost];
     }
    
}
-(void)saveImagePost{
    
    NSData *imageData = UIImageJPEGRepresentation(imgPost.image, 0.3f);
    NSLog(@"%@",imageData);
    
    
    
    NSString *urlString =[NSString stringWithFormat:@"http://techwatts.com/shadowapp/api/post/image_post"]; // URL of upload script.
    NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    NSLog(@"%@",body);
    
    
    //  parameter imageData
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"test.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[NSData dataWithData:imageData]];
     [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // user id
    //  parameter mobilenumber
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"29" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    
    //  Post Title
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"post_title\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[fldText.text dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
     // Choose Tag
     [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"tag\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[@"Music" dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
     [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
     
     
    
    
    
    [request setHTTPBody:body];
    NSError *error;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil     error:&error];
    if (returnData)
    {
        //[HUD hide:YES];
        NSString *str=[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        NSLog(@"Resp string: %@",str);
        allData = [str JSONValue];
        NSLog(@"%@",allData);
        NSString *getMessage = [allData valueForKey:@"message"];
        NSLog(@"%@",getMessage);
         [btnNext setEnabled: YES];
        if([getMessage isEqualToString:@"Invalid parameters"]){
            // NSString *getmessage=[NSString stringWithFormat:@"You have earned %@ point",getPoint];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                              message:getMessage
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
        else{
            
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                              message:getMessage
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
            LandingViewController *landing =[[LandingViewController alloc]initWithNibName:@"LandingViewController" bundle:nil];
            [self.navigationController pushViewController:landing animated:YES];
        }
       
        
    }
    else
    {
        NSLog(@"Error: %@", error);
    }

}
@end

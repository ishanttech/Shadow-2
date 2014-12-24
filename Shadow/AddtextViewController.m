//
//  AddtextViewController.m
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "AddtextViewController.h"
#import "JSON.h"
#import "File.h"
#import "MBProgressHUD.h"



@interface AddtextViewController ()

@end

@implementation AddtextViewController
@synthesize txtcomment,getImage,imgHidden;

- (void)viewDidLoad {
    [super viewDidLoad];
     nsUrlResponseData =[[NSMutableData alloc]init];
    imgHidden.image = getImage;
    imgHidden.hidden=YES;
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             
                                             
                                             
                                             initWithTarget: self
                                             
                                             
                                             
                                             action: @selector(hideKeyboard:)];
    
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    [self getTime];
    // Do any additional setup after loading the view from its nib.
}
-(void)getTime{
   
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"dd-MMM-yyyy hh:mm:ss"];
   // [dateFormatter setTimeStyle:NSDateFormatterBehaviorDefault];
    NSString *currentTime = [dateFormatter stringFromDate:today];
   
    NSLog(@"User's current time in their preference format:%@",currentTime);
    NSArray * arr = [currentTime componentsSeparatedByString:@" "];
    NSLog(@"Array values are : %@",arr);
   getDate = [arr objectAtIndex:0];
    NSLog(@"%@",getDate);
     getTime = [arr objectAtIndex:1];
    NSLog(@"%@",getTime);
    
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
    [txtcomment resignFirstResponder];
    
    
    
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    //[self keyboardWillShow];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        // txtAdd.text = @"Pet's Address";
        [self keyboardDidHide];
        [txtcomment resignFirstResponder];
        return NO;
    }
    
    return YES;
}
-(IBAction)clickNext:(id)sender{
    [self saveTextPost];
    
}

-(void)saveTextPost{
    
   
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.labelText = @"Shadow";
    HUD.detailsLabelText = @"Loding...";
    HUD.mode = MBProgressHUDModeIndeterminate;
    [HUD show:YES];
    [self.view addSubview:HUD];
    
    
    
    NSString *urlString=[[NSString alloc]initWithString:[NSString stringWithFormat:@"%@&post_title=%@&tag=Music&user_id=29",KtextPost,txtcomment.text]];
    
    NSLog(@"String Url = %@",urlString);
    NSString* encodedUrl = [urlString stringByAddingPercentEscapesUsingEncoding:
                            NSASCIIStringEncoding];
    NSLog(@"%@",encodedUrl);
    NSURL *url = [NSURL URLWithString:encodedUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLConnection *connnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    [connnection start];
    
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Shadow" message:@"Check your Internet Connection" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
    
    [alert show];
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [nsUrlResponseData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [nsUrlResponseData appendData:data];
}

NSString *user_id;
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if ([nsUrlResponseData length]==0)
    {
        
    }
    
    else
    {
        [HUD hide:YES];
              // [loginbtn setEnabled:YES];
        
            NSString *str1 = [[NSString alloc]initWithData:nsUrlResponseData encoding:NSUTF8StringEncoding];
            allData = [str1 JSONValue];
            NSLog(@"allData==%@",allData);
        NSString *getMessage =[allData valueForKey:@""];
        
    
    
    
   }
}
-(IBAction)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

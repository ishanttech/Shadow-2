//
//  SignInViewController.m
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "SignInViewController.h"
#import "LandingViewController.h"
#import "SignUpViewController.h"
#import "MBProgressHUD.h"
#import "JSON.h"
#import "File.h"
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)

@interface SignInViewController ()

@end

@implementation SignInViewController
@synthesize fldPassword,fldShadowName,imgLogo;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getLayout];
     nsUrlResponseData =[[NSMutableData alloc]init];
    [fldPassword setValue:[UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [fldShadowName setValue:[UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
     nsUrlResponseData =[[NSMutableData alloc]init];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             
                                             
                                             
                                             initWithTarget: self
                                             
                                             
                                             
                                             action: @selector(hideKeyboard:)];
    
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];
    // Do any additional setup after loading the view from its nib.
}
-(void)getLayout{
    if(IS_IPHONE5){
        imgLogo.frame =CGRectMake(90,87,135,121);
        //imgtextLogo.frame =CGRectMake(94,253,138,27);
    }
    else{
        
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == fldPassword||textField== fldShadowName) {
        if(IS_IPHONE5){
            [self keyboardWillShow];
        }
        /*else if(textField == cityField|| textField==noField|| textField ==firstnameField||textField==lastnameField){
         [self keyboardWillShow];
         
         }*/
    }
}
- (void) keyboardWillShow {
    
    
    
    
    
    CGRect frame = self.view.frame;
    
    frame.origin.y = -100;
    
    
    
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
    [fldPassword resignFirstResponder];
    [fldShadowName resignFirstResponder];
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [fldPassword resignFirstResponder];
    [fldShadowName resignFirstResponder];
    
    
    [self keyboardDidHide];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickLogin:(id)sender{
   
    
    if(fldShadowName.text.length ==0){
        UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:@"Please Enter Your ShadowName" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [SuccessAlert show];
        
    }
    else if(fldPassword.text.length==0){
        UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:@"Please Enter Your Passcode" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [SuccessAlert show];
        
    }
           else{
        [self SignIn];
               
             /*  LandingViewController *signin =[[LandingViewController alloc]initWithNibName:@"LandingViewController" bundle:nil];
               [self.navigationController pushViewController:signin animated:YES];*/
            
        }
        
  
    

    
    
}
-(void)SignIn{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.labelText = @"Shadow";
    HUD.detailsLabelText = @"Loding...";
    HUD.mode = MBProgressHUDModeIndeterminate;
    [HUD show:YES];
    [self.view addSubview:HUD];
    
    
    
    NSString *urlString=[[NSString alloc]initWithString:[NSString stringWithFormat:@"%@&shadow_name=%@&password=%@",kLogin,fldShadowName.text,fldPassword.text]];
    // NSString *urlString=[[NSString alloc]initWithString:[NSString stringWithFormat:@"http://techwatts.com/pointepay/api/auth/login?email=vijju.cha@gmail.com&password=Year2014"]];
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
        NSString *getMessage =[allData valueForKey:@"message"];
        NSLog(@"%@",getMessage);
        if([getMessage isEqualToString:@"successfully get data"]){
            NSString *getData =[allData valueForKey:@"data"];
            NSLog(@"%@",getData);
            
            getEmail =[getData valueForKey:@"email"];
            NSLog(@"%@",getEmail);
            
            getUser_id =[getData valueForKey: @"user_id"];
            NSLog(@"%@",getUser_id);
            
            [self saveLoginStatus];
            
            UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:@"You have SuccessFully Login" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [SuccessAlert show];
             LandingViewController *signin =[[LandingViewController alloc]initWithNibName:@"LandingViewController" bundle:nil];
             [self.navigationController pushViewController:signin animated:YES];
            
        }
        else{
            UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:getMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [SuccessAlert show];
        }
    }
}

-(void)saveLoginStatus{
    NSUserDefaults *titleStorage = [NSUserDefaults standardUserDefaults];
    // [titleStorage setObject:user forKey:@"LoginStatus"];
    [titleStorage setObject:getUser_id forKey:@"U_id"];
    [titleStorage setObject:getEmail forKey:@"Email_id"];
    [titleStorage synchronize];    // 464526370469608
    [self getLoginStatus];
    
}
//NSString *getUser_id;
-(void)getLoginStatus{
    NSUserDefaults *titleStorage = [NSUserDefaults standardUserDefaults];
    //loginStatus = [titleStorage objectForKey:@"LoginStatus"];
    user_id = [titleStorage objectForKey:@"U_id"];
    getEmail = [titleStorage objectForKey:@"Email_id"];
    NSLog(@"%@",getEmail);
    NSLog(@"%@",user_id);
    
}
-(IBAction)clickSignup:(id)sender{
    SignUpViewController *signin =[[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];

}

@end

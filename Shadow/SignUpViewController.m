//
//  SignUpViewController.m
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "SignUpViewController.h"
#import "LandingViewController.h"
#import "SignInViewController.h"
#import "MBProgressHUD.h"
#import "File.h"
#import "JSON.h"
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)


@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize fldEmail,fldPassword,fldShadowName;
@synthesize tblUniversitry,imgtblHeader,btnCross,imgLogo;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self getLayout];
     [fldPassword setValue:[UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [fldEmail setValue:[UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [fldShadowName setValue:[UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    tblUniversitry.hidden=YES;
    imgtblHeader.hidden=YES;
    btnCross.hidden=YES;
     nsUrlResponseData =[[NSMutableData alloc]init];
   /* UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             
                                             
                                             
                                             initWithTarget: self
                                             
                                             
                                             
                                             action: @selector(hideKeyboard:)];
    
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];*/
    // Do any additional setup after loading the view from its nib.
}
-(void)getLayout{
    if(IS_IPHONE5){
        imgLogo.frame =CGRectMake(90,87,141,149);
        //imgtextLogo.frame =CGRectMake(94,253,138,27);
    }
    else{
        
    }
}

-(IBAction)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField==fldEmail) {
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
   
    [fldEmail resignFirstResponder];


    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [fldPassword resignFirstResponder];
    [fldShadowName resignFirstResponder];
   
    [fldEmail resignFirstResponder];
    [self keyboardDidHide];
    return YES;
}

-(IBAction)clickUniversity:(id)sender{
     [self keyboardDidHide];
    [self.view endEditing:YES];
    fldEmail.text = @"";
    
     tag=2;
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.labelText = @"Shadow";
    HUD.detailsLabelText = @"Loding...";
    HUD.mode = MBProgressHUDModeIndeterminate;
    [HUD show:YES];
    [self.view addSubview:HUD];
    
    
    
    NSString *urlString=[[NSString alloc]initWithString:[NSString stringWithFormat:@"%@",kUniversityList]];
    
    NSLog(@"String Url = %@",urlString);
    NSString* encodedUrl = [urlString stringByAddingPercentEscapesUsingEncoding:
                            NSASCIIStringEncoding];
    NSLog(@"%@",encodedUrl);
    NSURL *url = [NSURL URLWithString:encodedUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLConnection *connnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    [connnection start];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickSignup:(id)sender{
   
    tag=1;
    if(fldShadowName.text.length==0){
        UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:@"Please Enter Your ShadowName" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [SuccessAlert show];
        
    }
    else if(fldPassword.text.length==0){
        UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:@"Please Enter Your ShadowName" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [SuccessAlert show];
        
    }
    
    else if([_lblUniversity.text isEqualToString:@"University"]){
        UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:@"Please chosse your University" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [SuccessAlert show];
        
    }

   
    else if(fldEmail.text.length ==0){
        UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:@"Please Enter Your ShadowName" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [SuccessAlert show];
        
    }
    
        else if(!fldEmail.text.length ==0){
        NSString *email1 = fldEmail.text;
        NSString *emailRegEx =
        @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
        @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
        
        NSPredicate *regExPredicate =
        [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:email1];
        
        
        if(!myStringMatchesRegEx)
        {
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Shadow"
                                                                  message:@"Your Email Id Is Wrong"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            [myAlertView show];
            
            
        }
        else{
            [self SignUp];
            
        }
        
    }

}
-(void)SignUp{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.labelText = @"Shadow";
    HUD.detailsLabelText = @"Loding...";
    HUD.mode = MBProgressHUDModeIndeterminate;
    [HUD show:YES];
    [self.view addSubview:HUD];
    
    
    
    NSString *urlString=[[NSString alloc]initWithString:[NSString stringWithFormat:@"%@&shadowname=%@&university_id=%@&password=%@&email=%@",KRegistration,fldShadowName.text,getUniversityid,fldPassword.text,fldEmail.text]];
   
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
        NSLog(@"%d",tag);
        // [loginbtn setEnabled:YES];
        if(tag==1){
        NSString *str1 = [[NSString alloc]initWithData:nsUrlResponseData encoding:NSUTF8StringEncoding];
        allData = [str1 JSONValue];
        NSLog(@"allData==%@",allData);
        NSString *getMessage =[allData valueForKey:@"message"];
        NSLog(@"%@",getMessage);
        if([getMessage isEqualToString:@"Account added successfully."]){
            UIAlertView *SuccessAlert = [[UIAlertView alloc]initWithTitle:@"Shadow" message:@"Welcome to Shadow" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [SuccessAlert show];
             LandingViewController *signin =[[LandingViewController alloc]initWithNibName:@"LandingViewController" bundle:nil];
             [self.navigationController pushViewController:signin animated:YES];
        }
        else{
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Shadow" message:getMessage delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
            
            [alert show];
            
        }
        }
        else{
           
            NSString *str1 = [[NSString alloc]initWithData:nsUrlResponseData encoding:NSUTF8StringEncoding];
            allData = [str1 JSONValue];
            NSLog(@"allData==%@",allData);
            NSString *getMessage =[allData valueForKey:@"message"];
            NSLog(@"%@",getMessage);
            if([getMessage isEqualToString:@"succesfully get message"]){
                tblUniversitry.hidden=NO;
                imgtblHeader.hidden=NO;
                btnCross.hidden=NO;
                universityData =[allData valueForKey:@"data"];
                NSLog(@"%@",universityData);
                [tblUniversitry reloadData];
                
            }
            else{
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Shadow" message:getMessage delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil,nil];
                
                [alert show];
                
            }
                }
        }
        
    }

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    if ([string isEqualToString:@"@"]) {
        
         NSLog(@"%ld",getindex);
       
        
        NSString *getDomain =[[universityData valueForKey:@"university_email_suffix"]objectAtIndex:getindex];
        NSLog(@"%@",getDomain);
         NSLog(@"%@",fldEmail.text);
        NSString *combined = [NSString stringWithFormat:@"%@%s%@", fldEmail.text,"@", getDomain];
        NSLog(@"%@",combined);
        fldEmail.text =combined;
        NSLog(@"%@",fldEmail.text);
        
        
        return NO;
    }
    else {
        return YES;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [universityData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    
    long indexValue =indexPath.row;
    NSLog(@"%ld",indexValue);
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellSelectionStyleNone
                                      reuseIdentifier:MyIdentifier];
    }
   // cell.backgroundColor=[UIColor clearColor];
    UILabel *NameLbl = [[UILabel alloc] initWithFrame:CGRectMake(15,10,300,35)];
    NameLbl.font = [UIFont fontWithName:@"futura" size:17];
    NameLbl.tag=102;
    NameLbl.textColor = [UIColor grayColor];
    NameLbl.backgroundColor = [UIColor clearColor];
    NameLbl.text=[[universityData valueForKey:@"university_name"]objectAtIndex:indexPath.row];
    [cell.contentView addSubview:NameLbl];
    return cell;
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
    
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _lblUniversity.text =[[universityData valueForKey:@"university_name"]objectAtIndex:indexPath.row];
  getUniversityid =     [[universityData valueForKey:@"university_id"]objectAtIndex:indexPath.row];
    NSLog(@"%@",getUniversityid);
    getindex =indexPath.row;
    NSLog(@"%ld",getindex);
    
    tblUniversitry.hidden=YES;
    imgtblHeader.hidden=YES;
    btnCross.hidden=YES;
}
-(IBAction)clickCross:(id)sender{
    tblUniversitry.hidden=YES;
    imgtblHeader.hidden=YES;
     btnCross.hidden=YES;
}



@end

//
//  PostEventDetailViewController.m
//  Shadow
//
//  Created by Test on 15/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "PostEventDetailViewController.h"
#import "ChooseTagViewController.h"

@interface PostEventDetailViewController ()

@end

@implementation PostEventDetailViewController
@synthesize lblDate,lblEmail,lblTime,fldAddress,fldDescription,fldVenue,getImage;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",getImage);
    [self getLoginStatus];
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc]
                                             
                                             
                                             
                                             initWithTarget: self
                                             
                                             
                                             
                                             action: @selector(hideKeyboard:)];
    
    [oneTapGesture setNumberOfTouchesRequired:1];
    [[self view] addGestureRecognizer:oneTapGesture];

    // Do any additional setup after loading the view from its nib.
}

-(void)getLoginStatus{
    NSUserDefaults *titleStorage = [NSUserDefaults standardUserDefaults];
    //loginStatus = [titleStorage objectForKey:@"LoginStatus"];
    user_id = [titleStorage objectForKey:@"U_id"];
    getEmail = [titleStorage objectForKey:@"Email_id"];
    NSLog(@"%@",getEmail);
    NSLog(@"%@",user_id);
    lblEmail.text =getEmail;
    
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
    [fldAddress resignFirstResponder];
    [fldDescription resignFirstResponder];
    
    
    
}
- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    [self keyboardWillShow];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [fldVenue resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        // txtAdd.text = @"Pet's Address";
        [self keyboardDidHide];
        [fldAddress resignFirstResponder];
         [fldDescription resignFirstResponder];
        return NO;
    }
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickDate:(id)sender{
    tag=1;
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 190, 320, 300)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.hidden = NO;
    datePicker.backgroundColor =[UIColor whiteColor];
    datePicker.date = [NSDate date];
    
    [datePicker addTarget:self
                   action:@selector(LabelChange:)
         forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    
    topImage =[[UIImageView alloc] initWithFrame:CGRectMake(0,150,320,50)];
    topImage.image=[UIImage imageNamed:@"footer_bg.png"];
    [self.view addSubview:topImage];
    
    NewbtnCancel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    NewbtnCancel.frame = CGRectMake(5,160,100,25);
    [NewbtnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    NewbtnCancel.backgroundColor = [UIColor clearColor];
    NewbtnCancel.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    [NewbtnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [NewbtnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [NewbtnCancel addTarget:self action:@selector(cancelNumberPad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:NewbtnCancel];
    
    newbtnDone = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    newbtnDone.frame = CGRectMake(250,160,60,25);
    [newbtnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    newbtnDone.backgroundColor = [UIColor clearColor];
    newbtnDone.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    [newbtnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [newbtnDone setTitle:@"Done" forState:UIControlStateNormal];
    
    [newbtnDone addTarget:self action:@selector(doneWithNumberPad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newbtnDone];
 
}
-(void)cancelNumberPad{
    
  
   
    [topImage removeFromSuperview];
    [datePicker removeFromSuperview];
    [NewbtnCancel removeFromSuperview];
    [newbtnDone removeFromSuperview];
}

-(void)doneWithNumberPad{
    if(tag==1){
   
    
    [topImage removeFromSuperview];
    [datePicker removeFromSuperview];
    [NewbtnCancel removeFromSuperview];
    [newbtnDone removeFromSuperview];
    }
    else{
      
        
        [topImage removeFromSuperview];
        [timePicker removeFromSuperview];
        [NewbtnCancel removeFromSuperview];
        [newbtnDone removeFromSuperview];
    }
    
}
- (void)LabelChange:(id)sender{
    if(tag==1){

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    lblDate.text = [NSString stringWithFormat:@"%@",
                      [df stringFromDate:datePicker.date]];
    NSLog(@"%@",lblDate.text);
    }
    else{
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"hh:mm a"];

       // df.timeStyle = NSTimeZoneNameStyleStandard;
      NSString *getString  = [NSString stringWithFormat:@"%@",
         [df stringFromDate:timePicker.date]];
        NSLog(@"%@",getString);
        
        lblTime.text = [NSString stringWithFormat:@"%@",
                        [df stringFromDate:timePicker.date]];
        NSLog(@"%@",lblTime.text);
    }
}
-(IBAction)clickTime:(id)sender{
    tag=2;
    timePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 220, 320, 300)];
    timePicker.datePickerMode = UIDatePickerModeTime;
    timePicker.hidden = NO;
    timePicker.backgroundColor =[UIColor whiteColor];
    timePicker.date = [NSDate date];
    
    [timePicker addTarget:self
                   action:@selector(LabelChange:)
         forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:timePicker];
    
    topImage =[[UIImageView alloc] initWithFrame:CGRectMake(0,180,320,50)];
    topImage.image=[UIImage imageNamed:@"footer_bg.png"];
    [self.view addSubview:topImage];
    
    NewbtnCancel = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    NewbtnCancel.frame = CGRectMake(5,190,100,25);
    [NewbtnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    NewbtnCancel.backgroundColor = [UIColor clearColor];
    NewbtnCancel.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    [NewbtnCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [NewbtnCancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [NewbtnCancel addTarget:self action:@selector(cancelNumberPad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:NewbtnCancel];
    
    newbtnDone = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    newbtnDone.frame = CGRectMake(250,190,60,25);
    [newbtnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    newbtnDone.backgroundColor = [UIColor clearColor];
    newbtnDone.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    [newbtnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [newbtnDone setTitle:@"Done" forState:UIControlStateNormal];
    
    [newbtnDone addTarget:self action:@selector(doneWithNumberPad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newbtnDone];
}


-(IBAction)clickNext:(id)sender{
    
    if([lblDate.text isEqualToString:@"Choose Event Date"]){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                          message:@"Please Chosse Event Date"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        
    }
    else if([lblTime.text isEqualToString:@"Choose Event Time"]){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                          message:@"Please Chosse Event Time"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        
    }
    else if(fldVenue.text.length ==0){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                          message:@"Please  Enter Venue of Event"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];

        
    }
    else if(fldAddress.text.length ==0){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                          message:@"Please  Enter Address of Event"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        
    }
    else if(fldDescription.text.length==0){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"SHADOW"
                                                          message:@"Please  Enter Description of Event"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        
    }
    
    else{
    ChooseTagViewController *chosse =[[ChooseTagViewController alloc]initWithNibName:@"ChooseTagViewController" bundle:nil];
    chosse.strAddress =fldAddress.text;
    chosse.strDescription= fldDescription.text;
    chosse.strVenue =fldVenue.text;
    chosse.strEmail =lblEmail.text;
    chosse.strTime =lblTime.text;
    chosse.strdate =lblDate.text;
    chosse.getImage= getImage;
    [self.navigationController pushViewController:chosse animated:YES];
    }
}
-(IBAction)clickBack:(id)sender{
     [self.navigationController popViewControllerAnimated:YES];
    
}

@end

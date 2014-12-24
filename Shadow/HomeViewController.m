//
//  HomeViewController.m
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "HomeViewController.h"
#import "SignUpViewController.h"
#import "SignInViewController.h"
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize imgLogo,imgtextLogo;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getLayout];
    // Do any additional setup after loading the view from its nib.
}
-(void)getLayout{
    if(IS_IPHONE5){
        imgLogo.frame =CGRectMake(90,99,135,121);
        imgtextLogo.frame =CGRectMake(94,253,138,27);
    }
    else{
        
    }
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
}
-(IBAction)clickSignIn:(id)sender{
    SignInViewController *signin =[[SignInViewController alloc]initWithNibName:@"SignInViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];
    
}
-(IBAction)clickSignUp:(id)sender{
    SignUpViewController *signin =[[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

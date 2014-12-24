//
//  PostEventViewController.m
//  Shadow
//
//  Created by Test on 15/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "PostEventViewController.h"
#import "PostEventDetailViewController.h"

@interface PostEventViewController ()

@end

@implementation PostEventViewController
@synthesize imgEvent,getImage;

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"%@",getImage);
    imgEvent.image = getImage;
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)clickNext:(id)sender{
    PostEventDetailViewController *post =[[PostEventDetailViewController alloc]initWithNibName:@"PostEventDetailViewController" bundle:nil];
    post.getImage= getImage;

    [self.navigationController pushViewController:post animated:YES];
    
}
-(IBAction)clickBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

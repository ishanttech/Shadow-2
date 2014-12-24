//
//  LandingViewController.m
//  Shadow
//
//  Created by Test on 24/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "LandingViewController.h"
#import "SelectCityViewController.h"
#import "UniversityViewController.h"
#import "MenuViewController.h"
#import "AddPostViewController.h"
#import "EventViewController.h"
#import "MBProgressHUD.h"
#import "AsyncImageView.h"
#import "File.h"
#import "JSON.h"
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)

@interface LandingViewController ()

@end

@implementation LandingViewController
@synthesize _collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
     nsUrlResponseData =[[NSMutableData alloc]init];
    [self GetPost];
    
    //[self imageoncollection];
    // Do any additional setup after loading the view from its nib.
}
-(void)GetPost{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    HUD.labelText = @"Shadow";
    HUD.detailsLabelText = @"Loding...";
    HUD.mode = MBProgressHUDModeIndeterminate;
    [HUD show:YES];
    [self.view addSubview:HUD];
    
    
    
    NSString *urlString=[[NSString alloc]initWithString:[NSString stringWithFormat:@"%@&post_type=event",KgetPost]];
    
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
       
        NSString *getMassage =[allData valueForKey:@"message"];
        NSLog(@"%@",getMassage);
        if([getMassage isEqualToString:@"succesfully get post"]){
            getData =[allData valueForKey:@"data"];
            NSLog(@"%@",getData);
            getUrl = [allData valueForKey:@"base_url"];
            NSLog(@"%@",getUrl);
            [self imageoncollection];
            
        }
    }
}
-(void)imageoncollection
{
    if(IS_IPHONE5){
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(3, 102, 312, 500) collectionViewLayout:layout];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        
        [self.view addSubview:_collectionView];
    }
    else{
        
   
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(3, 102, 312, 400) collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:_collectionView];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return getData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    long indexValue =indexPath.row;
    NSLog(@"%ld",indexValue);
    
   
    
    NSString *getFilePath =[[getData valueForKey:@"file_path"]objectAtIndex:indexPath.row];
    NSLog(@"%@",getFilePath);
    
    NSString *getImage =[[getData valueForKey:@"image"]objectAtIndex:indexPath.row];
    NSLog(@"%@",getImage);
    
   NSString *combined = [NSString stringWithFormat:@"%@%@%@%@",getUrl,getFilePath,@"/",getImage];
    NSLog(@"%@",combined);
                         
    
    
    AsyncImageView *async = [[AsyncImageView alloc]initWithFrame:CGRectMake(0,0,102,102)];
   // [async loadImageFromURL:[NSURL URLWithString:combined]];
    async.imageURL = [NSURL URLWithString:combined];
    [cell.contentView addSubview:async];
        
  
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
            return CGSizeMake(97, 97);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    EventViewController *signin =[[EventViewController alloc]initWithNibName:@"EventViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickRecent:(id)sender{
    
}
-(IBAction)clickFeatured:(id)sender{
    
}
-(IBAction)clickTags:(id)sender{
    UniversityViewController *signin =[[UniversityViewController alloc]initWithNibName:@"UniversityViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];
    
    
}
-(IBAction)clickUniversity:(id)sender{
    SelectCityViewController *signin =[[SelectCityViewController alloc]initWithNibName:@"SelectCityViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];
    
}
-(IBAction)clickMenu:(id)sender{
    MenuViewController *signin =[[MenuViewController alloc]initWithNibName:@"MenuViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];
    
}
-(IBAction)clickAddEvents:(id)sender{
    AddPostViewController *signin =[[AddPostViewController alloc]initWithNibName:@"AddPostViewController" bundle:nil];
    [self.navigationController pushViewController:signin animated:YES];
    
}
-(IBAction)clickGridView:(id)sender{
    
}
-(IBAction)clickTableView:(id)sender{
    
}



@end

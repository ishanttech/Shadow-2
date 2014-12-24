//
//  ProfileViewController.m
//  Shadow
//
//  Created by Test on 06/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "ProfileViewController.h"
#import "EditViewController.h"


@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize _collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    recipeImages = [NSArray arrayWithObjects:@"pic_1.png", @"pic_2.png", @"pic_3.png", @"pic_4.png", @"pic_5.png", @"pic_6.png", @"pic_7.png", @"pic_8.png", nil];
    [self imageoncollection];
    // Do any additional setup after loading the view from its nib.
}
-(void)imageoncollection
{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 170, 320, 400) collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:_collectionView];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return recipeImages.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    long indexValue =indexPath.row;
    NSLog(@"%ld",indexValue);
    
    UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(5,5,95,95)];
    dot.image=[UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:dot];
    
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)clickGridView:(id)sender{
    
}
-(IBAction)clickTableView:(id)sender{
    
}
-(IBAction)clickAddPost:(id)sender{
    
}
-(IBAction)clickMenu:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(IBAction)clickeditProfile:(id)sender{
    EditViewController *edit =[[EditViewController alloc]initWithNibName:@"EditViewController" bundle:nil];
    [self.navigationController pushViewController:edit animated:YES];
    
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

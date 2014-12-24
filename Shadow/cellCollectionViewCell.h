//
//  cellCollectionViewCell.h
//  iPhoneSample
//
//  Created by Sachin Soni on 16/12/14.
//  Copyright (c) 2014 Sachin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellCollectionViewCell : UICollectionViewCell

@property (strong) IBOutlet UIButton *btn;
-(IBAction)selectCell:(id)sender;
@end

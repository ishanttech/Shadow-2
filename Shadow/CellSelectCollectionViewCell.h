//
//  CellSelectCollectionViewCell.h
//  Shadow
//
//  Created by Test on 18/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellSelectCollectionViewCell : UICollectionViewCell


@property (weak) IBOutlet UIButton *btn;
-(IBAction)selectCell:(id)sender;

@end

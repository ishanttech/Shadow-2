//
//  GetCityServices.h
//  Shadow
//
//  Created by Test on 16/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetCityServices : NSObject

+(GetCityServices *)sharedInstance;
-(NSMutableArray*)getWebData;

@end

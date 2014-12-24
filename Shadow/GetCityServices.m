//
//  GetCityServices.m
//  Shadow
//
//  Created by Test on 16/12/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "GetCityServices.h"

static GetCityServices *getCityServiceCallObject;
@implementation GetCityServices

+(GetCityServices*)sharedInstance{
    if(!getCityServiceCallObject){
        getCityServiceCallObject = [[GetCityServices alloc] init];
    }
    return getCityServiceCallObject;
}
-(NSMutableArray*)getWebData{
    
    NSString *StringGETMETHOD = @"http://techwatts.com/shadowapp/api/univMgmt/citylist?";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setURL:[NSURL URLWithString:StringGETMETHOD]];
    [request setHTTPMethod:@"POST"];
    NSURLResponse *response;
    NSError *error;
    NSData *aData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"aData=%@",aData);
    if (aData) {
        NSDictionary *jsonReturn=(NSDictionary*)[NSJSONSerialization JSONObjectWithData:aData options:kNilOptions error:&error];
        NSLog(@"jsonReturn %@",jsonReturn[@"data"]);
        if(jsonReturn[@"data"])
            return jsonReturn[@"data"];
    }
    return nil;
}





@end

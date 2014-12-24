//
//  ServiceCall.m
//  WebserviceSample
//
//

#import "ServiceCall.h"

static ServiceCall *serviceCallObject;
@implementation ServiceCall

+(ServiceCall*)sharedInstance{
    if(!serviceCallObject){
        serviceCallObject = [[ServiceCall alloc] init];
    }
    return serviceCallObject;
}
-(NSMutableArray*)getWebData{
    
    NSString *StringGETMETHOD = @"http://techwatts.com/shadowapp/api/post/get_tags?";
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

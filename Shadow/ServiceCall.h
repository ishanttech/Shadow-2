//
//  ServiceCall.h
//  WebserviceSample
//
//

#import <Foundation/Foundation.h>

@interface ServiceCall : NSObject
+(ServiceCall*)sharedInstance;
-(NSMutableArray*)getWebData;
@end

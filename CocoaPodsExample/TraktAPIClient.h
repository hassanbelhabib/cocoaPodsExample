//
//  TraktAPIClient.h
//  
//
//  Created by Hassan BelHabib Filali on 1/31/14.
//
//

#import <Foundation/Foundation.h>
#import <AFHTTPClient.h>

extern NSString * const kTraktAPIKey;
extern NSString * const kTraktBaseURLString;


@interface TraktAPIClient : AFHTTPClient

+ (TraktAPIClient *)sharedClient;

@end

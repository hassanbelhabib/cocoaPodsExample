//
//  TraktAPIClient.m
//  
//
//  Created by Hassan BelHabib Filali on 1/31/14.
//
//

#import "TraktAPIClient.h"
#import <AFJSONRequestOperation.h>

NSString * const kTraktAPIKey = @"fc3df235908f83107cedd7914950d7a0";
NSString * const kTraktBaseURLString = @"http://api.trakt.tv";

@implementation TraktAPIClient

+(TraktAPIClient *) sharedClient {
    static TraktAPIClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kTraktBaseURLString]];
    });
    return _sharedClient;
}

-(id) initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    self.parameterEncoding = AFJSONParameterEncoding;
    return self;
}
@end

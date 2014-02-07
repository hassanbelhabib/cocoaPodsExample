//
//  ViewController.m
//  CocoaPodsExample
//
//  Created by Hassan BelHabib Filali on 1/31/14.
//  Copyright (c) 2014 com.hassan.tt. All rights reserved.
//

#import "ViewController.h"
#import "TraktAPIClient.h"
#import <AFNetworking.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *showsScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *showsPageControl;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.showsScrollView.delegate = self;
 
    // 1 - Create trakt API client
    TraktAPIClient* client = [TraktAPIClient sharedClient];
    // 2 - Create date instance with today's date
    NSDate* today = [NSDate date];
    // 3 - Create date formatter
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMdd";
    NSString* todayString = [formatter stringFromDate:today];
    // 4 - Create API query request
    NSString* path = [NSString stringWithFormat:@"user/calendar/shows.json/%@/%@/%@/%d", kTraktAPIKey, @"marcelofabri", todayString, 3];
    NSURLRequest* request = [client requestWithMethod:@"GET" path:path parameters:nil];
    // 5 - Create JSON request operation
    AFJSONRequestOperation* operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        // 6 - Request succeeded block
        NSLog(@"%@", JSON);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // 7 - Request failed block
    }];
    // 8 - Start request
    [operation start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pageChanged:(id)sender {
}

@end

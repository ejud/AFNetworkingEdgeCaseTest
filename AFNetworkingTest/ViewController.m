//
//  ViewController.m
//  AFNetworkingTest
//
//  Created by Ethan Jud on 11/4/15.
//  Copyright © 2015 8tracks, Inc. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setupSessionManager];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupSessionManager];
    }
    return self;
}

- (void)setupSessionManager
{
    self.sessionManager = [AFHTTPSessionManager manager];

    __weak typeof(self) weakSelf = self;
    [self.sessionManager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability status changed: %@", AFStringFromNetworkReachabilityStatus(status));

        weakSelf.textView.text = [weakSelf.textView.text stringByAppendingFormat:@"Reachability status changed: %@\n", AFStringFromNetworkReachabilityStatus(status)];
    }];
    [self.sessionManager.reachabilityManager startMonitoring];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

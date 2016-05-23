//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Steven Liu on 2016-05-21.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController
-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno"];
    }
    
    return self;
}

// Setting up the view programatically
-(void)loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = backgroundView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Steven Liu on 2016-05-21.
//  Copyright © 2016 Steven Liu. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@property (nonatomic, strong) BNRHypnosisView *backgroundView;
@property (nonatomic, strong) UISegmentedControl *segControl;

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
    self.backgroundView = [[BNRHypnosisView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.backgroundView;
    
    CGPoint center;
    center.x = self.view.bounds.origin.x + self.view.bounds.size.width / 2.0;
    center.y = self.view.bounds.origin.y + self.view.bounds.size.height / 2.0;
    
    self.segControl = [[UISegmentedControl alloc] initWithItems:@[@"red", @"green", @"blue"]];
    self.segControl.frame = CGRectMake(center.x-75, 20, 150, 25);
    [self.view addSubview:self.segControl];
    
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(center.x-120, 70, 240, 30);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize Me!";
    textField.returnKeyType = UIReturnKeyDone;
    
    textField.delegate = self;
    
    [self.view addSubview:textField];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.segControl addTarget:self action:@selector(changeCircleColor:) forControlEvents:UIControlEventValueChanged];

    // Do any additional setup after loading the view.
}

- (void)changeCircleColor:(UISegmentedControl *)segment {
    switch (segment.selectedSegmentIndex) {
        case 0:
            self.backgroundView.circleColor = [UIColor redColor];
            break;
        case 1:
            self.backgroundView.circleColor = [UIColor greenColor];
            break;
        case 2:
            self.backgroundView.circleColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@",textField.text);
    [textField resignFirstResponder];
    return YES;
}


@end

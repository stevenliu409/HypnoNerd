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
    // NSLog(@"%@",textField.text);
    [self drawHypnoticMessage:textField.text];
    [textField resignFirstResponder];
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for(int i=0; i < 20; i++){
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit];
        
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random() % width; // this will be any number in the range from 0 to width
        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random() % height; // this will be any number in the range from 0 to height
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                                                                    type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                                       type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @-25;
        motionEffect.maximumRelativeValue = @25;
        [messageLabel addMotionEffect:motionEffect];
    }
    
}


@end

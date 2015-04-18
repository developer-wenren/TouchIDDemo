//
//  ViewController.m
//  TouchIDDemo
//
//  Created by zjsruxxxy3 on 15/4/18.
//  Copyright (c) 2015年 WR. All rights reserved.
//

#import "ViewController.h"

@import LocalAuthentication;


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addButtonStartTouchID];
}

-(void)addButtonStartTouchID
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 60)];
    button.center = CGPointMake(160, 200);
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"touchID" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(touchID) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
    
    
}

-(void)touchID
{
    LAContext *laContext = [[LAContext alloc]init];
    
    laContext.localizedFallbackTitle = @"";
    
    NSError *error2 = [[NSError alloc]init];
    
    if ([laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error2])
    {
        [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"哈哈" reply:^(BOOL success, NSError *error) {
            
            if (!error)
            {
                NSLog(@"success");
                
            }else
            {
                NSLog(@"%@",error);
                
            }
            
        }];
        
        
    }else
    {
        NSLog(@"%@",[error2 description]);
    }
}

@end

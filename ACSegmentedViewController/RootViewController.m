//
//  RootViewController.m
//  ACSegmentedViewController
//
//  Created by Albert Chu on 14/8/19.
//  Copyright (c) 2014年 AC. All rights reserved.
//

#import "RootViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface RootViewController ()

@end


@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *viewControllersArray =
    @[
      [[FirstViewController alloc] initWithNibName:nil bundle:nil],
      [[SecondViewController alloc] initWithNibName:nil bundle:nil],
      [[ThirdViewController alloc] initWithNibName:nil bundle:nil]
      ];
    
    [self configWithViewControllers:viewControllersArray];
    
    self.segmentWidth = 280.f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ACSegmentedViewController.h
//  ACSegmentedViewController
//
//  Created by Albert Chu on 14/8/19.
//  Copyright (c) 2014年 AC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACSegmentedViewController : UIViewController

@property (nonatomic, assign) CGFloat segmentWidth;

- (void)configWithViewControllers:(NSArray *)viewControllersArray;
- (void)configWithViewControllers:(NSArray *)viewControllersArray titles:(NSArray *)titlesArray;

@end

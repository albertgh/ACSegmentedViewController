//
//  ACSegmentedViewController.m
//  ACSegmentedViewController
//
//  Created by Albert Chu on 14/8/19.
//  Copyright (c) 2014年 AC. All rights reserved.
//

#import "ACSegmentedViewController.h"

@interface ACSegmentedViewController ()

@property (nonatomic, retain) UISegmentedControl        *segmentedControl;
@property (nonatomic, retain) UIViewController          *currentViewController;
@property (nonatomic, assign) NSInteger                 currentIndex;

@end

@implementation ACSegmentedViewController

#pragma mark - Public

- (void)configWithViewControllers:(NSArray *)viewControllersArray
{
    [self acsvc_addChildViewControllers:viewControllersArray];
    
    NSMutableArray *titlesMArray = [[NSMutableArray alloc] initWithCapacity:1];
    for (UIViewController *controller in viewControllersArray)
    {
        [titlesMArray addObject:controller.title];
    }
    [self acsvc_addSegmentTitles:titlesMArray];
    
    [self showFirstViewController:viewControllersArray[0]];
}

- (void)configWithViewControllers:(NSArray *)viewControllersArray titles:(NSArray *)titlesArray
{
    [self acsvc_addChildViewControllers:viewControllersArray];
    
    [self acsvc_addSegmentTitles:titlesArray];
    
    [self showFirstViewController:viewControllersArray[0]];
}

#pragma mark - Private

- (void)acsvc_addChildViewControllers:(NSArray *)childViewControllersArray
{
    for (UIViewController *viewController in childViewControllersArray)
    {
        viewController.view.frame = self.view.bounds;
        [self addChildViewController:viewController];
    }
}

- (void)acsvc_addSegmentTitles:(NSArray *)titlesArray
{
    for (NSString *title in titlesArray)
    {
        [self.segmentedControl insertSegmentWithTitle:title
                                              atIndex:self.segmentedControl.numberOfSegments
                                             animated:NO];
        [self.segmentedControl sizeToFit];
    }
    
    if (self.segmentWidth > 0.0f)
    {
        self.segmentedControl.frame = CGRectMake(0, 0, self.segmentWidth, 29.0f);
        self.segmentedControl.center = self.navigationItem.titleView.center;
    }
}

- (void)showFirstViewController:(UIViewController *)viewcontroller
{
    self.segmentedControl.selectedSegmentIndex = 0;
    self.currentIndex = 0;
    [self.view addSubview:viewcontroller.view];
}

- (void)setSegmentWidth:(CGFloat)segmentWidth
{
    _segmentWidth = segmentWidth;
    self.segmentedControl.frame = CGRectMake(0, 0, segmentWidth, 29.0f);
    self.segmentedControl.center = self.navigationItem.titleView.center;
}

#pragma mark - Aciton

- (void)segmentedControlSelected:(UISegmentedControl *)sender
{
    if (self.currentIndex != sender.selectedSegmentIndex)
    {
        [self transitionFromOldIndex:self.currentIndex toNewIndex:sender.selectedSegmentIndex];
    }
}

- (void)transitionFromOldIndex:(NSInteger)oldIndex toNewIndex:(NSInteger)newIndex
{
    UIViewController *oldViewController = self.childViewControllers[oldIndex];
    UIViewController *newViewController = self.childViewControllers[newIndex];
    
    [self transitionFromViewController:oldViewController
                      toViewController:newViewController
                              duration:0.0f
                               options:UIViewAnimationOptionTransitionNone
                            animations:nil
                            completion:^(BOOL finished) {
                                self.currentViewController = newViewController;
                                self.currentIndex = newIndex;
    }];
}

#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.segmentedControl.selectedSegmentIndex = 0;
        self.currentIndex = 0;
        self.segmentWidth = -1.0f;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.segmentedControl = [[UISegmentedControl alloc] init];
    self.navigationItem.titleView = self.segmentedControl;
    [self.segmentedControl addTarget:self
                              action:@selector(segmentedControlSelected:)
                    forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

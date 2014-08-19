## ACSegmentedViewController

A Segmented ViewController

<img src="https://github.com/albertgh/ACSSegmentedViewController/raw/master/screenshot.gif"/>


## Installing

Drag **ACSegmentedViewController** folder into your project. 
	
    
## Usage

Inherit  **`ACSegmentedViewController`**

```objc
NSArray *viewControllersArray =
@[
  [[FirstViewController alloc] initWithNibName:nil bundle:nil],
  [[SecondViewController alloc] initWithNibName:nil bundle:nil],
  [[ThirdViewController alloc] initWithNibName:nil bundle:nil]
  ];
    
[self configWithViewControllers:viewControllersArray];
```
This will set each segment's title by your viewController's title. If you want to have different titles. Use another method.

```objc
- (void)configWithViewControllers:(NSArray *)viewControllersArray titles:(NSArray *)titlesArray;
```

The segmentedControl on navBar will auto fit size by characters. If your title is too short, that will makes segmentedControl too small. You can just make it your own size in your subclass.

```objc
self.segmentWidth = 280.f;
```

#### License

######WTFPL 



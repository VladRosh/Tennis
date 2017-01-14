//
//  AnotherViewController.h
//  ControlsHomeTask
//
//  Created by VLAD on 12/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnotherViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *canvas;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableArray* switchState;
@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)imageSwitcher:(id)sender;
- (IBAction)speedSlider:(id)sender;
- (IBAction)animationSwitcher:(id)sender;

@end

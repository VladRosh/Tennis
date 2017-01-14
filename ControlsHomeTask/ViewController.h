//
//  ViewController.h
//  ControlsHomeTask
//
//  Created by VLAD on 12/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *fieldView;
@property (weak, nonatomic) IBOutlet UIImageView *playerOneView;
@property (weak, nonatomic) IBOutlet UIImageView *playerTwoView;
@property (weak, nonatomic) IBOutlet UIImageView *ballView;
@property (weak, nonatomic) IBOutlet UISlider *heightSlider;
@property (weak, nonatomic) IBOutlet UISlider *powerSlider;

@property (weak, nonatomic) IBOutlet UISegmentedControl *ballTypeControl;
@property (weak, nonatomic) IBOutlet UISwitch *startSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rotateSwitch;

- (IBAction)ballTypeChangedValue:(UISegmentedControl *)sender;
- (IBAction)startAction:(UISwitch *)sender;
- (IBAction)powerSliderValueChanged:(UISlider *)sender;
- (IBAction)heightSliderValueChanged:(UISlider *)sender;




@end


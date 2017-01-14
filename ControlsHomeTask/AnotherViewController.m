//
//  AnotherViewController.m
//  ControlsHomeTask
//
//  Created by VLAD on 12/01/2017.
//  Copyright © 2017 Vlad. All rights reserved.
//

#import "AnotherViewController.h"

@interface AnotherViewController ()

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.canvas.frame) - 50, CGRectGetMidY(self.canvas.frame) - 50, 100, 100)];
    
    self.imageView = imgView;
    
    self.imageView.image = [UIImage imageNamed:@"1.png"];
    
    [self.canvas addSubview:self.imageView];
    
    self.switchState = [[NSMutableArray alloc]init];
    [self.switchState addObject:[NSString stringWithFormat:@"NO"]];
    [self.switchState addObject:[NSString stringWithFormat:@"NO"]];
    [self.switchState addObject:[NSString stringWithFormat:@"NO"]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)imageSwitcher:(id)sender {
    
    UISegmentedControl* sg = sender;
    
    NSLog(@"%ld", (long)sg.selectedSegmentIndex);
    self.imageView.image = nil;
    switch (sg.selectedSegmentIndex) {
        case 0:
            self.imageView.image = [UIImage imageNamed:@"1.png"];
            break;
        case 1:
            self.imageView.image = [UIImage imageNamed:@"2.png"];
            break;
        case 2:
            self.imageView.image = [UIImage imageNamed:@"3.png"];
            break;
        default:
            break;
    }
    
    
}

- (IBAction)speedSlider:(id)sender {
    
    [self startAnimationWithData:nil];
}

- (IBAction)animationSwitcher:(id)sender {
    
    
    UISwitch *sw = sender;
    switch (sw.tag) {
        case 1:
            if ([[self.switchState objectAtIndex:0] isEqualToString:@"NO"]) {
                [self.switchState replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"YES"]];
            } else {
                [self.switchState replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"NO"]];
            }
            break;
        case 2:
            if ([[self.switchState objectAtIndex:1] isEqualToString:@"NO"]) {
                [self.switchState replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"YES"]];
            } else {
                [self.switchState replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"NO"]];
            }
            break;
        case 3:
            if ([[self.switchState objectAtIndex:2] isEqualToString:@"NO"]) {
                [self.switchState replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"YES"]];
            } else {
                [self.switchState replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"NO"]];
            }
            break;
        default:
            break;
    }
    NSLog(@"%@",[self.switchState objectAtIndex:0]);
    
    [self startAnimationWithData:self.switchState];
    

    
}

- (void)startAnimationWithData:(NSMutableArray *)data {
    
    CGPoint point = CGPointMake(CGRectGetMidX([[self.imageView.layer presentationLayer] frame]), CGRectGetMidY([[self.imageView.layer presentationLayer] frame]));
    self.imageView.center = point;
    
    CGPoint startPoint = CGPointMake(50, 50);
    CGPoint endPoint = CGPointMake(250, 200);
    
    [UIView animateWithDuration:1
                     animations:^{
                         
                         if ([[self.switchState objectAtIndex:0] isEqualToString:@"YES"]) {
                             self.imageView.center = startPoint;
                         }
                         
                         
                     } completion:^(BOOL finished) {
                         
                         CABasicAnimation* rotationAnimation;
                         rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
                         rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2];
                         rotationAnimation.duration = self.slider.value;
                         rotationAnimation.repeatCount = HUGE_VALF;
                         
                         CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
                         scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
                         scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
                         scaleAnimation.repeatCount = HUGE_VAL;
                         scaleAnimation.duration = self.slider.value;
                         scaleAnimation.autoreverses = YES;
                         
                         CABasicAnimation * baseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
                         baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                         baseAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
                         baseAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
                         baseAnimation.duration = self.slider.value;
                         
                         
                         CABasicAnimation * boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
                         
                         boundsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                         boundsAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
                         boundsAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
                         boundsAnimation.duration = self.slider.value;
                         
                         CAAnimationGroup * group =[CAAnimationGroup animation];
                         group.animations =[NSArray arrayWithObjects:baseAnimation, boundsAnimation, nil];
                         group.duration = self.slider.value;
                         group.autoreverses = YES;
                         group.repeatCount = HUGE_VAL;
                         
                         if ([[self.switchState objectAtIndex:0] isEqualToString:@"YES"]) {
                             [self.imageView.layer addAnimation:group forKey:@"frame"];
                         } else {
                             [self.imageView.layer removeAnimationForKey:@"frame"];
                         }
                         if ([[self.switchState objectAtIndex:1] isEqualToString:@"YES"]) {
                             [self.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
                         } else {
                             [self.imageView.layer removeAnimationForKey:@"rotationAnimation"];
                         }
                         if ([[self.switchState objectAtIndex:2] isEqualToString:@"YES"]) {
                             [self.imageView.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
                         } else {
                             [self.imageView.layer removeAnimationForKey:@"scaleAnimation"];
                         }
                         
                     }];
}


@end

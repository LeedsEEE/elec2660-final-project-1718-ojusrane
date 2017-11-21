//
//  FirstViewController.h
//  MultipleStopwatchTimer
//
//  Created by Ojus Rane [el16or] on 21/11/2017.
//  Copyright © 2017 Ojus Rane [el16or]. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StopwatchViewController : UIViewController

//Stopwatch 1

{
    NSTimer *StopwatchOne;
    int CountStopwatchone;
    BOOL RunningStopwatchOne;
}

@property (weak, nonatomic) IBOutlet UILabel *StopwatchLabelOne;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonOne;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonOne;
- (IBAction)StartButtonOnePressed:(UIButton *)sender;
- (IBAction)ResetButtonOnePressed:(UIButton *)sender;

- (void) updateStopwatchOne;
- (void) STOPStopwatchOne;



@end


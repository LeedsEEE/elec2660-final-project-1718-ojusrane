//
//  FirstViewController.h
//  MultipleStopwatchTimer
//
//  Created by Ojus Rane [el16or] on 21/11/2017.
//  Copyright © 2017 Ojus Rane [el16or]. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StopwatchViewController : UIViewController <UITextFieldDelegate>
{
    NSTimer *StopwatchOne;
    int CountStopwatchOne;
    BOOL RunningStopwatchOne;
    
    NSTimer *StopwatchTwo;
    int CountStopwatchTwo;
    BOOL RunningStopwatchTwo;
    
    NSTimer *StopwatchThree;
    int CountStopwatchThree;
    BOOL RunningStopwatchThree;
}

//Stopwatch 1
@property (weak, nonatomic) IBOutlet UITextField *StopwatchTextfieldOne;
@property (weak, nonatomic) IBOutlet UILabel *StopwatchLabelOne;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonOne;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonOne;
- (IBAction)StartButtonOnePressed:(UIButton *)sender;
- (IBAction)ResetButtonOnePressed:(UIButton *)sender;

- (void) updateStopwatchOne;
- (void) STOPStopwatchOne;

//Stopwatch 2
@property (weak, nonatomic) IBOutlet UITextField *StopwatchTextfieldTwo;
@property (weak, nonatomic) IBOutlet UILabel *StopwatchLabelTwo;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonTwo;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonTwo;
- (IBAction)StartButtonTwoPressed:(UIButton *)sender;
- (IBAction)ResetButtonTwoPressed:(UIButton *)sender;

- (void) updateStopwatchTwo;
- (void) STOPStopwatchTwo;

//Stopwatch 3
@property (weak, nonatomic) IBOutlet UITextField *StopwatchTextfieldThree;
@property (weak, nonatomic) IBOutlet UILabel *StopwatchLabelThree;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonThree;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonThree;
- (IBAction)StartButtonThreePressed:(UIButton *)sender;
- (IBAction)ResetButtonThreePressed:(UIButton *)sender;

- (void) updateStopwatchThree;
- (void) STOPStopwatchThree;


//Reset all stopwatches
- (IBAction)ResetAllStopwatchesButtonPressed:(UIButton *)sender;

- (void) ResetAllStopwatches;


- (IBAction)backgroundPressed:(id)sender;










@end


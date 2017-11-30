//
//  SecondViewController.h
//  MultipleStopwatchTimer
//
//  Created by Ojus Rane [el16or] on 21/11/2017.
//  Copyright © 2017 Ojus Rane [el16or]. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

{
    
    NSTimer *TimerOne;
    int CountTimerOne;
    BOOL RunningTimerOne;
    long Hours_TimerOne;
    long Minutes_TimerOne;
    long Seconds_TimerOne;
    
    NSTimer *TimerTwo;
    int CountTimerTwo;
    BOOL RunningTimerTwo;
    long Hours_TimerTwo;
    long Minutes_TimerTwo;
    long Seconds_TimerTwo;
    
    NSTimer *TimerThree;
    int CountTimerThree;
    BOOL RunningTimerThree;
    long Hours_TimerThree;
    long Minutes_TimerThree;
    long Seconds_TimerThree;
}

//Timer One
@property (weak, nonatomic) IBOutlet UITextField *TimerTextFieldOne;
@property (weak, nonatomic) IBOutlet UIPickerView *PickerViewSelector;
@property (weak, nonatomic) IBOutlet UILabel *TimerLabelOne;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonOne;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonOne;

- (IBAction)StartButtonOnePressed:(UIButton *)sender;
- (IBAction)ResetButtonOnePressed:(UIButton *)sender;

- (void) updateTimerOne;
- (void) PauseTimerOne;
- (void) ResetTimerOne;
- (void) FinishedTimerOneAlarm;

//Timer Two
@property (weak, nonatomic) IBOutlet UITextField *TimerTextFieldTwo;
@property (weak, nonatomic) IBOutlet UIPickerView *PickerViewSelectorTwo;
@property (weak, nonatomic) IBOutlet UILabel *TimerLabelTwo;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonTwo;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonTwo;

- (IBAction)StartButtonTwoPressed:(UIButton *)sender;
- (IBAction)ResetButtonTwoPressed:(UIButton *)sender;

- (void) updateTimerTwo;
- (void) PauseTimerTwo;
- (void) ResetTimerTwo;
- (void) FinishedTimerTwoAlarm;


//Timer Three
@property (weak, nonatomic) IBOutlet UITextField *TimerTextFieldThree;
@property (weak, nonatomic) IBOutlet UIPickerView *PickerViewSelectorThree;
@property (weak, nonatomic) IBOutlet UILabel *TimerLabelThree;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonThree;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonThree;

- (IBAction)StartButtonThreePressed:(UIButton *)sender;
- (IBAction)ResetButtonThreePressed:(UIButton *)sender;

- (void) updateTimerThree;
- (void) PauseTimerThree;
- (void) ResetTimerThree;
- (void) FinishedTimerThreeAlarm;


@end


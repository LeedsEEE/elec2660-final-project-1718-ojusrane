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
    
}

//Timer One
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





@end


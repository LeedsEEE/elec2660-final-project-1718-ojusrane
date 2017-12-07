//
//  TimerViewController.h
//  MultipleStopwatchTimer
//
//  Created by Ojus Rane [el16or] on 21/11/2017.
//  Copyright © 2017 Ojus Rane [el16or]. All rights reserved.
//
//  In this view controller I have variable declarations, properties, actions and methods which can run 3 timers in my app at the same time. Please note, I am commenting on one set of timer code and not the other two sets because they will be duplicates of the one I am commenting on. Only the declared names will change on the two I'm not commenting on.

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"

@interface TimerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

{
    
    NSTimer *TimerOne;
    BOOL RunningTimerOne;
    long Hours_TimerOne;
    long Minutes_TimerOne;
    long Seconds_TimerOne;
    
    NSTimer *TimerTwo;
    BOOL RunningTimerTwo;
    long Hours_TimerTwo;
    long Minutes_TimerTwo;
    long Seconds_TimerTwo;
    
    NSTimer *TimerThree;
    BOOL RunningTimerThree;
    long Hours_TimerThree;
    long Minutes_TimerThree;
    long Seconds_TimerThree;
    
    AVAudioPlayer *playAlarm;
        //I've declared AVAudioPlayer so the timer can play sound along with the Alert notification that will display when the timer is up.
}


# pragma mark Timer One Outlet, Actions and Methods
//Timer One
@property (weak, nonatomic) IBOutlet UITextField *TimerTextFieldOne;
    // I have inserted a Textfield outlet so I can implement some code that will hide the keyboard when the user presses the return key or touches the background.
@property (weak, nonatomic) IBOutlet UIPickerView *PickerViewSelector;
    // Picker view can be used to select the time you would like to set on the timer
@property (weak, nonatomic) IBOutlet UILabel *TimerLabelOne;
    // Needed for user to keep track of timer
@property (weak, nonatomic) IBOutlet UIButton *StartButtonOne;
    // Outlet used so we can change the text between "Start", "Pause", "Resume" and change the colour of the buttons aswell.
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonOne;
    // Outlet needed so I could chage the colour of the reset button
@property (weak, nonatomic) IBOutlet UILabel *HoursMinutesSecondsLabelOne;
    // Label need so user is aware which picker compenent sets the hours, minutes and seconds. It need to be an outlet so it can be hidden when the timer is running


- (IBAction)StartButtonOnePressed:(UIButton *)sender;
    // Action will start the timer
- (IBAction)ResetButtonOnePressed:(UIButton *)sender;
    // Action will reset the timer

- (void) InitialTimeSetOne;
    // I need to add this extra method because whenever I reset my timer and start it back again to what was originally set too, the timer would carry on from where it left off too e.g. if I set the timer as 5 minutes and reset it on 4 minutes 55 seconds, and started it again at 5 minutes, the timer would carry on from 5 minutes. Having this method fixed the issue
- (void) updateTimerOne;
    // My NSTimer will perform this method every 1 second
- (void) PauseTimerOne;
    // This method will function when we press the pause button will the timer is running
- (void) ResetTimerOne;
    // This will be performed when the reset button is pressed on the timer
- (void) FinishedTimerOneAlarm;
    // Once the timer is up, the alert view and sound will play with this method



# pragma mark Timer Two Outlet, Actions and Methods
//Timer Two
@property (weak, nonatomic) IBOutlet UITextField *TimerTextFieldTwo;
@property (weak, nonatomic) IBOutlet UIPickerView *PickerViewSelectorTwo;
@property (weak, nonatomic) IBOutlet UILabel *TimerLabelTwo;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonTwo;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonTwo;
@property (weak, nonatomic) IBOutlet UILabel *HoursMinutesSecondsLabelTwo;


- (IBAction)StartButtonTwoPressed:(UIButton *)sender;
- (IBAction)ResetButtonTwoPressed:(UIButton *)sender;

- (void) InitialTimeSetTwo;
- (void) updateTimerTwo;
- (void) PauseTimerTwo;
- (void) ResetTimerTwo;
- (void) FinishedTimerTwoAlarm;


# pragma mark Timer Three Outlet, Actions and Methods
//Timer Three
@property (weak, nonatomic) IBOutlet UITextField *TimerTextFieldThree;
@property (weak, nonatomic) IBOutlet UIPickerView *PickerViewSelectorThree;
@property (weak, nonatomic) IBOutlet UILabel *TimerLabelThree;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonThree;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonThree;
@property (weak, nonatomic) IBOutlet UILabel *HoursMinutesSecondsLabelThree;


- (IBAction)StartButtonThreePressed:(UIButton *)sender;
- (IBAction)ResetButtonThreePressed:(UIButton *)sender;

- (void) InitialTimeSetThree;
- (void) updateTimerThree;
- (void) PauseTimerThree;
- (void) ResetTimerThree;
- (void) FinishedTimerThreeAlarm;


# pragma mark Other Actions
- (IBAction)backgroundPressed:(id)sender;

# pragma mark Alert Notification Method
- (void) AlertNotification;


@end


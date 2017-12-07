//
//  StopwatchViewController.h
//  MultipleStopwatchTimer
//
//  Created by Ojus Rane [el16or] on 21/11/2017.
//  Copyright © 2017 Ojus Rane [el16or]. All rights reserved.
//
//  In this view controller I have variable declarations, properties, actions and methods which can run 3 stopwatches in my app at the same time. Please note, I am commenting on one set of stopwatch code and not the other two sets because they will be duplicates of the one I am commenting on. Only the declared names will change on the two I'm not commenting on.

#import <UIKit/UIKit.h>

@interface StopwatchViewController : UIViewController <UITextFieldDelegate>
    //Text field delegate was required to implement code that would hide the keyboard when the user presses the return key or touches the background

#pragma mark Variable's declared
{
    NSTimer *StopwatchOne;
        // NSTimer is a built-in class used in my app to run code in repeated loops to whatever time interval I set it too. For every loop, it fires a specific message to the target object we set it too. In this case, I would like my time interval to be one millisecond, and target object to be "updateStopwatchOne" method. So it will perform the "updateStopwatchOne" method every one millisecond.
    int CountStopwatchOne;
        // I have declared an integer called "CountStopwatchOne" as this will play a part in updating the Stopwatch label in the Storyboard.
    BOOL RunningStopwatchOne;
        // I have also declared is boolean so I can set the stopwatch's initial state, and control when the stopwatch starts/pauses/stops.
    
    NSTimer *StopwatchTwo;
    int CountStopwatchTwo;
    BOOL RunningStopwatchTwo;
    
    NSTimer *StopwatchThree;
    int CountStopwatchThree;
    BOOL RunningStopwatchThree;
}


#pragma mark Stopwatch 1 Outlet, Actions and Methods
//Stopwatch 1
@property (weak, nonatomic) IBOutlet UITextField *StopwatchTextfieldOne;
    // I have inserted a Textfield outlet so I can implement some code that will hide the keyboard when the user presses the return key or touches the background.
@property (weak, nonatomic) IBOutlet UILabel *StopwatchLabelOne;
    // The label outlet is used so it can be manipulated by code which will let the user keep track of the time.
@property (weak, nonatomic) IBOutlet UIButton *StartButtonOne;
    // Outlet used so we can change the text between "Start", "Stop", "Resume" and change the colour of the buttons aswell.
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonOne;
    // Added just in case I want this element to be manipulated by code.
- (IBAction)StartButtonOnePressed:(UIButton *)sender;
    // I added an Action for the start button so I could add code that would Start/Stop/Resume the stopwatch I was running.
- (IBAction)ResetButtonOnePressed:(UIButton *)sender;
    // I added an Action for the reset button so I could add code that would Reset the stopwatch back to 0 seconds.


- (void) updateStopwatchOne;
    // This is a method used to update the stopwatch when it is running.
- (void) STOPStopwatchOne;
    // This is a method used to stop the stopwatch when stopped or reset.


#pragma mark Stopwatch 2 Outlet, Actions and Methods
//Stopwatch 2
@property (weak, nonatomic) IBOutlet UITextField *StopwatchTextfieldTwo;
@property (weak, nonatomic) IBOutlet UILabel *StopwatchLabelTwo;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonTwo;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonTwo;
- (IBAction)StartButtonTwoPressed:(UIButton *)sender;
- (IBAction)ResetButtonTwoPressed:(UIButton *)sender;

- (void) updateStopwatchTwo;
- (void) STOPStopwatchTwo;


#pragma mark Stopwatch 3 Outlet, Actions and Methods
//Stopwatch 3
@property (weak, nonatomic) IBOutlet UITextField *StopwatchTextfieldThree;
@property (weak, nonatomic) IBOutlet UILabel *StopwatchLabelThree;
@property (weak, nonatomic) IBOutlet UIButton *StartButtonThree;
@property (weak, nonatomic) IBOutlet UIButton *ResetButtonThree;
- (IBAction)StartButtonThreePressed:(UIButton *)sender;
- (IBAction)ResetButtonThreePressed:(UIButton *)sender;

- (void) updateStopwatchThree;
- (void) STOPStopwatchThree;


#pragma mark Reset all stopwatches Outlet, Actions and Methods
- (IBAction)ResetAllStopwatchesButtonPressed:(UIButton *)sender;
    // I included an Reset all stopwatch button so the user could reset all 3 stopwatches with one button rather than resetting the stopwatches one at a time
- (void) ResetAllStopwatches;
    // This method was needed to Reset all stopwatches

#pragma mark Background Pressed Action
- (IBAction)backgroundPressed:(id)sender;
    // This action is used to hide the keyboard when the user touches the background of the screen will they have the keyboard shown


@end


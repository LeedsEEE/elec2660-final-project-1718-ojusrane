//
//  StopwatchViewController.m
//  MultipleStopwatchTimer
//
//  Created by Ojus Rane [el16or] on 21/11/2017.
//  Copyright © 2017 Ojus Rane [el16or]. All rights reserved.
//

#import "StopwatchViewController.h"

@interface StopwatchViewController ()

@end

@implementation StopwatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.StopwatchLabelOne.text = @"00:00:00:00";
        // Making sure the stopwatch label is initialised to 0 seconds
    RunningStopwatchOne = NO;
        // Initialising the Boolean state to "NO". When the Boolean state is "YES", the Stopwatch will be running
    CountStopwatchOne = 0;
        // This variable will be 0 initially, and will increment by 1 every millisecond when the stopwatch is running.
    [_StartButtonOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        // I wanted to set the Start button colour to green, so we use the "setTitleColor" method, which you can find when manipulating a button element and use UIColor. UIColor has a list of colours that you can choose from to set the button colour. "forState:" is a method that gives the button a certain look. The default behaviour we tend to use is "UIControlStateNormal" which means the button will look like how it was and won't be highlighted or have a selected look to it.

    
    self.StopwatchLabelTwo.text = @"00:00:00:00";
    RunningStopwatchTwo = NO;
    CountStopwatchTwo = 0;
    [_StartButtonTwo setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

    
    self.StopwatchLabelThree.text = @"00:00:00:00";
    RunningStopwatchThree = NO;
    CountStopwatchThree = 0;
    [_StartButtonThree setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Stopwatch 1

- (IBAction)StartButtonOnePressed:(UIButton *)sender {
    if (RunningStopwatchOne == NO) {
        RunningStopwatchOne = YES;
        [_StartButtonOne setTitle:@"Stop" forState:UIControlStateNormal];
        // When the button is pressed, the title will change to stop and will be in its normal state ny setting it to "UIControlStateNormal"
        [_StartButtonOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        if (StopwatchOne == nil){
            StopwatchOne = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateStopwatchOne) userInfo:nil repeats:YES];
            // Initially the NSTimer will be 0. If the NStimer = 0 when the start button is pressed, I am firing the NSTimer to perform a method every 10ms, hence the "scheduledTimerWithTimeInterval:0.01" . We mention the method using the "selector" section. So in this case I want the "updateStopwatchOne" to be performed every 10ms. I make it performed every 10ms by setting the "repeats" section to YES. The target will be "self" as this code is only being performed with this class only.
            
            // UPDATE: Unfortunately I have had to increase the time intervals from 10ms to 100ms, because NSTimer would fire properly on time, hence the stopwatch wasn't updating in real time. This means that the milliseconds seconds has less precision and can only update 100ms at a time. According to the apple documentation, the best timer interval the NSTimer class can handle is a value between 50 - 100 milliseconds
        }
    }
        else {
            [self STOPStopwatchOne];
        }
    }



- (IBAction)ResetButtonOnePressed:(UIButton *)sender {
    [self STOPStopwatchOne];
    CountStopwatchOne = 0;
    // When the reset button is pressed, the count integer will drop back down to zero so the timer will start back at 0 if started again
    self.StopwatchLabelOne.text = @"00:00:00:00";
    // Setting the text back to 0 seconds
    [_StartButtonOne setTitle:@"Start" forState:UIControlStateNormal];
    // Making the Start button go from Stop/Resume to "Start"
    [_StartButtonOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    // Setting the colour back to its original state
}

- (void) updateStopwatchOne{
    CountStopwatchOne ++;
    // NSTimer will perform this method every 10ms, so the CountStopwatchOne integer will incrememt by 1 every 10ms, and will set the Hours, Minutes, Seconds and Milliseconds and will pass this onto a label
    
    int Hours_StopwatchOne = floor(CountStopwatchOne/10/3600);
    int Minutes_StopwatchOne = floor(CountStopwatchOne/10/60);
    int Seconds_StopwatchOne = floor(CountStopwatchOne/10);
    int Milliseconds_StopwatchOne = CountStopwatchOne % 10;
    // This variables set what is displayed in the stopwatch label. Since we set the time interval to 10ms, we need to divide the "CountStopwatchOne" integer by 100 for every seconds that goes by in the stopwatch. For the minutes section, we divide it by 100 and a further 60, since 1 minute is 60 seconds. For the hours sections, we divide it by 100, then a further 3600 since there is 3600 seconds in an hour.
    // We use the floor function to work out our integers, which returns the greatest integer NOT greater than x. For example if the input = 2.25, then output = 2.00
    // The modulo operater "%" gives us the remainder, when the integer is divided by 100
    
    //UPDATE: Have had to change from 100 to 10 because of the change in time interval
    
    if (Seconds_StopwatchOne >=60){
        Seconds_StopwatchOne = Seconds_StopwatchOne % 60;
    }
    // When seconds is more that 60 seconds, it will revert back down to 0 seconds by getting the remainder
    
    self.StopwatchLabelOne.text = [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", Hours_StopwatchOne,Minutes_StopwatchOne,Seconds_StopwatchOne,Milliseconds_StopwatchOne*10];
    
}
- (void) STOPStopwatchOne{
    RunningStopwatchOne = NO;
    [StopwatchOne invalidate];
    StopwatchOne = nil;
    // When we Stop/Reset the timer, we use the invalidate method when we do not need the NSTimer to run, and we also set the NSTimer to nil so it is cleared from RAM and at a later time we can reuse the timer when we play the stopwatch again.
    [_StartButtonOne setTitle:@"Resume" forState:UIControlStateNormal];
    [_StartButtonOne setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}



//Stopwatch 2

- (IBAction)StartButtonTwoPressed:(UIButton *)sender {
    if (RunningStopwatchTwo == NO) {
        RunningStopwatchTwo = YES;
        [_StartButtonTwo setTitle:@"Stop" forState:UIControlStateNormal];
        [_StartButtonTwo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        if (StopwatchTwo == nil){
            StopwatchTwo = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateStopwatchTwo) userInfo:nil repeats:YES];
        }
    }
    else {
        [self STOPStopwatchTwo];
    }
}


- (IBAction)ResetButtonTwoPressed:(UIButton *)sender {
    [self STOPStopwatchTwo];
    CountStopwatchTwo = 0;
    self.StopwatchLabelTwo.text = @"00:00:00:00";
    [_StartButtonTwo setTitle:@"Start" forState:UIControlStateNormal];
    [_StartButtonTwo setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
}


- (void) updateStopwatchTwo{
    CountStopwatchTwo ++;
    
    int Hours_StopwatchTwo = floor(CountStopwatchTwo/10/3600);
    int Minutes_StopwatchTwo = floor(CountStopwatchTwo/10/60);
    int Seconds_StopwatchTwo = floor(CountStopwatchTwo/10);
    int Milliseconds_StopwatchTwo = CountStopwatchTwo % 10;
    
    if (Seconds_StopwatchTwo >=60){
        Seconds_StopwatchTwo = Seconds_StopwatchTwo % 60;
    }
    
    self.StopwatchLabelTwo.text = [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", Hours_StopwatchTwo,Minutes_StopwatchTwo,Seconds_StopwatchTwo,Milliseconds_StopwatchTwo*10];
    
}
- (void) STOPStopwatchTwo{
    RunningStopwatchTwo = NO;
    [StopwatchTwo invalidate];
    StopwatchTwo = nil;
    [_StartButtonTwo setTitle:@"Resume" forState:UIControlStateNormal];
    [_StartButtonTwo setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}


//Stopwatch 3

- (IBAction)StartButtonThreePressed:(UIButton *)sender {
    if (RunningStopwatchThree == NO) {
        RunningStopwatchThree = YES;
        [_StartButtonThree setTitle:@"Stop" forState:UIControlStateNormal];
        [_StartButtonThree setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        if (StopwatchThree == nil){
            StopwatchThree = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateStopwatchThree) userInfo:nil repeats:YES];
        }
    }
    else {
        [self STOPStopwatchThree];
    }
}


- (IBAction)ResetButtonThreePressed:(UIButton *)sender {
    [self STOPStopwatchThree];
    CountStopwatchThree = 0;
    self.StopwatchLabelThree.text = @"00:00:00:00";
    [_StartButtonThree setTitle:@"Start" forState:UIControlStateNormal];
    [_StartButtonThree setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
}

- (void) updateStopwatchThree{
    CountStopwatchThree ++;
    
    int Hours_StopwatchThree = floor(CountStopwatchThree/10/3600);
    int Minutes_StopwatchThree = floor(CountStopwatchThree/10/60);
    int Seconds_StopwatchThree = floor(CountStopwatchThree/10);
    int Milliseconds_StopwatchThree = CountStopwatchThree % 10;
    
    if (Seconds_StopwatchThree >=60){
        Seconds_StopwatchThree = Seconds_StopwatchThree % 60;
    }
    
    self.StopwatchLabelThree.text = [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", Hours_StopwatchThree,Minutes_StopwatchThree,Seconds_StopwatchThree,Milliseconds_StopwatchThree*10];
    
}
- (void) STOPStopwatchThree{
    RunningStopwatchThree = NO;
    [StopwatchThree invalidate];
    StopwatchThree = nil;
    [_StartButtonThree setTitle:@"Resume" forState:UIControlStateNormal];
    [_StartButtonThree setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}



//Reset Button to reset all Stopwatches
- (IBAction)ResetAllStopwatchesButtonPressed:(UIButton *)sender {
    [self ResetAllStopwatches];
}

-(void) ResetAllStopwatches{
    [self STOPStopwatchOne];
    CountStopwatchOne = 0;
    self.StopwatchLabelOne.text = @"00:00:00:00";
    [_StartButtonOne setTitle:@"Start" forState:UIControlStateNormal];
    [_StartButtonOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

    
    [self STOPStopwatchTwo];
    CountStopwatchTwo = 0;
    self.StopwatchLabelTwo.text = @"00:00:00:00";
    [_StartButtonTwo setTitle:@"Start" forState:UIControlStateNormal];
    [_StartButtonTwo setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

    
    [self STOPStopwatchThree];
    CountStopwatchThree = 0;
    self.StopwatchLabelThree.text = @"00:00:00:00";
    [_StartButtonThree setTitle:@"Start" forState:UIControlStateNormal];
    [_StartButtonThree setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

}

- (IBAction)backgroundPressed:(id)sender {
    if ([self.StopwatchTextfieldOne isFirstResponder]){
        [self.StopwatchTextfieldOne resignFirstResponder];
    }
    if ([self.StopwatchTextfieldTwo isFirstResponder]){
        [self.StopwatchTextfieldTwo resignFirstResponder];
    }
    if ([self.StopwatchTextfieldThree isFirstResponder]){
        [self.StopwatchTextfieldThree resignFirstResponder];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}


@end

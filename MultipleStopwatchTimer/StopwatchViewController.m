//
//  FirstViewController.m
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
    RunningStopwatchOne = NO;
    CountStopwatchOne = 0;
    [_StartButtonOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];

    
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
        [_StartButtonOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        if (StopwatchOne == nil){
            StopwatchOne = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateStopwatchOne) userInfo:nil repeats:YES];
        }
    }
        else {
            [self STOPStopwatchOne];
        }
}


- (IBAction)ResetButtonOnePressed:(UIButton *)sender {
    [self STOPStopwatchOne];
    CountStopwatchOne = 0;
    self.StopwatchLabelOne.text = @"00:00:00:00";
    
}

- (void) updateStopwatchOne{
    CountStopwatchOne ++;
    
    int Hours_StopwatchOne = floor(CountStopwatchOne/100/3600);
    int Minutes_StopwatchOne = floor(CountStopwatchOne/100/60);
    int Seconds_StopwatchOne = floor(CountStopwatchOne/100);
    int Milliseconds_StopwatchOne = CountStopwatchOne % 100;
    
    if (Seconds_StopwatchOne >=60){
        Seconds_StopwatchOne = Seconds_StopwatchOne % 60;
    }
    
    self.StopwatchLabelOne.text = [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", Hours_StopwatchOne,Minutes_StopwatchOne,Seconds_StopwatchOne,Milliseconds_StopwatchOne];
    
}
- (void) STOPStopwatchOne{
    RunningStopwatchOne = NO;
    [StopwatchOne invalidate];
    StopwatchOne = nil;
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
            StopwatchTwo = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateStopwatchTwo) userInfo:nil repeats:YES];
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
}


- (void) updateStopwatchTwo{
    CountStopwatchTwo ++;
    
    int Hours_StopwatchTwo = floor(CountStopwatchTwo/100/3600);
    int Minutes_StopwatchTwo = floor(CountStopwatchTwo/100/60);
    int Seconds_StopwatchTwo = floor(CountStopwatchTwo/100);
    int Milliseconds_StopwatchTwo = CountStopwatchTwo % 100;
    
    if (Seconds_StopwatchTwo >=60){
        Seconds_StopwatchTwo = Seconds_StopwatchTwo % 60;
    }
    
    self.StopwatchLabelTwo.text = [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", Hours_StopwatchTwo,Minutes_StopwatchTwo,Seconds_StopwatchTwo,Milliseconds_StopwatchTwo];
    
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
            StopwatchThree = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateStopwatchThree) userInfo:nil repeats:YES];
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
}

- (void) updateStopwatchThree{
    CountStopwatchThree ++;
    
    int Hours_StopwatchThree = floor(CountStopwatchThree/100/3600);
    int Minutes_StopwatchThree = floor(CountStopwatchThree/100/60);
    int Seconds_StopwatchThree = floor(CountStopwatchThree/100);
    int Milliseconds_StopwatchThree = CountStopwatchThree % 100;
    
    if (Seconds_StopwatchThree >=60){
        Seconds_StopwatchThree = Seconds_StopwatchThree % 60;
    }
    
    self.StopwatchLabelThree.text = [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", Hours_StopwatchThree,Minutes_StopwatchThree,Seconds_StopwatchThree,Milliseconds_StopwatchThree];
    
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
    
    [self STOPStopwatchTwo];
    CountStopwatchTwo = 0;
    self.StopwatchLabelTwo.text = @"00:00:00:00";
    
    [self STOPStopwatchThree];
    CountStopwatchThree = 0;
    self.StopwatchLabelThree.text = @"00:00:00:00";
    
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

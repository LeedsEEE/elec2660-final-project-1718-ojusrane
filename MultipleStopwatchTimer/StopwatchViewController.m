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
    
    self.StopwatchLabelOne.text = @"00:00:00";
    RunningStopwatchOne = NO;
    CountStopwatchone = 0;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)StartButtonOnePressed:(UIButton *)sender {
    if (RunningStopwatchOne == NO){
        RunningStopwatchOne = YES;
        [_StartButtonOne setTitle:@"Stop" forState:UIControlStateNormal];
        
        if (StopwatchOne == nil){
            StopwatchOne = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateStopwatchOne) userInfo:nil repeats:YES];
        }
        else {
            RunningStopwatchOne = NO;
            [StopwatchOne invalidate];
            StopwatchOne = nil;
            [_StartButtonOne setTitle:@"Start" forState:UIControlStateNormal];
        }
    }
}

- (IBAction)ResetButtonOnePressed:(UIButton *)sender {
}

- (void) updateStopwatchOne{
    CountStopwatchone ++;
    
    int min = floor(CountStopwatchone/100/60);
    int sec = floor(CountStopwatchone/100);
    int mSec = CountStopwatchone % 100;
    
    if (sec >=60){
        sec = sec % 60;
    }
    
    self.StopwatchLabelOne.text = [NSString stringWithFormat:@"%02d:%02d:%02d",min,sec,mSec];
    
}
- (void) STOPStopwatchOne{
    
}

@end

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
    CountStopwatchone = 0;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)StartButtonOnePressed:(UIButton *)sender {
    if (RunningStopwatchOne == NO) {
        RunningStopwatchOne = YES;
        [_StartButtonOne setTitle:@"Stop" forState:UIControlStateNormal];
        
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
    CountStopwatchone = 0;
    self.StopwatchLabelOne.text = @"00:00:00:00";
    
}

- (void) updateStopwatchOne{
    CountStopwatchone ++;
    
    int Hours_StopwatchOne = floor(CountStopwatchone/100/3600);
    int Minutes_StopwatchOne = floor(CountStopwatchone/100/60);
    int Seconds_StopwatchOne = floor(CountStopwatchone/100);
    int Milliseconds_StopwatchOne = CountStopwatchone % 100;
    
    if (Seconds_StopwatchOne >=60){
        Seconds_StopwatchOne = Seconds_StopwatchOne % 60;
    }
    
    self.StopwatchLabelOne.text = [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", Hours_StopwatchOne,Minutes_StopwatchOne,Seconds_StopwatchOne,Milliseconds_StopwatchOne];
    
}
- (void) STOPStopwatchOne{
    RunningStopwatchOne = NO;
    [StopwatchOne invalidate];
    StopwatchOne = nil;
    [_StartButtonOne setTitle:@"Start" forState:UIControlStateNormal];
}

@end

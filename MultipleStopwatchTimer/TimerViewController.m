//
//  SecondViewController.m
//  MultipleStopwatchTimer
//
//  Created by Ojus Rane [el16or] on 21/11/2017.
//  Copyright © 2017 Ojus Rane [el16or]. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.PickerViewSelector.delegate = self;
    self.PickerViewSelector.dataSource = self;
    
    self.TimerLabelOne.text = @"00:00:00";
    RunningTimerOne = NO;
    self.ResetButtonOne.hidden = TRUE;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions

- (IBAction)StartButtonOnePressed:(UIButton *)sender {
    self.PickerViewSelector.hidden = true;
    if (RunningTimerOne ==NO) {
        RunningTimerOne = YES;
        self.ResetButtonOne.hidden = FALSE;
        [_StartButtonOne setTitle:@"Pause" forState:UIControlStateNormal];
        
        if (TimerOne == nil){
            TimerOne = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimerOne) userInfo:nil repeats:YES];
        }
    }
    else {
        [self PauseTimerOne];
    }
    [self FinishedTimerOneAlarm];
}

- (IBAction)ResetButtonOnePressed:(UIButton *)sender {
    [self ResetTimerOne];
    
    Hours_TimerOne = [self.PickerViewSelector selectedRowInComponent:0];
    Minutes_TimerOne = [self.PickerViewSelector selectedRowInComponent:1];
    Seconds_TimerOne = [self.PickerViewSelector selectedRowInComponent:2];

}


#pragma mark void Methods

- (void) updateTimerOne{
    if (Seconds_TimerOne != 0){
        Seconds_TimerOne --;
    }
    else if(Minutes_TimerOne == 0 && Seconds_TimerOne == 0) {
        Hours_TimerOne --;
        Minutes_TimerOne = 59;
        Seconds_TimerOne = 59;
    }
    else if (Seconds_TimerOne == 0) {
        Minutes_TimerOne --;
        Seconds_TimerOne = 59;
    }
    self.TimerLabelOne.text = [NSString stringWithFormat: @"%02ld:%02ld:%02ld",Hours_TimerOne,Minutes_TimerOne,Seconds_TimerOne];
    [self FinishedTimerOneAlarm];
}

- (void) PauseTimerOne{
    RunningTimerOne = NO;
    [TimerOne invalidate];
    TimerOne = nil;
    [_StartButtonOne setTitle:@"Resume" forState:UIControlStateNormal];
}

- (void) ResetTimerOne{
    self.ResetButtonOne.hidden = TRUE;
    self.PickerViewSelector.hidden = false;
    [TimerOne invalidate];
    TimerOne = nil;
    self.TimerLabelOne.text = @"00:00:00";
    [_StartButtonOne setTitle:@"Start" forState:UIControlStateNormal];
    RunningTimerOne = NO;
    
}

- (void) FinishedTimerOneAlarm{
    if (Hours_TimerOne == 0 && Minutes_TimerOne == 0 && Seconds_TimerOne == 0) {
        [TimerOne invalidate];
        TimerOne = nil;
        self.PickerViewSelector.hidden = false;
        [_StartButtonOne setTitle:@"Start" forState:UIControlStateNormal];
        RunningTimerOne = NO;
        self.ResetButtonOne.hidden = TRUE;
    }
}




#pragma mark Picker view Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView
              titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    
    NSString *Number = [NSString stringWithFormat:@"%ld",row];
    return Number;
    
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    
    Hours_TimerOne = [self.PickerViewSelector selectedRowInComponent:0];
    Minutes_TimerOne = [self.PickerViewSelector selectedRowInComponent:1];
    Seconds_TimerOne = [self.PickerViewSelector selectedRowInComponent:2];
    
}



#pragma mark Picker view Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    
    NSInteger rows;
    
    if (component == 0) {
        rows = 100;
    }
    else if (component == 1) {
        rows = 60;
    }
    else if (component == 2) {
        rows = 60;
    }
    
    return rows;
    
}





@end

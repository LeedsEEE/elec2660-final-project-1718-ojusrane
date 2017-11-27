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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)StartButtonOnePressed:(UIButton *)sender {
}

- (IBAction)ResetButtonOnePressed:(UIButton *)sender {
}

- (void) updateTimerOne{
}

- (void) PauseTimerOne{
}

- (void) ResetTimerOne{
}

- (void) FinishedTimerOneAlarm{
}




#pragma mark Picker view Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView
              titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    
    NSString *Number = [NSString stringWithFormat:@"%ld",row];
    
    return Number;
    
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

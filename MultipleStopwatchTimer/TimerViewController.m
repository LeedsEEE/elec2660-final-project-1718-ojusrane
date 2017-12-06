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
    
    //Timer One viewDidLoad
    self.PickerViewSelector.delegate = self;
    self.PickerViewSelector.dataSource = self;
    self.TimerLabelOne.hidden = TRUE;
    self.ResetButtonOne.hidden = TRUE;
    RunningTimerOne = NO;
    [_StartButtonOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    //Timer Two viewDidLoad
    self.PickerViewSelectorTwo.delegate = self;
    self.PickerViewSelectorTwo.dataSource = self;
    self.TimerLabelTwo.hidden = TRUE;
    self.ResetButtonTwo.hidden = TRUE;
    RunningTimerTwo = NO;
    [_StartButtonTwo setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    //Timer Three viewDidLoad
    self.PickerViewSelectorThree.delegate = self;
    self.PickerViewSelectorThree.dataSource = self;
    self.TimerLabelThree.hidden = TRUE;
    self.ResetButtonThree.hidden = TRUE;
    RunningTimerThree = NO;
    [_StartButtonThree setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    //Audio Initialization
    NSString *path = [[NSBundle mainBundle] pathForResource:@"apple_ring" ofType:@".mp3"]; //https://www.zedge.net/ringtone/1001866/
    NSURL *AlarmUrl = [NSURL fileURLWithPath:path];
    playAlarm = [[AVAudioPlayer alloc]initWithContentsOfURL:AlarmUrl error:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Timer One
#pragma mark Timer One Actions

- (IBAction)StartButtonOnePressed:(UIButton *)sender {
    if (Hours_TimerOne !=0 || Minutes_TimerOne !=0 || Seconds_TimerOne !=0){
    self.PickerViewSelector.hidden = true;
    self.TimerLabelOne.hidden = false;
    self.HoursMinutesSecondsLabelOne.hidden = true;
    if (RunningTimerOne ==NO) {
        RunningTimerOne = YES;
        self.ResetButtonOne.hidden = FALSE;
        [_StartButtonOne setTitle:@"Pause" forState:UIControlStateNormal];
        [_StartButtonOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

        
        if (TimerOne == nil){
            TimerOne = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimerOne) userInfo:nil repeats:YES];
        }
    }
    else {
        [self PauseTimerOne];
    }
    [self FinishedTimerOneAlarm];
}
}

- (IBAction)ResetButtonOnePressed:(UIButton *)sender {
    [self ResetTimerOne];
    [self InitialTimeSetOne];
}


#pragma mark Timer One Methods
- (void) InitialTimeSetOne{
    Hours_TimerOne = [self.PickerViewSelector selectedRowInComponent:0];
    Minutes_TimerOne = [self.PickerViewSelector selectedRowInComponent:1];
    Seconds_TimerOne = [self.PickerViewSelector selectedRowInComponent:2];
}

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
    [_StartButtonOne setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void) ResetTimerOne{
    self.TimerLabelOne.hidden = TRUE;
    self.ResetButtonOne.hidden = TRUE;
    self.PickerViewSelector.hidden = false;
    self.HoursMinutesSecondsLabelOne.hidden = false;
    [TimerOne invalidate];
    TimerOne = nil;
    self.TimerLabelOne.text = @"00:00:00";
    [_StartButtonOne setTitle:@"Start" forState:UIControlStateNormal];
    [_StartButtonOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    RunningTimerOne = NO;
    
}

- (void) FinishedTimerOneAlarm{
    if (Hours_TimerOne == 0 && Minutes_TimerOne == 0 && Seconds_TimerOne == 0) {
        [TimerOne invalidate];
        TimerOne = nil;
        self.PickerViewSelector.hidden = false;
        [_StartButtonOne setTitle:@"Start" forState:UIControlStateNormal];
        [_StartButtonOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        RunningTimerOne = NO;
        self.ResetButtonOne.hidden = TRUE;
        self.TimerLabelOne.hidden = TRUE;
        [self InitialTimeSetOne];
        [self AlertNotification];
    }
}























//Timer Two
#pragma mark Timer Two Actions
- (IBAction)StartButtonTwoPressed:(UIButton *)sender {
    if (Hours_TimerTwo !=0 || Minutes_TimerTwo !=0 || Seconds_TimerTwo !=0){
    self.PickerViewSelectorTwo.hidden = true;
    self.TimerLabelTwo.hidden = false;
    self.HoursMinutesSecondsLabelTwo.hidden = true;
    if (RunningTimerTwo ==NO) {
        RunningTimerTwo = YES;
        self.ResetButtonTwo.hidden = FALSE;
        [_StartButtonTwo setTitle:@"Pause" forState:UIControlStateNormal];
        [_StartButtonTwo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

        
        if (TimerTwo == nil){
            TimerTwo = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimerTwo) userInfo:nil repeats:YES];
        }
    }
    else {
        [self PauseTimerTwo];
    }
    [self FinishedTimerTwoAlarm];
}
}

- (IBAction)ResetButtonTwoPressed:(UIButton *)sender {
    [self ResetTimerTwo];
    [self InitialTimeSetTwo];
}

#pragma mark Timer Two Methods
- (void) InitialTimeSetTwo{
    Hours_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:0];
    Minutes_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:1];
    Seconds_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:2];
}

- (void) updateTimerTwo{
    if (Seconds_TimerTwo != 0){
        Seconds_TimerTwo --;
    }
    else if(Minutes_TimerTwo == 0 && Seconds_TimerTwo == 0) {
        Hours_TimerTwo --;
        Minutes_TimerTwo = 59;
        Seconds_TimerTwo = 59;
    }
    else if (Seconds_TimerTwo == 0) {
        Minutes_TimerTwo --;
        Seconds_TimerTwo = 59;
    }
    self.TimerLabelTwo.text = [NSString stringWithFormat: @"%02ld:%02ld:%02ld",Hours_TimerTwo,Minutes_TimerTwo,Seconds_TimerTwo];
    [self FinishedTimerTwoAlarm];
}

- (void) PauseTimerTwo{
    RunningTimerTwo = NO;
    [TimerTwo invalidate];
    TimerTwo = nil;
    [_StartButtonTwo setTitle:@"Resume" forState:UIControlStateNormal];
    [_StartButtonTwo setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void) ResetTimerTwo{
    self.TimerLabelTwo.hidden = TRUE;
    self.ResetButtonTwo.hidden = TRUE;
    self.PickerViewSelectorTwo.hidden = false;
    self.HoursMinutesSecondsLabelTwo.hidden = false;
    [TimerTwo invalidate];
    TimerTwo = nil;
    self.TimerLabelTwo.text = @"00:00:00";
    [_StartButtonTwo setTitle:@"Start" forState:UIControlStateNormal];
    [_StartButtonTwo setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    RunningTimerTwo = NO;
    
}

- (void) FinishedTimerTwoAlarm{
    if (Hours_TimerTwo == 0 && Minutes_TimerTwo == 0 && Seconds_TimerTwo == 0) {
        [TimerTwo invalidate];
        TimerTwo = nil;
        self.PickerViewSelectorTwo.hidden = false;
        [_StartButtonTwo setTitle:@"Start" forState:UIControlStateNormal];
        [_StartButtonTwo setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        RunningTimerTwo = NO;
        self.ResetButtonTwo.hidden = TRUE;
        self.TimerLabelTwo.hidden = TRUE;
        [self InitialTimeSetTwo];
        [self AlertNotification];
    }
}





















//Timer Three
#pragma mark Timer Three Actions
- (IBAction)StartButtonThreePressed:(UIButton *)sender {
    if (Hours_TimerThree !=0 || Minutes_TimerThree !=0 || Seconds_TimerThree !=0){
    self.PickerViewSelectorThree.hidden = true;
    self.TimerLabelThree.hidden = false;
    self.HoursMinutesSecondsLabelThree.hidden = true;
    if (RunningTimerThree ==NO) {
        RunningTimerThree = YES;
        self.ResetButtonThree.hidden = FALSE;
        [_StartButtonThree setTitle:@"Pause" forState:UIControlStateNormal];
        [_StartButtonThree setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

        
        if (TimerThree == nil){
            TimerThree = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimerThree) userInfo:nil repeats:YES];
        }
    }
    else {
        [self PauseTimerThree];
    }
    [self FinishedTimerThreeAlarm];
}
}

- (IBAction)ResetButtonThreePressed:(UIButton *)sender {
    [self ResetTimerThree];
    [self InitialTimeSetThree];
}

#pragma mark Timer Three Methods
- (void) InitialTimeSetThree{
    Hours_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:0];
    Minutes_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:1];
    Seconds_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:2];
}

- (void) updateTimerThree{
    if (Seconds_TimerThree != 0){
        Seconds_TimerThree --;
    }
    else if(Minutes_TimerThree == 0 && Seconds_TimerThree == 0) {
        Hours_TimerThree --;
        Minutes_TimerThree = 59;
        Seconds_TimerThree = 59;
    }
    else if (Seconds_TimerThree == 0) {
        Minutes_TimerThree --;
        Seconds_TimerThree = 59;
    }
    self.TimerLabelThree.text = [NSString stringWithFormat: @"%02ld:%02ld:%02ld",Hours_TimerThree,Minutes_TimerThree,Seconds_TimerThree];
    [self FinishedTimerThreeAlarm];
}

- (void) PauseTimerThree{
    RunningTimerThree = NO;
    [TimerThree invalidate];
    TimerThree = nil;
    [_StartButtonThree setTitle:@"Resume" forState:UIControlStateNormal];
    [_StartButtonThree setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void) ResetTimerThree{
    self.TimerLabelThree.hidden = TRUE;
    self.ResetButtonThree.hidden = TRUE;
    self.PickerViewSelectorThree.hidden = false;
    self.HoursMinutesSecondsLabelThree.hidden = false;
    [TimerThree invalidate];
    TimerThree = nil;
    self.TimerLabelThree.text = @"00:00:00";
    [_StartButtonThree setTitle:@"Start" forState:UIControlStateNormal];
    [_StartButtonThree setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    RunningTimerThree = NO;
}

- (void) FinishedTimerThreeAlarm{
    if (Hours_TimerThree == 0 && Minutes_TimerThree == 0 && Seconds_TimerThree == 0) {
        [TimerThree invalidate];
        TimerThree = nil;
        self.PickerViewSelectorThree.hidden = false;
        [_StartButtonThree setTitle:@"Start" forState:UIControlStateNormal];
        [_StartButtonThree setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        RunningTimerThree = NO;
        self.ResetButtonThree.hidden = TRUE;
        self.TimerLabelThree.hidden = TRUE;
        [self InitialTimeSetThree];
        [self AlertNotification];
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
    
    _PickerViewSelector.tag = 1;
    _PickerViewSelectorTwo.tag = 2;
    _PickerViewSelectorThree.tag = 3;
    
    
    if (pickerView.tag ==1){
        Hours_TimerOne = [self.PickerViewSelector selectedRowInComponent:0];
        Minutes_TimerOne = [self.PickerViewSelector selectedRowInComponent:1];
        Seconds_TimerOne = [self.PickerViewSelector selectedRowInComponent:2];
    }
    else if (pickerView.tag ==2){
        Hours_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:0];
        Minutes_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:1];
        Seconds_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:2];
    }
    else if (pickerView.tag ==3){
        Hours_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:0];
        Minutes_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:1];
        Seconds_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:2];
    }
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

#pragma mark Alert Notification Method
- (void) AlertNotification{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Time is up" message:@"Press OK to dismiss" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OKpressed = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [alert dismissViewControllerAnimated:YES completion:nil]; [playAlarm stop];}];
    
    if (alert != nil) {
        [playAlarm play];
        playAlarm.numberOfLoops = -1; //infinite loop
    }
    [alert addAction:OKpressed];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark Keyboard return key Method
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark Keyboard Background pressed Method
- (IBAction)backgroundPressed:(id)sender {
    if ([self.TimerTextFieldOne isFirstResponder]){
        [self.TimerTextFieldOne resignFirstResponder];
    }
    if ([self.TimerTextFieldTwo isFirstResponder]){
        [self.TimerTextFieldTwo resignFirstResponder];
    }
    if ([self.TimerTextFieldThree isFirstResponder]){
        [self.TimerTextFieldThree resignFirstResponder];
    }
}

@end

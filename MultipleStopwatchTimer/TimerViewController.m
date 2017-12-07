//
//  TimerViewController.m
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
     // Need to initialise my picker view's delegate and data source so it will display the data the picker view. It is equal to self since the delegate and data source is within this class
    self.TimerLabelOne.hidden = TRUE;
    // I would like the timer label hidden when we are yet to set the time of the timer
    self.ResetButtonOne.hidden = TRUE;
    // Reset button not required when timer is not set
    RunningTimerOne = NO;
    // Initialise this boolean variable to NO. when timer is running, it will be YES.
    [_StartButtonOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    //I want my start button to be green
    
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
        // Need to initialise the audio in the app. I had to do some research in how to add audio to the view controller. We need to insert a file which is under the "Supported Files" Folder. Before we set the audio, we need to declare an NSString and NSURL. The play alarm will use NSURL declared name and the NSURL will use the NSString variable name. In the pathForResource section, we must quote the audio file name that we are going to use and in the ofType section, we must quote the type of audio file we are using i.e. In this case it is .mp3 file. In the NSURL, we use a method that mentions were our audio file is located. In this case it is "path", as this is the location set. The playalarm variable will need to allocate the AVAudioplayer and its initWithContentsofURL will be the URL variable I declared which is "AlarmUrl". The error is set to NULL, which means that it will ignore any errors present within the object
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Timer One
#pragma mark Timer One Actions

- (IBAction)StartButtonOnePressed:(UIButton *)sender {
    if (Hours_TimerOne !=0 || Minutes_TimerOne !=0 || Seconds_TimerOne !=0){
        // It was neccesary to have this if statement because I did not want the alarm to play when somebody presses the start button when the timer is set to 0 hours, 0 minutes and 0 seconds
    self.PickerViewSelector.hidden = true;
    self.TimerLabelOne.hidden = false;
    self.HoursMinutesSecondsLabelOne.hidden = true;
        // When the timer is running, I want the picker view to be hidden and the Timer Label to be shown so we can keep track of the timer
    if (RunningTimerOne ==NO) {
        // This Boolean expression will initially be NO and turn to YES when the timer is running
        RunningTimerOne = YES;
        self.ResetButtonOne.hidden = FALSE;
        [_StartButtonOne setTitle:@"Pause" forState:UIControlStateNormal];
        [_StartButtonOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

        
        if (TimerOne == nil){
            TimerOne = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimerOne) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:TimerOne forMode:NSRunLoopCommonModes];
            // The NSRunLoop method was very important in this app. It is there to improve the performance of the NSTimer and mainly needed so the timer is still running when you are scrolling the view
        }
    }
    else {
        [self PauseTimerOne];
    }
    [self FinishedTimerOneAlarm];
        // This method will perform when the timer is up
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
    
    // This method will perform when the NSTimer is running.
    
    [self FinishedTimerOneAlarm];
    // This method wil perform when the timer has reached 0 seconds
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
        
        //When the timer is up, all the neccesary functions will be performed including an Alert Notification which I have commented about on the bottom of this main file
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
            [[NSRunLoop currentRunLoop] addTimer:TimerTwo forMode:NSRunLoopCommonModes];
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
            [[NSRunLoop currentRunLoop] addTimer:TimerThree forMode:NSRunLoopCommonModes];
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
    //This delegate method was required so the picker view would display the row numbers in each component
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component{
    
    _PickerViewSelector.tag = 1;
    _PickerViewSelectorTwo.tag = 2;
    _PickerViewSelectorThree.tag = 3;
    
    //Before I give all 3 of my picker view some tag numbers, when I set the time for timer "1" and adjust the picker view for timer "2" or "3", timer "1" would reset back from the time it was originally set too. If you run my previous versions with all 3 timers, you will understand what I am talking about. Hence it was important for me to give each picker view a tag number so there would be no conflicts between the 3 timers
    
    
    if (pickerView.tag ==1){ //Timer one
        Hours_TimerOne = [self.PickerViewSelector selectedRowInComponent:0];
        Minutes_TimerOne = [self.PickerViewSelector selectedRowInComponent:1];
        Seconds_TimerOne = [self.PickerViewSelector selectedRowInComponent:2];
    }
    else if (pickerView.tag ==2){ //Timer Two
        Hours_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:0];
        Minutes_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:1];
        Seconds_TimerTwo = [self.PickerViewSelectorTwo selectedRowInComponent:2];
    }
    else if (pickerView.tag ==3){ //Timer Three
        Hours_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:0];
        Minutes_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:1];
        Seconds_TimerThree = [self.PickerViewSelectorThree selectedRowInComponent:2];
    }
}

#pragma mark Picker view Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3; // This data source method was needed so it could display 3 components in the view
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    
    NSInteger rows;
    
    if (component == 0) { // 100 rows so the user can select a max hours of 99
        rows = 100;
    }
    else if (component == 1) { // 60 rows so user can select up to 59 minutes
        rows = 60;
    }
    else if (component == 2) { // 60 rows so user can select up to 59 seconds
        rows = 60;
    }
    
    return rows;
    
    // This method was to set the number of rows in each component.
}

#pragma mark Alert Notification Method
- (void) AlertNotification{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Time is up" message:@"Press OK to dismiss" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OKpressed = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [alert dismissViewControllerAnimated:YES completion:nil]; [playAlarm stop];}];
    
    // To set an alert notification, we need an Alert Controller that will display the alert message and an Alert Action that will give the user to perform an action when the Alert message has popped up. In this case we want the user to press OK to clear the Alert Message.
    
    // For UIAlertController, the alertControllerWithTitle is setting the title name, message is setting the text below the title, preferredStyle is setting the style of the alert controller.
    
    // For UIAlertAction, actionWithTitle is setting the text for the button, style is setting the style of the of the action and the handler is what you would like to happen when the OK button has been pressed. In this case we would like to dismiss the Alert Notification and stop the audio that we have set.
    
    if (alert != nil) { // i.e if alert is currently needed to be used, then perform the action in this if statement
        [playAlarm play];
        playAlarm.numberOfLoops = -1; //infinite loop
    }
    [alert addAction:OKpressed]; // Adding an action to the alert
    [self presentViewController:alert animated:YES completion:nil]; //Adding the Alert Notification to the view controller.
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

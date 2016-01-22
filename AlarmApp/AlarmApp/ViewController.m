//
//  ViewController.m
//  AlarmApp
//
//  Created by YUGWANGYONG on 1/21/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize infoButton;         // 헤더 파일로부터 가져와서 선언해줌.
@synthesize mainViewController; // 헤더 파일로부터 가져와서 선언해줌.
@synthesize setupViewController; // 알람 설정 화면 구현시 사용.

- (void)viewDidLoad {

    // Do any additional setup after loading the view, typically from a nib.
    // 스토리보드에 있는 객체를 가져오는데 사용.
    MainViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainViewController = viewController;
    
    // infoButton 뒤로 MainViewController.view를 넣는다.
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    [super viewDidLoad];
}

// 알람 여부 및 시간을 설정합니다.
-(void) AlarmSetting {
    mainViewController.pAlarmOnOff = setupViewController.switchControl.on;
    
    if(mainViewController.pAlarmOnOff == YES){ // 알람이 설정 되어 있을 경우
        NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSDate *date = [setupViewController.pDatePicker date];
        NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
        mainViewController.pAlarmHour = (int)[comps hour]; // 알람 시간
        mainViewController.pAlarmMinute = (int)[comps minute]; // 알람 분
    }
}

// 알람 설정 버튼을 클릭하면 호출
-(IBAction)setupClick {
    if(setupViewController == nil)
        setupViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SetupViewController"];
    
    [self presentViewController:setupViewController animated:YES completion:nil];
}

// 알람 설정 화면에서 완료 버튼을 클릭하면 호출
-(IBAction)closeClick {
    [self AlarmSetting];
    [setupViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

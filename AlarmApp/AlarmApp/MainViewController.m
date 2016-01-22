//
//  MainViewController.m
//  AlarmApp
//
//  Created by YUGWANGYONG on 1/21/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [self onTimer]; // 타이머를 설정
    timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    // 현재 시간을 뷰에 표현할 폰트를 설정합니다.
    [clockDisplay setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:64.0]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)onTimer {
    int phour, pminute, psecond;
    
    NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |
    NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDate *date = [NSDate date]; // 현재 시간을 구한다.
    NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
    phour = (int)[comps hour]; // 현재 시간 : 시
    pminute = (int)[comps minute]; // 현재 시간 : 분
    psecond = (int)[comps second]; // 현재 시간 : 초
    // 현재 시간을 화면에 출력합니다.
    clockDisplay.text = [NSString stringWithFormat:@"%02d:%02d:%02d", phour, pminute, psecond];
    
    pClockView.pHour = phour;
    pClockView.pMinute = pminute;
    pClockView.pSecond = psecond;
    // 아날로그시계 뷰를 다시 그린다.
    [pClockView setNeedsDisplay];
    if (self.pAlarmOnOff == YES)
        if(self.pAlarmHour == phour && self.pAlarmMinute == pminute && psecond == 0)
            [self messageDisplay];
}

// UIAlertView deprecated in iOS9.0
// 아래와 같이 사용한다.
-(void)messageDisplay {
    //Step 1: Create a UIAlertController
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"알람시계"
                                  message:@"약속시간입니다."
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    //Step 2: Create a UIAlertAction that can be added to the alert
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             //Do some thing here, eg dismiss the alertwindow
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    //Step 3: Add the UIAlertAction ok that we just created to our AlertController
    [alert addAction: ok];
    
    //Step 4: Present the alert to the user
    [self presentViewController:alert animated:YES completion:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

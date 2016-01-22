//
//  MainViewController.h
//  AlarmApp
//
//  Created by YUGWANGYONG on 1/21/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainClockView.h"

@interface MainViewController : UIViewController{
    NSTimer *timer; // 타이머 객체
    IBOutlet UILabel *clockDisplay; // 디지털시계를 표현할  Label 참조 변수
    IBOutlet MainClockView *pClockView; // 아날로그시계를 표현할 UIView 참조 변수
}

-(void)onTimer; // 타이머 이벤트 핸들러
@property Boolean pAlarmOnOff; // 알람 여부
@property int pAlarmHour;   // 알람 시간
@property int pAlarmMinute; // 알람 분

@end

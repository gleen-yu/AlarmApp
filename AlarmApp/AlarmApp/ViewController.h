//
//  ViewController.h
//  AlarmApp
//
//  Created by YUGWANGYONG on 1/21/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h" // MainView Controller
#import "SetupViewController.h"

@interface ViewController : UIViewController
// 알람 설정 버튼 아울렛 객체
@property (weak, nonatomic) IBOutlet UIButton *infoButton; // Button
@property (strong, nonatomic) MainViewController *mainViewController; // MainView Controller
@property (strong, nonatomic) SetupViewController *setupViewController;

-(IBAction)setupClick; // 알람 설정 버튼 클릭시 호출되는 메서드
-(IBAction)closeClick; // 알람 설정 화면에서 완료 버튼 클릭시 호출되는 메서드
-(void)AlarmSetting; // 알람 설정 메서드

@end


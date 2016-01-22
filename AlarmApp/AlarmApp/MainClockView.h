//
//  MainClockView.h
//  AlarmApp
//
//  Created by YUGWANGYONG on 1/21/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainClockView : UIView {
    // 쿼츠 2D는 아이폰과 맥 OS에서 사용할 수 있는 2차원 그래픽 엔진.
    // 드로잉 API, 색상 관리, PDF 생성, 쉐이딩 외 다양한 API 제공
    // 아이폰에는 쿼츠 2D, Core Graphics, Open ES, Core Animatino 등 프레임워크 제공.
    
    CGImageRef imgClock; // 쿼츠(Quartz)에서 사용하는 이미지
    int pHour; // 현재 시간 : 시
    int pMinute; // 현재 시간 : 분
    int pSecond; // 현재 시간 : 초
    
}

-(void) drawLine:(CGContextRef)context; // 선을 화면에 그린다.
-(void) drawClockBitmap:(CGContextRef)context; // 시계 이미지를 화면에 그린다.
-(void) DrawSecond:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY; // 초침
-(void) DrawMinute:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY; // 분침
-(void) DrawHour:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY; // 시침

@property int pHour;
@property int pMinute;
@property int pSecond;

@end

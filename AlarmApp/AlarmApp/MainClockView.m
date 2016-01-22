//
//  MainClockView.m
//  AlarmApp
//
//  Created by YUGWANGYONG on 1/21/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import "MainClockView.h"

#define SECOND_WIDTH 100
#define MINUTE_WIDTH 75
#define HOUR_WIDTH 50

@interface MainClockView ()

@end

@implementation MainClockView

@synthesize pHour;
@synthesize pMinute;
@synthesize pSecond;

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder]; // initWithCoder Method
    UIImage *img = [UIImage imageNamed:@"clock.png"]; // 시계 이미지를 불러온다.
    imgClock = CGImageRetain(img.CGImage); // CGImageRef형으로 변환.
    return self;
}
-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawClockBitmap:context]; // 시계 이미지를 화면으로 출력합니다.
    [self drawLine:context]; // 시, 분, 초를 화면으로 출력합니다.
}

-(void)drawLine:(CGContextRef)context{
    int centerX = self.bounds.size.width / 2;
    int centerY = self.bounds.size.height /2;
    
    [self DrawSecond:context CenterX:centerX CenterY:centerY]; // 초침을 그린다.
    [self DrawMinute:context CenterX:centerX CenterY:centerY]; // 분침을 그린다.
    [self DrawHour:context CenterX:centerX CenterY:centerY]; // 시침을 그린다.
}

-(void)DrawSecond:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY {
    // 현재 초에 해당되는 좌표를 구한다.
    int newX, newY;
    newX = (int)(sin(pSecond * 6 * 3.14/180) * SECOND_WIDTH + pCenterX);
    newY = (int)(CenterY - (cos(pSecond * 6 * 3.14/180) * SECOND_WIDTH));
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0); // 색상 지정
    
    CGContextSetLineWidth(context, 2.0); // 선이ㅡ 굵기 지정
    CGContextMoveToPoint(context, pCenterX, CenterY); // 선의 시작점 지정
    CGContextAddLineToPoint(context, newX, newY); // 선의 끝점 지정
    CGContextStrokePath(context); // 선 그리기
}

-(void)DrawMinute:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY  {
    int newX, newY;
    // 분침의 끝점 좌표를 구합니다.
    newX = (int)(sin(pMinute * 6 *3.14/180) *MINUTE_WIDTH + pCenterX);
    newY = (int)(CenterY - (cos(pMinute * 6 * 3.14/180) * MINUTE_WIDTH));
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0); // 색상 지정
    
    CGContextSetLineWidth(context, 3.0); // 선이ㅡ 굵기 지정
    CGContextMoveToPoint(context, pCenterX, CenterY); // 선의 시작점 지정
    CGContextAddLineToPoint(context, newX, newY); // 선의 끝점 지정
    CGContextStrokePath(context); // 선 그리기
}

-(void)DrawHour:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY {
    int newX, newY;
    
    // 시침의 끝점 좌표를 구합니다.
    newX = (int)(sin(pHour * 30 * 3.14/180) * HOUR_WIDTH + pCenterX);
    newY = (int)(CenterY - (cos(pHour * 30 * 3.14 / 180) * HOUR_WIDTH));
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0); // 색상 지정
    
    CGContextSetLineWidth(context, 4.0); // 선이ㅡ 굵기 지정
    CGContextMoveToPoint(context, pCenterX, CenterY); // 선의 시작점 지정
    CGContextAddLineToPoint(context, newX, newY); // 선의 끝점 지정
    CGContextStrokePath(context); // 선 그리기
    
}

-(void)drawClockBitmap:(CGContextRef)context {
    CGContextSaveGState(context); // CTM의 이전 상태를 저장
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height); // 좌표의 원점을 이동
    CGContextScaleCTM(context, 1.0, -1.0); // 좌표계 비율을 바꿈
    CGContextClipToRect(context, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
    CGContextDrawImage(context, CGRectMake(0, 0, CGImageGetWidth(imgClock), CGImageGetHeight(imgClock)), imgClock); // 이미지를 화면에 출력
    
    CGContextRestoreGState(context); // CTM의 이전 상태를 복구
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

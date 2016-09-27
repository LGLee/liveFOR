//
//  NSDate+LGAdjustDate.h
//  作用：日期相关操作
//
//  作者：LGLee
//
//  时间：2016年04月13日

// 简介：判断一个时间是否是今年，是否是今天，是否是昨天，是否是明天，获取跟当前时间差值

#import <Foundation/Foundation.h>

@interface NSDate (LGAdjustDate)

/**
 *  是否为今年
 */
- (BOOL)isThisYear;
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为明天
 */
- (BOOL)isTomorrow;

/**
 *  获得跟当前时间（now）的差值
 */
- (NSDateComponents *)intervalToNow;


@end

//
//  NSDate+LGAdjustDate.m
//  作用：日期相关操作
//
//  作者：LGLee
//
//  时间：2016年04月13日

// 简介：判断一个时间是否是今年，是否是今天，是否是昨天，是否是明天，获取跟当前时间差值

#import "NSDate+LGAdjustDate.h"

@implementation NSDate (LGAdjustDate)

static NSDateFormatter *formatter_;
+ (void)load
{
    formatter_ = [[NSDateFormatter alloc] init];
}

/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}
/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return nowCmps.year == selfCmps.year
    && nowCmps.month == selfCmps.month
    && nowCmps.day == selfCmps.day;
}
/**
 *  是否为昨天
 */
- (BOOL)isYesterday
{
    formatter_.dateFormat = @"yyyy-MM-dd";
    
    // 产生只有年月日，没有时分秒的字符串
    NSString *nowString = [formatter_ stringFromDate:[NSDate date]];
    // 产生只有年月日，没有时分秒的日期
    NSDate *nowDate = [formatter_ dateFromString:nowString];
    
    // 产生只有年月日，没有时分秒的字符串
    NSString *selfString = [formatter_ stringFromDate:self];
    // 产生只有年月日，没有时分秒的日期
    NSDate *selfDate = [formatter_ dateFromString:selfString];
    
    // 获得2个日期之间的差值
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    // 2014-12-31 19:20:30 -> 2014-12-31 00:00:00
    // 2015-01-01 02:20:30 -> 2015-01-01 00:00:00
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

/**
 *  是否为明天
 */
- (BOOL)isTomorrow
{
    formatter_.dateFormat = @"yyyy-MM-dd";
    
    // 产生只有年月日，没有时分秒的字符串
    NSString *nowString = [formatter_ stringFromDate:[NSDate date]];
    // 产生只有年月日，没有时分秒的日期
    NSDate *nowDate = [formatter_ dateFromString:nowString];
    
    // 产生只有年月日，没有时分秒的字符串
    NSString *selfString = [formatter_ stringFromDate:self];
    // 产生只有年月日，没有时分秒的日期
    NSDate *selfDate = [formatter_ dateFromString:selfString];
    
    // 获得2个日期之间的差值
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    // 2014-12-31 19:20:30 -> 2014-12-31 00:00:00
    // 2015-01-01 02:20:30 -> 2015-01-01 00:00:00
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
}

/**
 *  获得跟当前时间（now）的差值
 */
- (NSDateComponents *)intervalToNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}

@end

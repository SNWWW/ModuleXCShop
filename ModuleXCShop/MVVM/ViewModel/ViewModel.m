//
//  ViewModel.m
//  ModuleXCShop
//
//  Created by snlo on 2019/3/16.
//  Copyright © 2019 XCShop. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

- (NSDateComponents *)date:(NSString **)weekday {
	NSCalendar  * calendar = [NSCalendar  currentCalendar];
	NSUInteger  unitFlags = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute |NSCalendarUnitSecond;
	NSDateComponents * conponent = [calendar components:unitFlags fromDate:[NSDate date]];
	
	NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
	
	*weekday = weekdays[conponent.weekday];
	
	return conponent;
}



@end

//
//  singleton.m
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/8/6.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import "singleton.h"

@implementation singleton

static singleton *singletonData = nil;
+(singleton *)shareData {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singletonData = [[singleton alloc] init];
    });
    return singletonData;
}
-(id)init {
    if (self = [super init]) {
    }
    return self;
}

@end

//
//  singleton.h
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/8/6.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singleton : NSObject

+(singleton *)shareData;
@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSString *key;



@end

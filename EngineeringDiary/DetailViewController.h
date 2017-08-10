//
//  DetailViewController.h
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/7/31.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end


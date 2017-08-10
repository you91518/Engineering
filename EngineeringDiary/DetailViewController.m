//
//  DetailViewController.m
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/7/31.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import "DetailViewController.h"

#import "CoreDataManager.h"
#import "EngineeringDiary+CoreDataModel.h"
#import "singleton.h"

@interface DetailViewController ()
{

    CoreDataManager * dataManager;


}
@property (weak, nonatomic) IBOutlet UINavigationItem *creatNewItem;

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    NSString *strB = [singleton shareData].value;
    
    NSLog(@"ssss:%@",strB);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDate *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}



@end

//
//  CriterionViewController.m
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/8/6.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import "CriterionViewController.h"

@interface CriterionViewController ()

@end

@implementation CriterionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"工程規範";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)normal:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cpami.gov.tw/chinese/index.php?option=com_content&view=article&id=9887&Itemid=50"]];
    
}
- (IBAction)build:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cpami.gov.tw/chinese/index.php?option=com_content&view=article&id=9918&Itemid=50"]];
}
- (IBAction)road:(id)sender {
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cpami.gov.tw/chinese/index.php?option=com_content&view=article&id=9942&Itemid=50"]];
}
- (IBAction)Sewerage:(UIButton *)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cpami.gov.tw/chinese/index.php?option=com_content&view=article&id=16356&Itemid=50"]];
}

@end

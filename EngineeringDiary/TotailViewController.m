//
//  TotailViewController.m
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/8/6.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import "TotailViewController.h"

@interface TotailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TotailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Totail" forIndexPath:indexPath];
    
//    NSArray * checkList = self.plistDictionary.allKeys;
//    cell.textLabel.text = checkList[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    CheckData * checkTitle = [CheckData new];
//    checkTitle.checkTitle =  self.plistDictionary.allKeys[indexPath.row];
//    checkTitle.checkSubtitle = self.plistDictionary.allValues[indexPath.row];
//    
//    for (NSDictionary * aaa in checkTitle.checkSubtitle) {
//        NSLog(@"dfdf:%@",aaa.allKeys);
//    }
//    
//    
//    CheckDetailTableViewController * nextgPage = [self.storyboard instantiateViewControllerWithIdentifier:@"CheckDetailTableViewController"];
//    
//    NSLog(@"sdsd:%@",checkTitle.checkTitle);
//    
//    
//    
//    [self.navigationController pushViewController:nextgPage animated:YES];
    
    
    
}

@end

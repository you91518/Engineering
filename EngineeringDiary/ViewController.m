//
//  ViewController.m
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/8/4.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import "ViewController.h"
#import "CheckDetailTableViewController.h"
#import "singleton.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>



@property (weak, nonatomic) IBOutlet UITableView *checkTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    


    
    
    NSString * path = [NSString stringWithFormat:@"%@/Documents/CheckView.plist",NSHomeDirectory()];
    
    _plistDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    self.navigationItem.title = @"檢查表總覽";
    
    NSLog(@"%@",path);
   
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
    return self.plistDictionary.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Check" forIndexPath:indexPath];
    
    NSArray * checkList = self.plistDictionary.allKeys;
    cell.textLabel.text = checkList[indexPath.row];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString * checkTitle =  self.plistDictionary.allKeys[indexPath.row];
    NSMutableDictionary * subtitleDictionary = self.plistDictionary.allValues[indexPath.row];
    
    NSLog(@"%@",self.plistDictionary.allValues);
    
//    for (NSString * bbb in checkTitle.checkSubtitle.allKeys) {
//        NSLog(@"%@",checkTitle.checkSubtitle[bbb]);
//    }
//    
    singleton * oneS = [singleton shareData];
    
    oneS.key = checkTitle;

    
    CheckDetailTableViewController * nextgPage = [self.storyboard instantiateViewControllerWithIdentifier:@"CheckDetailTableViewController"];
    
    nextgPage.navigationItem.title = checkTitle;
    
    nextgPage.checkDictionary = self.plistDictionary;
    nextgPage.data = subtitleDictionary;
    
    
//    NSLog(@"ddd:%@",subtitleDictionary.allValues.count);
   
    
    [self.navigationController pushViewController:nextgPage animated:YES];
    
    
    
}

@end

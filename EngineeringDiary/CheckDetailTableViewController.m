//
//  CheckDetailTableViewController.m
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/8/4.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import "CheckDetailTableViewController.h"
#import "ViewController.h"
#import "singleton.h"

#import "CoreDataManager.h"

@interface CheckDetailTableViewController ()




@end

@implementation CheckDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSLog(@"lll:%@",self.data.allValues);
    
 
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    
    
    return self.data.allKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CheckDetail" forIndexPath:indexPath];
    
    
    
    cell.textLabel.text = self.data.allKeys[indexPath.row];
    cell.detailTextLabel.text = self.data.allValues[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"修改" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    
    //Prepare Name Field
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        
        
        textField.text = self.data.allKeys[indexPath.row];
        
    }];
     
        
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
            textField.text = self.data.allValues[indexPath.row];
    }];
    
    
    
    //Prepare OK Button
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString * key = [singleton shareData].key;
        
        NSString * path = [NSString stringWithFormat:@"%@/Documents/CheckView.plist",NSHomeDirectory()];
        [_checkDictionary[key] setValue:alert.textFields[1].text forKey:alert.textFields[0].text];
        [_checkDictionary writeToFile:path atomically:YES];
        [self.tableView reloadData];
        
    }];
    
    //Prepare Cancel Button
    
    UIAlertAction * cencel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
      
    }];
    
    //Show Alert
    
    [alert addAction:ok];
    [alert addAction:cencel];
    [self presentViewController:alert animated:true completion:nil];
    

    
                          
     }
     
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

     @end

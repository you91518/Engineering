//
//  MasterViewController.m
//  EngineeringDiary
//
//  Created by 黃教銓 on 2017/7/31.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CoreDataManager.h"
#import "EngineeringDiary+CoreDataModel.h"
#import "singleton.h"


@interface MasterViewController ()
{

    CoreDataManager<EngineeringData*> * dataManager;

}

//@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.navigationItem.title = @"EngineeringDiary";
    
    //Prepare dataManager.
    dataManager = [[CoreDataManager alloc] initWithModel:@"EngineeringDiary" dbFileName:@"engineeringData.sqlite" dbPathURL:nil sortKey:@"idName" entityName:@"EngineeringData"];
    
    //Demo of search for keyword
//    NSArray * results = [dataManager searchAtField:@"name" forKeyword:@"Huang"];
//    NSLog(@"Search Results: %@",results.description);
//    for (Friend * tmp in results) {
//        NSLog(@"Friend: %@ (%@)",tmp.name,tmp.telephone);
//    }
    
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    
    [self editWithItem:nil withCompletion:^(BOOL success, EngineeringData *result) {
        if (success) {
            [dataManager saveContextWithCompletion:^(BOOL success) {
                if (success) {
                    [self.tableView reloadData];
                }
            }];
        }
    }];
   
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = dataManager[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
//        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        
        EngineeringData * item = [dataManager itemWithIndex:indexPath.row];
        controller.navigationItem.title = item.idName ;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataManager count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    EngineeringData * item = [dataManager itemWithIndex:indexPath.row];
    cell.textLabel.text = item.idName;
    
    singleton * oneS = [singleton shareData];
    
    oneS.value =item.idName;
    
    
    
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
    
    EngineeringData * item = [dataManager itemWithIndex:indexPath.row];
    [dataManager deleteItem:item];
    [dataManager saveContextWithCompletion:^(BOOL success) {
        if (success) {
            [self.tableView reloadData];
        }
    }];
        
    }else if (editingStyle == UITableViewCellEditingStyleInsert){
    
    
    }
        
        

}

typedef void (^EditItemCompletion)(BOOL success,EngineeringData * result);


-(void) editWithItem:(EngineeringData*)item withCompletion:(EditItemCompletion) completion{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"建立新專案" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    //Prepare Name Field
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"專案名稱";
        textField.text = item.idName;
        
        
        
    }];
    
   
    
    //Prepare OK Button
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (completion == nil) {
            return ;
        }
        
        if (alert.textFields[0].text == nil) {
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"內容不能為空" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:true completion:nil];
            
            return;
            
        }
        
        EngineeringData * finalItem = item;
        if (finalItem == nil) {
            finalItem = [dataManager createItem];
            
        }
        
        
        
        finalItem.idName = alert.textFields[0].text;
        
        
        
        completion(true,finalItem);
    }];
    
    //Prepare Cancel Button
    
    UIAlertAction * cencel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (completion != nil) {
            completion(false,nil);
        }
    }];
    
    //Show Alert
    
    [alert addAction:ok];
    [alert addAction:cencel];
    [self presentViewController:alert animated:true completion:nil];
    
}





@end

//
//  CoreDataManager.h
//  HelloMyCoreDataManager
//
//  Created by 黃教銓 on 2017/7/14.
//  Copyright © 2017年 黃教銓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager<ItemType> : NSObject

typedef void (^SaveCompletion)(BOOL success);

- (instancetype) initWithModel:(NSString*)model
                    dbFileName:(NSString*) dbFileName
                     dbPathURL:(NSURL*)dbPathURL
                       sortKey:(NSString*)sortKey
                    entityName:(NSString*)entityName;

- (void)saveContextWithCompletion:(SaveCompletion)completion;

-(ItemType) createItem;
-(void) deleteItem:(ItemType) item;
-(ItemType) itemWithIndex:(NSInteger) index;

-(NSArray*) searchAtField:(NSString*) field
               forKeyword:(NSString*) keyword;
-(NSInteger)count;


@end

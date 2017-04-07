//
//  DatabaseLib.h
//  Day25_studentApp
//
//  Created by Student 12 on 4/4/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface DatabaseLib : NSObject
{
    sqlite3 *studDatabase;
}
+(instancetype)getSharedObject;
-(void)createDatabase;
-(NSString *)getDatabasePath;
-(int)executeQuery:(NSString *)query;
-(NSArray *)getAllTasks:(NSString *)query;
-(NSArray *)getAllTasks1:(NSString *)query;

@property NSMutableArray *RollArray;
@end

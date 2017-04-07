//
//  DatabaseLib.m
//  Day25_studentApp
//
//  Created by Student 12 on 4/4/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "DatabaseLib.h"
#import "ViewController.h"
@implementation DatabaseLib
+(instancetype)getSharedObject
{
    DatabaseLib *sharedObject;
    if (sharedObject==nil) {
        sharedObject=[[DatabaseLib alloc]init];
        
    }
    return  sharedObject;
}
-(void)createDatabase
{
    NSString *query=@"create table if not exists studTable(roll text,name text)";
    int isSuccess=[self executeQuery:query];
    if (isSuccess) {
        NSLog(@"Database created successfully");
    }
    else
    {
        NSLog(@"Database creation failed");
        
    }
}
-(NSString *)getDatabasePath
{
    NSArray *docDir =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[[docDir firstObject]stringByAppendingString:@"studDatabase.db"];
    return dbpath;
}
-(int)executeQuery:(NSString *)query
{
    int success=0;
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    //stmt - statement handler
    if (sqlite3_open(cDatabasePath, &studDatabase)==SQLITE_OK)
    {
        if (sqlite3_prepare_v2(studDatabase, cQuery, -1, &stmt, NULL)!=SQLITE_OK)
        {
            NSLog(@"Error:%s",sqlite3_errmsg(studDatabase));
        }
        else
        {
            if (sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=1;
            }
        }
    }
    return success;
}
-(NSArray *)getAllTasks:(NSString *)query
{
    NSMutableArray *taskArray=[[NSMutableArray alloc]init];
    NSMutableArray *taskArray1=[[NSMutableArray alloc]init];
    
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    //stmt - statement handler
    if (sqlite3_open(cDatabasePath, &studDatabase)==SQLITE_OK)
    {
        if (sqlite3_prepare_v2(studDatabase, cQuery, -1, &stmt, NULL)!=SQLITE_OK)
        {
            NSLog(@"Error:%s",sqlite3_errmsg(studDatabase));
        }
        else
        {
            
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const char *task=(const char *)sqlite3_column_text(stmt, 1);
                
                const char *task1=(const char *)sqlite3_column_text(stmt, 0);
                NSString *myTask=[NSString stringWithFormat:@"%s",task];
                NSString *myTask1=[NSString stringWithFormat:@"%s",task1];
                
                [taskArray addObject:myTask];
                [taskArray1 addObject:myTask1];
                
            }
        }
    }
    return taskArray;
}
-(NSArray *)getAllTasks1:(NSString *)query
{
    //NSMutableArray *taskArray=[[NSMutableArray alloc]init];
    NSMutableArray *taskArray1=[[NSMutableArray alloc]init];
    
    const char *cQuery=[query UTF8String];
    const char *cDatabasePath=[[self getDatabasePath]UTF8String];
    sqlite3_stmt *stmt;
    //stmt - statement handler
    if (sqlite3_open(cDatabasePath, &studDatabase)==SQLITE_OK)
    {
        if (sqlite3_prepare_v2(studDatabase, cQuery, -1, &stmt, NULL)!=SQLITE_OK)
        {
            NSLog(@"Error:%s",sqlite3_errmsg(studDatabase));
        }
        else
        {
            
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
               
                const char *task1=(const char *)sqlite3_column_text(stmt, 0);
                //NSString *myTask=[NSString stringWithFormat:@"%s",task];
                NSString *myTask1=[NSString stringWithFormat:@"%s",task1];
                
               // [taskArray addObject:myTask];
                [taskArray1 addObject:myTask1];
                
            }
        }
    }
    return taskArray1;
}

@end

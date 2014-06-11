//
//  HTDBManager.m
//  J3Dps
//
//  Created by hadn't on 14-5-6.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import "HTDBManager.h"

@implementation HTDBManager

+ (void)copyFileDatabase
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *documentLibraryFolderPath = [documentsDirectory stringByAppendingPathComponent:@"jx3_sqlite3"];
    NSNumber *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"DBVersion"];

    
    if ([[NSFileManager defaultManager] fileExistsAtPath:documentLibraryFolderPath]
        && [version integerValue] == [[NSUserDefaults standardUserDefaults] integerForKey:@"DBVersion"])
    {
        NSLog(@"文件已经存在了");
        NSLog(@"无需更新");
    }
    else
    {
        if ([[NSFileManager defaultManager] fileExistsAtPath:documentLibraryFolderPath])
        {
            NSError *err = nil;
            [[NSFileManager defaultManager] removeItemAtPath:documentLibraryFolderPath error:&err];
        }
        
        NSString *resourceSampleImagesFolderPath =[[NSBundle mainBundle]
                                                   pathForResource:@"jx3_sqlite3"
                                                   ofType:@"sqlite"];
        NSData *mainBundleFile = [NSData dataWithContentsOfFile:resourceSampleImagesFolderPath];
        BOOL success = [[NSFileManager defaultManager] createFileAtPath:documentLibraryFolderPath
                                                contents:mainBundleFile
                                              attributes:nil];
        if (!success)
        {
            NSLog(@"未复制成功数据库");
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setInteger:[version integerValue] forKey:@"DBVersion"];
        }
    }
}

@end

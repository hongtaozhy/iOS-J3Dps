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
    NSString *documentLibraryFolderPath = [documentsDirectory stringByAppendingPathComponent:@"j3dps"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:documentLibraryFolderPath]) {
        NSLog(@"文件已经存在了");
    }else {
        NSString *resourceSampleImagesFolderPath =[[NSBundle mainBundle]
                                                   pathForResource:@"j3dps"
                                                   ofType:@"db"];
        NSData *mainBundleFile = [NSData dataWithContentsOfFile:resourceSampleImagesFolderPath];
        [[NSFileManager defaultManager] createFileAtPath:documentLibraryFolderPath
                                                contents:mainBundleFile
                                              attributes:nil];
    }
}

@end

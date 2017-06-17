//
//  NSJSONSerialization+CMAdditions.m
//  CityMaps
//
//  Created by mcan on 17/06/2017.
//  Copyright © 2017 mertcan. All rights reserved.
//

#import "NSJSONSerialization+CMAdditions.h"

NSString *const kCMJSONFileExtensin = @"json";

@implementation NSJSONSerialization (CMAdditions)

+ (NSDictionary *)cm_jsonDictionaryWithFileName:(NSString *)fileName
{
    NSDictionary *dictionary = [self contentsOfTheFileName:fileName];
    return dictionary;
}

+ (NSArray *)cm_jsonArrayWithFileName:(NSString *)fileName
{
    NSArray *array = [self contentsOfTheFileName:fileName];
    return array;
}

#pragma mark - Private Helpers

+ (NSString *)filePathOfFileName:(NSString *)fileName
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:fileName ofType:kCMJSONFileExtensin];
    return filepath;
}

+ (id)contentsOfTheFileName:(NSString *)fileName
{
    NSString *filePath = [self filePathOfFileName:fileName];
    return [self contentsOfTheFilePath:filePath];
}

+ (id)contentsOfTheFilePath:(NSString *)filePath
{
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath]
                                           options:0
                                             error:0];
}

@end

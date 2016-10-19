//
//  SNYKeyChain.m
//  camhow
//
//  Created by admin on 16/10/17.
//  Copyright © 2016年 camhow. All rights reserved.
//

#import "SNYKeychain.h"
#import <Security/Security.h>

@implementation SNYKeychain

+(void)removeDataForKey:(NSString *)key
{
    if (key)
    {
        NSMutableDictionary* query = [self getQueryDict];
        [query setObject:key forKey:(__bridge id)kSecAttrAccount];
        OSStatus status = SecItemDelete((CFDictionaryRef)query);
        NSLog(@"delete:%d",(int)status);    //  errSecItemNotFound 就是没有
    }
}
+(NSMutableDictionary *)getQueryDict
{
    NSDictionary* query =@{(__bridge id)kSecClass:(__bridge id)kSecClassGenericPassword,
                           (__bridge id)kSecReturnAttributes:(__bridge id)kCFBooleanTrue};
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithDictionary:query];

    return dict;
}
+(void)setData:(NSData *)data forKey:(NSString *)key
{
    if (key)
    {
        if (data)
        {
            // 先查找看看有没有
            NSMutableDictionary* query = [self getQueryDict];
            [query setObject:key forKey:(__bridge id)kSecAttrAccount];
            
            CFTypeRef result = nil;
            if (SecItemCopyMatching((CFDictionaryRef)query, &result) == noErr)
            {
                NSMutableDictionary* update = [NSMutableDictionary dictionaryWithDictionary:(__bridge NSDictionary*)result];
                // 修改要跟新的项 注意先加后删的class项
                [update setObject:data forKey:(__bridge id)kSecValueData];
                [update removeObjectForKey:(__bridge id)kSecClass];
#if TARGET_OS_SIMULATOR
                [update removeObjectForKey:(id)kSecAttrAccessGroup];
#endif
                // 得到要修改的item，根据result，但要添加class
                NSMutableDictionary* updateItem = [NSMutableDictionary dictionaryWithDictionary:(__bridge NSDictionary * _Nonnull)(result)];
                [updateItem setObject:[query objectForKey:(id)kSecClass] forKey:(id)kSecClass];
                // SecItemUpdate
                OSStatus status = SecItemUpdate((CFDictionaryRef)updateItem, (CFDictionaryRef)update);
                NSLog(@"update:%d",(int)status);
            }
            else
            {
                NSMutableDictionary* dic = [self getQueryDict];
                // 设置其他属性attributes
                [dic setObject:key forKey:(__bridge id)kSecAttrAccount];
                [dic setObject:data forKey:(__bridge id)kSecValueData];
                // SecItemAdd
                OSStatus s = SecItemAdd((CFDictionaryRef)dic, NULL);
                NSLog(@"add:%d",(int)s);
            }
        }
        else
        {
            [self removeDataForKey:key];
        }
    }
}
+(NSData *)dataForKey:(NSString *)key
{
    if (key)
    {
        // 查找条件：1.class 2.attributes 3.search option
        NSMutableDictionary* query = [self getQueryDict];
        [query setObject:key forKey:(__bridge id)kSecAttrAccount];
        CFTypeRef result = nil;
        OSStatus s = SecItemCopyMatching((CFDictionaryRef)query, &result);

        if (s == noErr)
        {
            //继续查找item的secValue
            NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:(__bridge NSDictionary * _Nonnull)(result)];
            // 存储格式
            [dic setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
            // 确定class
            [dic setObject:[query objectForKey:(__bridge id)kSecClass] forKey:(__bridge id)kSecClass];
            CFDataRef data = nil;
            // 查找secValue
            if (SecItemCopyMatching((CFDictionaryRef)dic, (CFTypeRef*)&data) == noErr)
            {
                NSData * resultData = (__bridge NSData *)(data);
                return resultData;
            }
        }
    }
    return nil;
}
@end

@implementation SNYKeychain (Cate)

+(void)setObject:(id<NSCoding>)object forKey:(NSString *)key
{
    if (object)
    {
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:object];
        [self setData:data forKey:key];
    }
    else
    {
        [self removeDataForKey:key];
    }
    
}
+(id)objectForKey:(NSString *)key
{
    NSData * data = [self dataForKey:key];
    if (data)
    {
        id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        return object;
    }
    return nil;
}
+(void)removeObjectForKey:(NSString *)key
{
    [self removeDataForKey:key];
}
@end

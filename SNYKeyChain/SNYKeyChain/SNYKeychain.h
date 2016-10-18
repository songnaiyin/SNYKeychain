//
//  SNYKeychain.h
//  camhow
//
//  Created by admin on 16/10/17.
//  Copyright © 2016年 camhow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNYKeychain : NSObject

+(void)removeDataForKey:(NSString *)key;
+(void)setData:(NSData *)data forKey:(NSString *)key;
+(NSData *)dataForKey:(NSString *)key;


@end

@interface SNYKeychain (Cate)

+(void)setObject:(id<NSCoding>)object forKey:(NSString *)key;
+(id)objecForKey:(NSString *)key;

@end

//
//  SNYKeychain.h
//  camhow
//
//  Created by admin on 16/10/17.
//  Copyright © 2016年 camhow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNYKeychain : NSObject
@end

@interface SNYKeychain (Cate)

+(void)setObject:(id<NSCoding>)object forKey:(NSString *)key;
+(id)objectForKey:(NSString *)key;
+(void)removeObjectForKey:(NSString *)key;

@end

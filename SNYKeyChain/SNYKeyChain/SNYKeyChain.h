//
//  SNYKeyChain.h
//  camhow
//
//  Created by admin on 16/10/17.
//  Copyright © 2016年 camhow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNYKeyChain : NSObject

+(void)removeDataForKey:(NSString *)key;
+(void)setData:(NSData *)data forKey:(NSString *)key;
+(NSData *)dataForKey:(NSString *)key;


@end

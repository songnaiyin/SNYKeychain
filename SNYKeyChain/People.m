//
//  People.m
//  SNYKeyChain
//
//  Created by admin on 16/10/18.
//  Copyright © 2016年 camhow. All rights reserved.
//

#import "People.h"

@implementation People
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"name = %@",self.name];
}
@end

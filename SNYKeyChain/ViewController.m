//
//  ViewController.m
//  SNYKeyChain
//
//  Created by admin on 16/10/18.
//  Copyright © 2016年 camhow. All rights reserved.
//

#import "ViewController.h"
#import "SNYKeychain.h"
#import "People.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //存
    NSString * str = @"598922307";
    [SNYKeychain setObject:str forKey:@"strKey"];
    
    NSArray * arr = @[@"1",@"2",@"3"];
    [SNYKeychain setObject:arr forKey:@"arrKey"];
    
    NSDictionary * dict = @{@"k1":@"v1",@"k2":@"v2"};
    [SNYKeychain setObject:dict forKey:@"dictKey"];
    
    People * p = [[People alloc] init];
    p.name = @"sny";
    [SNYKeychain setObject:p forKey:@"pKey"];
    
    //取
    NSString * str1 = [SNYKeychain objectForKey:@"strKey"];
    NSLog(@"str1:%@",str1);
    
    NSArray * arr1 = [SNYKeychain objectForKey:@"arrKey"];
    NSLog(@"arr1:%@",arr1);
    
    NSArray * dict1 = [SNYKeychain objectForKey:@"dictKey"];
    NSLog(@"dict1:%@",dict1);
    
    People * p1 = [SNYKeychain objectForKey:@"pKey"];
    NSLog(@"p1:%@",p1);
}


@end

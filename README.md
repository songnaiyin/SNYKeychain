# SNYKeychain

简单的使用Keychain保存数据
使用方法
//存
        NSString * str = @"598922307";
        [Keychain setObject:str forKey:@"strKey"];

        NSArray * arr = @[@"1",@"2",@"3"];
        [Keychain setObject:arr forKey:@"arrKey"];

        NSDictionary * dict = @{@"k1":@"v1",@"k2":@"v2"};
        [Keychain setObject:dict forKey:@"dictKey"];

        People * p = [[People alloc] init];
        p.name = @"sny";
        [Keychain setObject:p forKey:@"pKey"];

//取
        NSString * str1 = [Keychain objecForKey:@"strKey"];
        NSLog(@"str1:%@",str1);

        NSArray * arr1 = [Keychain objecForKey:@"arrKey"];
        NSLog(@"arr1:%@",arr1);

        NSArray * dict1 = [Keychain objecForKey:@"dictKey"];
        NSLog(@"dict1:%@",dict1);

        People * p1 = [Keychain objecForKey:@"pKey"];
        NSLog(@"p1:%@",p1);

模拟器下需要把Keychain sharing打开

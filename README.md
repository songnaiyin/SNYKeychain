# SNYKeychain

简单的使用Keychain保存数据

使用方法

        pod 'SNYKeyChain'

手动配置
      
      SNYKeychain.h SNYKeychain.m 拖到项目中 引入下Security.framework即可
        

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

模拟器下需要把Keychain sharing打开

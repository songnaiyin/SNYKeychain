//
//  ViewController.m
//  SNYKeyChain
//
//  Created by admin on 16/10/18.
//  Copyright © 2016年 camhow. All rights reserved.
//

#import "ViewController.h"
#import "SNYKeyChain.h"
@interface ViewController ()
{
    
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *passwordField;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

// 查找全部
- (IBAction)selAll:(id)sender
{
    NSDictionary* query = @{(__bridge id)kSecClass:(__bridge id)kSecClassGenericPassword,
                            (__bridge id)kSecMatchLimit:(__bridge id)kSecMatchLimitAll,
                            (__bridge id)kSecReturnAttributes:(__bridge id)kCFBooleanTrue};

    CFTypeRef result = nil;
    OSStatus s = SecItemCopyMatching((CFDictionaryRef)query, &result);
    if (s == noErr)
    {
        NSLog(@"select all : %d",s);
        NSLog(@"%@",result);
        
    }
    else
    {
        NSLog(@"查询失败 : %@",result);
    }
}

- (IBAction)sel_num:(id)sender
{
    if (nameField.text.length >0)
    {
        NSData * data = [SNYKeyChain dataForKey:nameField.text];
        NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
    }
}
- (IBAction)update:(id)sender
{
    if (nameField.text.length >0 && passwordField.text.length > 0)
    {
        [SNYKeyChain setData:[passwordField.text dataUsingEncoding:NSUTF8StringEncoding] forKey:nameField.text];
    }
}
- (IBAction)delete:(id)sender
{
    if (nameField.text.length >0)
    {
        [SNYKeyChain removeDataForKey:nameField.text];
    }
}


@end

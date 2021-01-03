//
//  BlocksAndCompletionHandlerSyntax.m
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 19/10/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

#import "BlocksAndCompletionHandlerSyntax.h"
#import "SyntaxiOS-Swift.h"
typedef NSString *(^BlockTypeName)(NSString *, int);

@interface BlocksAndCompletionHandlerSyntax ()
@property (nonatomic, strong) NSString *(^blockAsAMemberVar)(NSString *, NSDictionary *);
@property (nonatomic, strong) NSString *(^tempBlock)(NSString *, int);
@end

@implementation BlocksAndCompletionHandlerSyntax

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BlockTypeName blockName = ^NSString *(NSString *a, int b) {
        return @"sssd";
    };
    
    _tempBlock = blockName;
    
    // property initialise
    self.blockAsAMemberVar = ^NSString *(NSString *name, NSDictionary *dict) {
        return name;
    };
    
    NSLog(@"%@", self.blockAsAMemberVar(@"hello", @{@"asaaa" : @"ffff"}));
    
    // Block as a local variable
    int (^howmany1)(int, int) = ^(int a, int b){
        return a + b;
    };
    
    int x = howmany1(5, 10);
    printf("%d ddd", x);
    
    [self addNumber:5 withNumber:7 andCompletionHandler:^(int result) {
        NSLog(@"The result is %d", result);
    }];
    
    [self handleActionForFeed:@"ss" withType:@"ss" performAction:^(NSString *pqe) {
        
    } tableViewActions:^NSString *(NSString *aaaa, NSString *bbb) {
        return [aaaa stringByAppendingString:bbb];
    }];
    
    ClosureSyntax *t = [[ClosureSyntax alloc] init];
    t.closureName = ^NSString * _Nonnull(NSString * _Nonnull value) {
        return value;
    };
}

-(void)testBlockStorageType{
    __block int someValue = 10;
    
    int (^myOperation)(void) = ^(void){
        someValue += 5;
        
        return someValue + 10;
    };
    
    NSLog(@"%d", myOperation());
}

// blocks as method parameter
-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler{
    int result = number1 + number2;
    completionHandler(result);
}

- (void)handleActionForFeed:(NSString *)feed withType:(NSString *)type performAction:(void(^)(NSString *))performAction tableViewActions:(nullable NSString *(^)(NSString *, NSString *))tableViewActions {
    
    NSString *temp = tableViewActions(@"aa", @"bb");
    NSLog(@"%@", temp);
}

@end

//
//  TestSyntax.m
//  SyntaxiOS
//
//  Created by Abhishek Kumar on 26/10/19.
//  Copyright © 2019 Abhishek Kumar. All rights reserved.
//

#import "TestSyntax.h"

@interface TestSyntax ()

@end

@implementation TestSyntax

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(BOOL)isDarkColor:(UIColor *)color {
    const CGFloat *componentColors = CGColorGetComponents(color.CGColor);
    CGFloat colorBrightness = ((componentColors[0] * 212) + (componentColors[1] * 715) + (componentColors[2] * 72)) / 1000;
    if (colorBrightness < 0.5) {
        return YES;
    } else {
        return NO;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

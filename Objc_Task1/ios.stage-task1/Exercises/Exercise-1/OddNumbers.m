//
//  OddNumbers.m
//  ios.stage-task1
//
//  Created by Alex Tsybulko on 4.05.21.
//

#import <Foundation/Foundation.h>
#import "OddNumbers.h"

@implementation OddNumbers

- (NSInteger)oddNumbers:(NSArray<NSNumber *> *)collection {
    NSInteger oddResult = 0;
    for (NSNumber *number in collection) {
        if ([number integerValue] %2 !=0) {
            oddResult++;
        }
    }
    return oddResult;
}

@end

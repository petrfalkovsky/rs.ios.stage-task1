#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    
    if (self.count == 0) 
        return nil;
    
    // обозначаю границы поиска слева направво с начала масива от нуля и до конца self.count - 1
    NSInteger left = 0;
    NSInteger right = self.count - 1;
    
    
    while (left < right) {
        NSInteger mid = left + (right - left) / 2;
        
    if ([self[mid] integerValue] < [self[right] integerValue]) {
            right = mid;
        } else {
            left = mid +1;
        }
    }
    
    return self[left];
}

@end


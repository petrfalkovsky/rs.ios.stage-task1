#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
    if (self.length == 0 ) return false;
    
    // от проинициализированного значние i равным 0,
    // итерируемся по длинные цикла до тех пор пока переменная i не будет меньше длинны строки self.length
    for (NSInteger i = 0; i < self.length; i++) {
          unichar character = [self characterAtIndex:i];
          if (!isdigit(character)) {
              return false;
          }
      }
    
    return true;
}

@end

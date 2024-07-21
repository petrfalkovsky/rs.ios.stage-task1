#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    if (number == nil) return @[];
    
    // Преобразуем число в строковое представление абсолютного значения
    NSString *numberString = [[number stringValue]stringByReplacingOccurrencesOfString:@"-"withString:@""];
    
    // Создаем изменяемый массив для хранения перевернутых символов
    NSMutableArray *reversedArray = [NSMutableArray arrayWithCapacity:numberString.length];
    
    // Проходим по строке в обратном порядке и добавляем каждый символ в массив
    for (NSInteger i = numberString.length - 1; i >= 0; i--) {
        NSString *charString = [NSString stringWithFormat:@"%c", [numberString characterAtIndex:i]];
        [reversedArray addObject:charString];
    }
    
    return [reversedArray copy];
}

@end

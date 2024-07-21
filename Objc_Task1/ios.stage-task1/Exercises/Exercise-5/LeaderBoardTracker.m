#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
    // Обработка крайних случаев
    if (playerArray.count == 0) return @[];
    
    
    if (rankedArray.count == 0) {
        NSMutableArray *allFirstPlace = [NSMutableArray arrayWithCapacity:playerArray.count];
        for (NSInteger i = 0; i < playerArray.count; i++) {
            [allFirstPlace addObject:@1];
        }
        return [allFirstPlace copy];
    }

    // Удаление дубликатов и сортировка в порядке убывания
    NSOrderedSet *uniqueRankedSet = [NSOrderedSet orderedSetWithArray:rankedArray];
    NSArray *uniqueRankedArray = [[uniqueRankedSet array] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO]]];
    
    NSMutableArray *rankings = [NSMutableArray arrayWithCapacity:playerArray.count];
    NSInteger rankedIndex = uniqueRankedArray.count - 1;
    
    for (NSNumber *playerScore in playerArray) {
        // Проходим по рейтингу с конца (самого низкого) к началу (самого высокому)
        while (rankedIndex >= 0 && playerScore.integerValue >= [uniqueRankedArray[rankedIndex] integerValue]) {
            rankedIndex--;
        }
        // Ранг это (rankedIndex + 1) + 1, потому что ранг это индекс+1 и нам нужна следующая позиция
        [rankings addObject:@(rankedIndex + 2)];
    }
    
    return [rankings copy];
}

@end

//
//  CardMatchingGame.m
//  PlayingCard
//
//  Created by ruby on 2018/6/18.
//  Copyright © 2018年 ruby. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;    // of Card
@end


@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

// Change these constants to modify game bounds
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BOUNS = 4;
static const int COST_TO_CHOOSE = 1;

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject: card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? self.cards[index] : nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    NSLog(@"CardMatchingGame#chooseCardAtIndex: Card is %@ and isMatched:%@", card.contents, card.isMatched ? @"YES" : @"NO");
    if (card.isChosen) {
        card.chosen = NO;
    } else {
        // match against other chosen cards
        for (Card *otherCard in self.cards) {
            if (otherCard.isChosen && !otherCard.isMatched) {
                int matchScore = [card match:@[otherCard]];
                if (matchScore) {
                    self.score += matchScore * MATCH_BOUNS;
                    // if match, mark both cards "matched"
                    otherCard.matched = YES;
                    card.matched = YES;
                } else {
                    self.score -= MISMATCH_PENALTY;
                    // if mismatch, "unchoose" the mismatching other card
                    otherCard.chosen = NO;
                }
                // can only choose 2 cards for now
                break;
            }
        }
        // makes choosing not be free
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
}

@end

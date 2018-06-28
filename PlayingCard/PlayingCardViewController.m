//
//  PlayingCardViewController.m
//  PlayingCard
//
//  Created by ruby on 2018/6/27.
//  Copyright © 2018年 ruby. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end

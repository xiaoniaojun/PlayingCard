//
//  ViewController.h
//  PlayingCard
//
//  Created by ruby on 2018/6/16.
//  Copyright © 2018年 ruby. All rights reserved.
//
// This is an Abstrict Class, should impl the abstrict methods which has been discribed below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController

- (Deck *)createDeck; // abstrict

@end


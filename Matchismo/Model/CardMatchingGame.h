//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Sheila Wheaton on 2/6/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id) initWithCardCount : (NSUInteger)cardCount usingDeck: (Deck *)deck
            matchingCards: (int) matchingCards
            matchBonus: (int) matchBonus
            mismatchPenalty: (int) mismatchPenalty
            flipCost: (int) flipCost;

- (void)flipCardAtIndex: (NSUInteger)index;

- (Card *)cardAtIndex: (NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic, readonly) NSString *status;
@property (nonatomic) int gameType;

@end

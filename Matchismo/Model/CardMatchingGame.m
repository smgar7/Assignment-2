//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Sheila Wheaton on 2/6/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@property (nonatomic) NSString *status;

@property (nonatomic) int matchingCards;
@property (nonatomic) int matchBonus;
@property (nonatomic) int mismatchPenalty;
@property (nonatomic) int flipCost;

@end

@implementation CardMatchingGame

- (NSMutableArray * )cards
{
    if (! _cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
matchingCards:(int)matchingCards matchBonus:(int)matchBonus mismatchPenalty:(int)mismatchPenalty flipCost:(int)flipCost
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
                card.faceUp = false;
                
            }
        }
        
        if (matchingCards < [self.cards count]){
            self.matchingCards = matchingCards;
        } else {
            self = nil;
        }
        
        self.matchBonus = matchBonus;
        self.mismatchPenalty = mismatchPenalty;
        self.flipCost = flipCost;
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}


- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex: index];
    self.status = @"";
    
    [self matchGame: card];
}

- (void) matchGame : (Card*) card {
    
    if (card.isUnPlayable)  return;
    if (card.isFaceUp) { card.faceUp = NO;  return;}
    
    NSMutableArray *otherCardsInPlay = [[NSMutableArray alloc] init];
    NSMutableArray *allCardsInPlay;
    
    for (Card *otherCard in self.cards) {
        if (otherCard.isFaceUp && !otherCard.isUnPlayable)
        {
            [otherCardsInPlay addObject:otherCard];
        }
    }
    
    allCardsInPlay = [otherCardsInPlay mutableCopy];
    [allCardsInPlay addObject:card];
    
    NSMutableString *chosenCards = [[NSMutableString alloc] init];
    NSString *nsChosenCards = [[NSString alloc] init];
    
    if (allCardsInPlay.count == self.matchingCards)
    {
        int matchScore = [card match: otherCardsInPlay];
        
        if (matchScore) {
            
            for (Card *otherCard in allCardsInPlay){
                otherCard.unplayable = YES;
                
                [chosenCards appendString: otherCard.contents];

            }
            self.score += matchScore * self.matchBonus;
            nsChosenCards = [NSString stringWithString: chosenCards];
           
            self.status = [NSString stringWithFormat:@"Matched: %@ for %d points.", nsChosenCards, self.matchBonus];
        }
        else {
            
            for (Card *otherCard in allCardsInPlay){
                otherCard.faceUp = NO;
                [chosenCards appendString: otherCard.contents];

            }
            nsChosenCards = [NSString stringWithString: chosenCards];
            
            self.score  -=self.mismatchPenalty;
            
            self.status = [NSString stringWithFormat:@"%@ don't match! %d point penalty.", nsChosenCards, self.mismatchPenalty];
        }
    }
    else {

        self.status = [NSString stringWithFormat:@"Flipped up %@.", card.contents];
    }
    
    self.score -= self.flipCost;
    card.faceUp = ! card.isFaceUp;
    
}

@end

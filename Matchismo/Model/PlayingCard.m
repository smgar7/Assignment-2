//
//  PlayingCard.m
//  Matchismo
//
//  Created by Sheila Wheaton on 2/5/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match: (NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherCard.rank == self.rank) {
            score = 4;
        }
        
    }
    
    else if (otherCards.count == 2) {
        
        PlayingCard *otherCard = [otherCards lastObject];
        PlayingCard *otherCard2 = otherCards[1];

        if ([otherCard.suit isEqualToString:self.suit] && [otherCard2.suit isEqualToString:self.suit]) {
            score = 2;
        } else if (otherCard.rank == self.rank && otherCard2.rank == self.rank) {
            score = 8;
        }
    }
     
    return score;
    
}
- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    static NSArray *validSuits = nil;
    if (!validSuits) validSuits = @[@"♥",@"♦",@"♠",@"♣"];
    return validSuits;
    
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger) maxRank {return [self rankStrings].count - 1;}

- (void) setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end

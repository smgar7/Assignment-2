//
//  PlayingCard.h
//  Matchismo
//
//  Created by Sheila Wheaton on 2/5/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end

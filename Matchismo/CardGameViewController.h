//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Sheila Wheaton on 2/4/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

- (Deck *)createDeck; //abstract
@property (nonatomic) NSInteger startingCardCount; //abstract
@property (nonatomic) NSInteger matchingCardsPoints; //abstract
@property (nonatomic) NSInteger matchBonusPoints; //abstract
@property (nonatomic) NSInteger mismatchPenaltyPoints; //abstract
@property (nonatomic) NSInteger flipCostPoints; //abstract


@end

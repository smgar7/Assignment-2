//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Sheila Wheaton on 2/20/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController()
- (void) updateUI;
- (CardMatchingGame *) game;
@end


@interface PlayingCardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
};

- (NSInteger) startingCardCount{ return 52;}
- (NSInteger) matchingCardsPoints{ return 2;}
- (NSInteger) matchBonusPoints{return 4;}
- (NSInteger) mismatchPenaltyPoints{return 2;}
- (NSInteger) flipCostPoints{return 1;}


- (void) setCardButtons: (NSArray *) cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [ [super game] cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnPlayable;
        cardButton.alpha = card.isUnPlayable ? 0.3 : 1.0;
        
        UIImage *cardBackImage = (cardButton.selected) ? nil : [UIImage imageNamed:@"cardBacking.jpg"];
        
        [cardButton setImage:cardBackImage forState:UIControlStateNormal];
    }
    
    [super updateUI];
}
@end

//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Sheila Wheaton on 2/12/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetDeck.h"
#import "SetCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController()
- (void) updateUI;
- (CardMatchingGame *) game;
@end


@interface SetGameViewController()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation SetGameViewController

- (Deck *)createDeck
{
    return [[SetDeck alloc] init];
};

- (NSInteger) startingCardCount{ return 52;}
- (NSInteger) matchingCardsPoints{ return 3;}
- (NSInteger) matchBonusPoints{return 10;}
- (NSInteger) mismatchPenaltyPoints{return 3;}
- (NSInteger) flipCostPoints{return 1;}


- (void) setCardButtons: (NSArray *) cardButtons
{
    _cardButtons = cardButtons;
    [self initializeCards];
    [self updateUI];
    
}

- (void) updateUI
{
    [self initializeCards];
    [super updateUI];
    
}


- (void) initializeCards
{
    
    //symbol ▲ ◼ ●
    //number of symbols 1,2,3
    //shade fill empty, filled, striped
    //color: red green purple

    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        if ([card isKindOfClass: [SetCard class]]){
            
            UIColor *chosenColor = [((SetCard *) card).color isEqual: @"green"] ? [UIColor greenColor] : [((SetCard *) card).color isEqual: @"red"] ? [UIColor redColor] : [UIColor purpleColor];
            NSNumber *chosenShading = [((SetCard *)card).shading isEqual: @"fill"] ? @+10 : @-10;
            NSString *chosenSymbol = ((SetCard *)card).symbol;
            int symbolCount = ((SetCard *)card).symbolCount;
            NSMutableString *tempSymbol = [NSMutableString stringWithString:chosenSymbol];
            
            for (int x=0; x<symbolCount; x++) {
                [tempSymbol appendFormat:@"%@", chosenSymbol];
            }
            NSString *symbol = tempSymbol;
            
            
            
            NSDictionary *normalAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14], NSForegroundColorAttributeName : chosenColor,
                                               NSStrokeWidthAttributeName: chosenShading, NSStrokeColorAttributeName: chosenColor};
            
            NSDictionary *selectedAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14], NSBackgroundColorAttributeName: [UIColor whiteColor],
                                                 NSStrokeWidthAttributeName: chosenShading, NSStrokeColorAttributeName: chosenColor
                                                 };
            
            
            NSMutableAttributedString *normalState = [[NSMutableAttributedString alloc] initWithString:symbol attributes:normalAttributes];
            
            NSMutableAttributedString *selectedState = [[NSMutableAttributedString alloc] initWithString:symbol attributes:selectedAttributes];
            
            [normalState addAttributes: normalAttributes range:NSMakeRange(0,1)];
            [selectedState  addAttributes: selectedAttributes range:NSMakeRange(0,1)];
            
            [cardButton setAttributedTitle:normalState forState:UIControlStateNormal];
            [cardButton setAttributedTitle:selectedState forState:UIControlStateSelected];
            
            card.contents = symbol; //for displaying the waht was flipped in the results status 
            
        }
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnPlayable;
        cardButton.backgroundColor = cardButton.isSelected ? [UIColor whiteColor] : [UIColor grayColor];
        cardButton.alpha = card.isUnPlayable ? 0.3 : 1.0;
        
    }

}


@end

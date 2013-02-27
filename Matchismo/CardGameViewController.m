//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Sheila Wheaton on 2/4/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardGameViewController ()

@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *resultMessage;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self startingCardCount] usingDeck:[self createDeck]
                            matchingCards: [self matchingCardsPoints]
                            matchBonus:[self matchBonusPoints]
                            mismatchPenalty: [self mismatchPenaltyPoints]
                            flipCost: [self flipCostPoints]];
    return _game;
}


- (Deck *)createDeck { return nil;} //abstract (needs to be overriden and need to be implemented)

- (void) updateUI
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.resultMessage.text = self.game.status;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

- (IBAction)deal:(UIButton *)sender
{
    self.game = nil;
    self.flipCount = 0;
    [self game];
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self updateUI];
}

@end

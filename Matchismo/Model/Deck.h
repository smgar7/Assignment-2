//
//  Deck.h
//  Matchismo
//
//  Created by Sheila Wheaton on 2/5/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL) atTop;

- (Card *)drawRandomCard;

@end

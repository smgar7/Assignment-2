//
//  SetDeck.m
//  Matchismo
//
//  Created by Sheila Wheaton on 2/12/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import "SetDeck.h"


@implementation SetDeck
- (id) init
{
    self = [super init];
    
    if (self) {
        for (NSString * symbol in [SetCard validSymbols]){
            for (NSString * color in [SetCard validColor]){
                for (NSString * shading in [SetCard validShading]){
                    for(int x=0; x<3;x++) {
                        
                        SetCard *card = [[SetCard alloc] init];
                        card.symbol = symbol;
                        card.symbolCount = x;
                        card.shading = shading;
                        card.color = color;
                        
                        [self addCard:card atTop: YES];
                    }
                }
            }
        }
    }
    
    return self;
}
@end

//
//  Set.m
//  Matchismo
//
//  Created by Sheila Wheaton on 2/12/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

//symbol ▲ ◼ ●
//number of symbols 1,2,3
//shade fill empty, filled, striped
//color: red green purple

+ (NSArray *)validSymbols
{
    static NSArray *validSymbols = nil;
    if (!validSymbols) validSymbols = @[@"▲",@"■",@"●"];
    return validSymbols;
    
}

+ (NSArray *)validColor{
    static NSArray *validColor = nil;
    if (!validColor) validColor = @[@"red",@"green",@"purple"];
    return validColor;

}
+ (NSArray *)validShading{
    static NSArray *validShading = nil;
    if (!validShading) validShading = @[@"open",@"fill"];
    return validShading;

}

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    SetCard * card1 = self;
    SetCard * card2 = otherCards[0];
    SetCard * card3 = otherCards[1];
    
    
    //same color, are all same symbol, all have same count
    //all different color, all have different shapes, all have same shading
    
    //different colors, different symbols, all have different shading
    
    //Sheila rule :P
    //different color, same shapes, same count, same fill
    //same color, same shapes, different count, same fill
    
    if (
        ([card1.color isEqualToString:card2.color] &&
        [card1.color isEqualToString:card3.color] &&
        [card1.shading isEqualToString:card2.shading] &&
        [card1.shading isEqualToString:card3.shading] &&
        card1.symbolCount== card2.symbolCount  &&
        card2.symbolCount== card3.symbolCount &&
        [card1.symbol isEqualToString:card2.symbol] &&
        [card1.symbol isEqualToString:card3.symbol]
        )
        
        ||
        
        (![card1.color isEqualToString:card2.color] &&
         ![card1.color isEqualToString:card3.color] &&
         ![card2.color isEqualToString:card3.color] &&
         
         [card1.shading isEqualToString:card2.shading] &&
         [card1.shading isEqualToString:card3.shading] &&
         [card2.shading isEqualToString:card3.shading] &&
         
         card1.symbolCount!= card2.symbolCount  &&
         card1.symbolCount!= card3.symbolCount &&
         card2.symbolCount!= card3.symbolCount &&
         ![card1.symbol isEqualToString:card2.symbol] &&
         ![card1.symbol isEqualToString:card3.symbol] &&
         ![card2.symbol isEqualToString:card3.symbol]

         )
        
        ||
        
        (![card1.color isEqualToString:card2.color] &&
         ![card1.color isEqualToString:card3.color] &&
         ![card2.color isEqualToString:card3.color] &&
         
         ![card1.shading isEqualToString:card2.shading] &&
         ![card1.shading isEqualToString:card3.shading] &&
         ![card2.shading isEqualToString:card3.shading] &&
         
         card1.symbolCount!= card2.symbolCount  &&
         card1.symbolCount!= card3.symbolCount &&
         card2.symbolCount!= card3.symbolCount &&
         ![card1.symbol isEqualToString:card2.symbol] &&
         ![card1.symbol isEqualToString:card3.symbol] &&
         ![card2.symbol isEqualToString:card3.symbol]
         
         )
        
        ||
            //different color, same shapes, same count, same fill
        (![card1.color isEqualToString:card2.color] &&
         ![card1.color isEqualToString:card3.color] &&
         ![card2.color isEqualToString:card3.color] &&
         
         [card1.shading isEqualToString:card2.shading] &&
         [card1.shading isEqualToString:card3.shading] &&
         [card2.shading isEqualToString:card3.shading] &&
         
         card1.symbolCount== card2.symbolCount  &&
         card1.symbolCount== card3.symbolCount &&
         card2.symbolCount== card3.symbolCount &&
         [card1.symbol isEqualToString:card2.symbol] &&
         [card1.symbol isEqualToString:card3.symbol] &&
         [card2.symbol isEqualToString:card3.symbol]
         
         )
    
        ||
        //same color, same shapes, different count, same fill

        ([card1.color isEqualToString:card2.color] &&
         [card1.color isEqualToString:card3.color] &&
         [card2.color isEqualToString:card3.color] &&
         
         [card1.shading isEqualToString:card2.shading] &&
         [card1.shading isEqualToString:card3.shading] &&
         [card2.shading isEqualToString:card3.shading] &&
         
         card1.symbolCount!= card2.symbolCount  &&
         card1.symbolCount!= card3.symbolCount &&
         card2.symbolCount!= card3.symbolCount &&
         [card1.symbol isEqualToString:card2.symbol] &&
         [card1.symbol isEqualToString:card3.symbol] &&
         [card2.symbol isEqualToString:card3.symbol]
         
         )
        )
        
    {
        score =1;
    }
    return score;
}

@end

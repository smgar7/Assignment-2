//
//  Set.h
//  Matchismo
//
//  Created by Sheila Wheaton on 2/12/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSString * symbol;
@property (nonatomic) NSUInteger symbolCount;
@property (nonatomic) NSString * color;
@property (nonatomic) NSString * shading;

+ (NSArray *)validSymbols;
+ (NSArray *)validColor;
+ (NSArray *)validShading;


@end

//
//  Card.h
//  Matchismo
//
//  Created by Sheila Wheaton on 2/5/13.
//  Copyright (c) 2013 Sheila Wheaton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnPlayable) BOOL unplayable;

-(int)match:(NSArray *)otherCards;

@end

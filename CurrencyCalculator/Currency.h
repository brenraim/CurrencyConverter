//
//  Currency.h
//  CurrencyCalculator
//
//  Created by Brendan Raimann on 7/15/16.
//  Copyright © 2016 Brendan Raimann. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject <NSCoding>

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* alphaCode;
@property (strong, nonatomic) NSString* symbol;
@property (strong, nonatomic) NSNumber* places;
@property (strong, nonatomic) NSNumberFormatter* formatter;

- (Currency*) initWithName : (NSString*) aName
                 alphaCode : (NSString*) aCode
                    symbol : (NSString*) aSymbol
             decimalPlaces : (NSNumber*) xPlaces;

- (NSString*) format : (NSNumber*) quantity;

@end

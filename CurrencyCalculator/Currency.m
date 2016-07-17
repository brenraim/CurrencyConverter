//
//  Currency.m
//  CurrencyCalculator
//
//  Created by Brendan Raimann on 7/15/16.
//  Copyright © 2016 Brendan Raimann. All rights reserved.
//


#import "Currency.h"

@implementation Currency


@synthesize name;
@synthesize alphaCode;
@synthesize symbol;
@synthesize places;


- (Currency*) initWithName : (NSString*) aName
                 alphaCode : (NSString*) aCode
                    symbol : (NSString*) aSymbol
             decimalPlaces : (NSNumber*) xPlaces; {
   self.name = aName;
   self.alphaCode = aCode;
   self.symbol = aSymbol;
   self.places = xPlaces;
   return self;
}



@end


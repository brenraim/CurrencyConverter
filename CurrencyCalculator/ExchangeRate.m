//
//  ExchangeRate.m
//  CurrencyCalculator
//
//  Created by Brendan Raimann on 7/15/16.
//  Copyright © 2016 Brendan Raimann. All rights reserved.
//
#import "ExchangeRate.h"
#import "ViewController.h"

@implementation ExchangeRate

@synthesize home;
@synthesize foreign;

@synthesize expiresOn;
@synthesize rate;

-(ExchangeRate*) initWithHomeCurrency:(Currency *)aHome foreignCurrency:(Currency *)aForeign {
   self.home = aHome;
   self.foreign = aForeign;
   
   return self;
}

-(bool) updateRate {
   // Actually do this
   return YES;
}

-(NSURL*) exchangeRateURL
{
   self.home = [ViewController getHomeCurrency];
   self.foreign = [ViewController getForeignCurrency];
   NSString* urlString = [NSString stringWithFormat: @"https://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20yahoo.finance.xchange%%20where%%20pair%%20in%%20(%%22%@%@%%22)&format=json&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys&callback=", self.home.alphaCode, self.foreign.alphaCode];
   return [NSURL URLWithString: urlString];
}

+(NSArray*) allExchangeRates
{
   /*
   NSMutableArray* allRates = [[NSMutableArray alloc] init];
   Currency* x = [[Currency alloc] initWithName:@"US Dollar" alphaCode:@"USD" symbol:@"$" decimalPlaces:[NSNumber numberWithInt:2]];
   Currency* y = [[Currency alloc] initWithName:@"Canadian Dollar" alphaCode:@"CAD" symbol:@"$" decimalPlaces:[NSNumber numberWithInt:2]];
   return (NSArray*)allRates;
    */
}
@end

//
//  ExchangeRate.h
//  CurrencyCalculator
//
//  Created by Brendan Raimann on 7/15/16.
//  Copyright © 2016 Brendan Raimann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"
#import "ViewController.h"

@interface ExchangeRate : NSObject	// <NSCoding>

@property (strong, nonatomic) Currency* home;

@property (strong, nonatomic) Currency* foreign;

@property (assign, nonatomic) float rate;

@property (strong, nonatomic) NSDate* expiresOn;

@property (strong) NSMutableDictionary *completionHandlerDictionary;
@property (strong) NSURLSessionConfiguration *ephemeralConfigObject;

-(bool) updateRate;

+(Currency*) getHomeCurrency;
+(Currency*) getForeignCurrency;
+(NSArray*) allExchangeRates;
+(NSDictionary*) data;

-(NSString*) description;

-(ExchangeRate*) initWithHomeCurrency: (NSString*) aHomeCurrency foreignCurrency: (NSString*) aForeignCurrency;
-(ExchangeRate*) init;

-(NSURL*) exchangeRateURL;

-(void) fetch;

@end
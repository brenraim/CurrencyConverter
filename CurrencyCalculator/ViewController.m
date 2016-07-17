//
//  ViewController.m
//  CurrencyCalculator
//
//  Created by Brendan Raimann on 7/15/16.
//  Copyright © 2016 Brendan Raimann. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize homeField;
@synthesize foreignLabel;
@synthesize homePicker;
@synthesize foreignPicker;

- (IBAction)homeChange:(id)sender {
   NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
   format.numberStyle = NSNumberFormatterDecimalStyle;
   self.homeCurrency.value = [format numberFromString:self.homeField.text];
   [self getRate];
   self.foreignCurrency.value = [NSNumber numberWithFloat:(self.homeCurrency.value.floatValue * self.rateView)];
   self.foreignField.text = [NSString stringWithFormat:@"%.02f", (floorf(self.foreignCurrency.value.floatValue * 100 + 0.5) / 100)];
}

- (IBAction)foreignChange:(id)sender {
   NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
   format.numberStyle = NSNumberFormatterDecimalStyle;
   self.foreignCurrency.value = [format numberFromString:self.foreignField.text];
   [self getRate];
   self.homeCurrency.value = [NSNumber numberWithFloat:(self.foreignCurrency.value.floatValue * (1.0/self.rateView))];
   self.homeField.text = [NSString stringWithFormat:@"%.02f", (floorf(self.homeCurrency.value.floatValue * 100 + 0.5) / 100)];
}

-(NSArray*) array
{
   Currency* c = [Currency someCurrency];
   NSMutableArray *output = [[NSMutableArray alloc] init];
   
   
   c.name = @"US Dollars";
   c.alphaCode = @"USD";
   c.currencySymbol = @"$";
   
   [toReturn addObject: c];
   
   c.name = @"Pounds";
   c.alphaCode = @"GBP";
   c.currencySymbol = @"£";
   
   [toReturn addObject: c];
   
   c.name = @"Mexican Pesos";
   c.alphaCode = @"MXN";
   c.currencySymbol = @"M$";
   
   [toReturn addObject: c];
   
   c.name = @"Euros";
   c.alphaCode = @"EUR";
   c.currencySymbol = @"€";
   
   [toReturn addObject: c];
   
   c.name = @"Canadian Dollars";
   c.alphaCode = @"CAD";
   c.currencySymbol = @"C$";
   
   [toReturn addObject: c];
   
   
   return output;
}

- (void) getRate {
   URLFetcher* f = [[URLFetcher alloc] init];
   [f fetch];
   [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
   
   NSDictionary* jsonDictionary = [URLFetcher data];
   NSDictionary* queryDictionary = jsonDictionary[@"query"];
   NSDictionary* resultsDictionary = queryDictionary[@"results"];
   NSDictionary* rateDictionary = resultsDictionary[@"rate"];
   NSString* rateResult = rateDictionary[@"Rate"];
   self.exchangeRate.rate = rateResult.floatValue;
   self.rateView = rateResult.floatValue;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   self.homePicker.dataSource = self;
   self.foreignPicker.delegate = self;
   self.homeField.dataSource = self;
   self.foreignLabel.delegate = self;
   self.homeCurrency = [[Currency alloc] init];
   self.foreignCurrency = [[Currency alloc] init];
   self.homeCurrency.alphaCode = @"USD";
   self.foreignCurrency.alphaCode = @"USD";
   self.exchangeRate.homeCurrency = self.homeCurrency;
   self.exchangeRate.foreignCurrency = self.foreignCurrency;
   [self getRate];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
   return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
   return array.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
   return array[row];
}

- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

- (IBAction)refreshButtonPressed:(id)sender {
}
@end

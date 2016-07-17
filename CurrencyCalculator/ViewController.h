//
//  ViewController.h
//  CurrencyCalculator
//
//  Created by Brendan Raimann on 7/15/16.
//  Copyright © 2016 Brendan Raimann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UITextField *homeField;
@property (strong, nonatomic) IBOutlet UILabel *foreignLabel;

@property (strong, nonatomic) IBOutlet UIPickerView *homePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *foreignPicker;

@property (strong, nonatomic) Currency* homeCurrency;
@property (strong, nonatomic) Currency* foreignCurrency;
@property (strong, nonatomic) ExchangeRate* exchangeRate;
@property (assign, nonatomic) float rateView;

- (NSArray*) array;

- (IBAction)homeChange:(id)sender;

- (IBAction)refreshButtonPressed:(id)sender;


- (void) getRate;
+(Currency*) getHomeCurrency;
+(Currency*) getForeignCurrency;



@end


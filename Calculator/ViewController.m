//
//  ViewController.m
//  Calculator
//
//  Created by Jonathan Archille on 11/18/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic) BOOL toBeMultiplied;
@property (nonatomic) BOOL toBeAdded;
@property (nonatomic) BOOL toBeSubtracted;
@property (nonatomic) BOOL toBeDivided;
@property (nonatomic) BOOL isDecimal;


@end

@implementation ViewController

double displayValue;
double multiplyOperand;
double addOperand;
double subtractOperand;
double divideOperand;
int callCount;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.displayLabel.text = @"0";
    self.toBeDivided = NO;
    self.toBeAdded = NO;
    self.toBeSubtracted = NO;
    self.toBeDivided = NO;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)computeComputation:(int)digitPressed
{
    if (self.isDecimal == NO){
        displayValue = ([self.displayLabel.text doubleValue]* 10) + digitPressed;
        self.displayLabel.text = [NSString stringWithFormat:@"%.f",displayValue];
    }else {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:[NSString stringWithFormat:@"%d", digitPressed]];

    }
    
}
- (void)solve
{
    if(self.toBeMultiplied == YES)
    {
        displayValue = [self.displayLabel.text doubleValue];
        double result = displayValue * multiplyOperand;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        self.toBeMultiplied = NO;
    } else if (self.toBeAdded == YES)
    {
        displayValue = [self.displayLabel.text doubleValue];
        double result = displayValue + addOperand;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        self.toBeAdded = NO;
    } else if (self.toBeSubtracted == YES)
    {
        displayValue = [self.displayLabel.text doubleValue];
        double result = subtractOperand - displayValue;
        self.displayLabel.text  = [NSString stringWithFormat:@"%g", result];
        self.toBeSubtracted = NO;
    } else {
        displayValue = [self.displayLabel.text doubleValue];
        double result = divideOperand / displayValue;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        self.toBeDivided = NO;
    }
    
}
- (IBAction)zero:(UIButton *)sender
{
  [self computeComputation:0];
}
- (IBAction)one:(UIButton *)sender
{
  [self computeComputation:1];
}
- (IBAction)two:(UIButton *)sender
{
  [self computeComputation:2];
}
- (IBAction)three:(UIButton *)sender
{
  [self computeComputation:3];
}
- (IBAction)four:(UIButton *)sender
{
  [self computeComputation:4];
}
- (IBAction)five:(UIButton *)sender
{
  [self computeComputation:5];
}
- (IBAction)six:(UIButton *)sender
{
  [self computeComputation:6];
}
- (IBAction)seven:(UIButton *)sender
{
  [self computeComputation:7];
}
- (IBAction)eight:(UIButton *)sender
{
  [self computeComputation:8];
}
- (IBAction)nine:(UIButton *)sender
{
  [self computeComputation:9];
}


- (IBAction)add:(UIButton *)sender
{
    if (callCount < 1){
        addOperand = [self.displayLabel.text doubleValue];
        self.displayLabel.text = @"";
        self.toBeAdded = YES;
        callCount++;
    }else {
        [self solve];
        callCount = 0;
        
    }
}
- (IBAction)subtract:(UIButton *)sender
{
    if (callCount < 1){
        subtractOperand = [self.displayLabel.text doubleValue];
        self.displayLabel.text = @"";
        self.toBeSubtracted = YES;
        callCount++;
    } else {
        [self solve];
        callCount = 0;
    }
}


- (IBAction)multiply:(UIButton *)sender
{
    if (callCount < 1){
        multiplyOperand = [self.displayLabel.text doubleValue];
        self.displayLabel.text = @"";
        self.toBeMultiplied = YES;
        callCount++;
    } else {
        [self solve];
        multiplyOperand = [self.displayLabel.text doubleValue];
        callCount = 0;
    }

       
}
- (IBAction)divide:(UIButton *)sender
{
    if (callCount < 1) {
        divideOperand = [self.displayLabel.text doubleValue];
        self.displayLabel.text = @"";
        self.toBeDivided = YES;
        callCount++;
    }else {
        [self solve];
        divideOperand = [self.displayLabel.text doubleValue];
        callCount = 0;
    }

}
- (IBAction)equals:(UIButton *)sender
{
    if (callCount == 0){
      self.displayLabel.text = @"";
    }else [self solve];
}
- (IBAction)clear:(UIButton *)sender
{
    self.displayLabel.text = @"0";
    self.toBeSubtracted = NO;
    self.toBeAdded = NO;
    self.toBeMultiplied = NO;
    self.toBeDivided = NO;
    self.isDecimal = NO;

    callCount = 0;

}
- (IBAction)decimalpoint:(UIButton *)sender
{
    if (![self.displayLabel.text containsString:@"."])
    {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:@"."];
        self.isDecimal = YES;
    }
}
    


@end

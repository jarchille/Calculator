//
//  ViewController.m
//  Calculator
//
//  Created by Jonathan Archille on 11/18/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.displayLabel.text = @"0";
    isMultiOperation = NO;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)computeComputation:(int)digitPressed
{
    if (![self.displayLabel.text containsString:@"."]){
        displayValue = ([self.displayLabel.text floatValue]* 10) + digitPressed;
        self.displayLabel.text = [NSString stringWithFormat:@"%.f",displayValue];
    }else {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:[NSString stringWithFormat:@"%d", digitPressed]];

    }
    
}
- (void)solve
{
    if(self.toBeMultiplied == YES)
    {
        displayValue = [self.displayLabel.text floatValue];
        double result = displayValue * multiplyOperand;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        self.toBeMultiplied = NO;
        isMultiOperation = YES;
    } else if (self.toBeAdded == YES)
    {
        displayValue = [self.displayLabel.text floatValue];
        double result = displayValue + addOperand;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        self.toBeAdded = NO;
        isMultiOperation = YES;
    } else if (self.toBeSubtracted == YES){
        displayValue = [self.displayLabel.text floatValue];
        double result = subtractOperand - displayValue;
        self.displayLabel.text  = [NSString stringWithFormat:@"%g", result];
        self.toBeSubtracted = NO;
        isMultiOperation = YES;
    } else if (self.toBeDivided == YES){
        displayValue = [self.displayLabel.text floatValue];
        float result = divideOperand / displayValue;
        self.displayLabel.text = [NSString stringWithFormat:@"%g", result];
        self.toBeDivided = NO;
        isMultiOperation = YES;
    }  else {
        
    }
}
- (IBAction)zero:(UIButton *)sender
{
    [self computeComputation:0];
}

- (IBAction)one:(UIButton *)sender
{
    if (isMultiOperation == NO){
        [self computeComputation:1];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 1];
    }

}
- (IBAction)two:(UIButton *)sender
{
    if (isMultiOperation == NO){
        [self computeComputation:2];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 2];
    }
}
- (IBAction)three:(UIButton *)sender
{
    if (isMultiOperation == NO){
       [self computeComputation:3];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 3];
    }
}
- (IBAction)four:(UIButton *)sender
{
    if (isMultiOperation == NO){
        [self computeComputation:4];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 4];
    }
}
- (IBAction)five:(UIButton *)sender
{
    if (isMultiOperation == NO){
        [self computeComputation:5];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 5];
    }

}
- (IBAction)six:(UIButton *)sender
{
    if (isMultiOperation == NO){
        [self computeComputation:6];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 6];
    }
}
- (IBAction)seven:(UIButton *)sender
{
    if (isMultiOperation == NO){
        [self computeComputation:7];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 7];
    }
}
- (IBAction)eight:(UIButton *)sender
{
    if (isMultiOperation == NO){
        [self computeComputation:8];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 8];
    }
}
- (IBAction)nine:(UIButton *)sender
{
     if (isMultiOperation == NO){
        [self computeComputation:9];
    }else{
        displayValue = [self.displayLabel.text floatValue];
        self.displayLabel.text = [NSString stringWithFormat:@"%d", 9];
    }
}
- (IBAction)add:(UIButton *)sender
{
    if (isMultiOperation == NO){
        addOperand = [self.displayLabel.text floatValue];
        self.displayLabel.text = @"";
        isMultiOperation = YES;
        self.toBeAdded = YES;
        [self solve];
    }else {
        
        self.toBeAdded = YES;
        [self solve];
        addOperand = [self.displayLabel.text floatValue];
        
        
    }
}
- (IBAction)subtract:(UIButton *)sender
{
    if (isMultiOperation == NO) {
        subtractOperand = [self.displayLabel.text floatValue];
        self.displayLabel.text = @"";
        isMultiOperation = YES;
        self.toBeSubtracted = YES;
        [self solve];
    }else {
        
        self.toBeSubtracted = YES;
        [self solve];
        subtractOperand = [self.displayLabel.text floatValue];
        
    }


}
- (IBAction)multiply:(UIButton *)sender
{
    if (isMultiOperation == NO){
        multiplyOperand = [self.displayLabel.text floatValue];
        self.displayLabel.text = @"";
        isMultiOperation = YES;
        self.toBeMultiplied = YES;
        [self solve];
    } else {
        self.toBeMultiplied = YES;
        [self solve];
        multiplyOperand = [self.displayLabel.text floatValue];
        
        
    }

}
- (IBAction)divide:(UIButton *)sender
{
    
    if (isMultiOperation == NO){
        divideOperand = [self.displayLabel.text floatValue];
        self.displayLabel.text = @"";
        self.toBeDivided = YES;
        [self solve];

    } else {
        self.toBeDivided = YES;
        [self solve];
        divideOperand = [self.displayLabel.text floatValue];
        
        
    }
    
}
- (IBAction)equals:(UIButton *)sender
{
    [self solve];
}
- (IBAction)clear:(UIButton *)sender
{
    self.displayLabel.text = @"0";
    self.toBeSubtracted = NO;
    self.toBeAdded = NO;
    self.toBeMultiplied = NO;
    isMultiOperation = NO;

}
- (IBAction)decimalpoint:(UIButton *)sender
{
    if ([self.displayLabel.text containsString:@"."]){
        return;
    } else {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:@"."];
        

    }
    
}

@end

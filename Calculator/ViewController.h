//
//  ViewController.h
//  Calculator
//
//  Created by Jonathan Archille on 11/18/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol ViewControllerDelegate <NSObject>

//-(void)

//@end

@interface ViewController : UIViewController



@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)zero:(UIButton *)sender;
- (IBAction)one:(UIButton *)sender;
- (IBAction)two:(UIButton *)sender;
- (IBAction)three:(UIButton *)sender;
- (IBAction)four:(UIButton *)sender;
- (IBAction)five:(UIButton *)sender;
- (IBAction)six:(UIButton *)sender;
- (IBAction)seven:(UIButton *)sender;
- (IBAction)eight:(UIButton *)sender;
- (IBAction)nine:(UIButton *)sender;
- (IBAction)subtract:(UIButton *)sender;
- (IBAction)add:(UIButton *)sender;
- (IBAction)multiply:(UIButton *)sender;
- (IBAction)equals:(UIButton *)sender;
- (IBAction)divide:(UIButton *)sender;
- (IBAction)clear:(UIButton *)sender;
- (IBAction)decimalpoint:(UIButton *)sender;


@end





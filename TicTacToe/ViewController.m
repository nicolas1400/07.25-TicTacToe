//
//  ViewController.m
//  TicTacToe
//
//  Created by Nicolas Semenas on 24/07/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "ViewController.h"
#include<unistd.h>


@interface ViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *myLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *myLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *myLabelThree;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFour;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFive;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSix;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSeven;
@property (weak, nonatomic) IBOutlet UILabel *myLabelEight;
@property (weak, nonatomic) IBOutlet UILabel *myLabelNine;

@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@property (nonatomic) NSInteger nextPlayer;




@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nextPlayer = 1;
    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.textColor = [UIColor blueColor];
    
    
}



- (IBAction)onLabelTapped:(UITapGestureRecognizer *) tapGestureRecognizer
{
    UILabel * labelTapped;
    
    CGPoint coords = [tapGestureRecognizer locationInView:tapGestureRecognizer.view];

    labelTapped = [self findLabelUsingPoint:coords];
    
    
    if ([labelTapped.text length] == 0){
    
        if (self.nextPlayer == 1){
            labelTapped.text = @"X";
            labelTapped.textColor = [UIColor blueColor];
            }
        else {
            labelTapped.text = @"O";
            labelTapped.textColor = [UIColor redColor];
            }
        [self tooglePlayer];
    }
    
    
    if ([self whoWon]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Contratulations!"
                                                        message:@"Let's play another match?"
                                                       delegate:self
                                              cancelButtonTitle:@"Sure!"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    
    
}


- (NSString*)whoWon {
    
    NSMutableArray *wins = [NSMutableArray array];

    [wins addObject: [NSNumber numberWithInt:7]];
    [wins addObject: [NSNumber numberWithInt:56]];
    [wins addObject: [NSNumber numberWithInt:448]];
    [wins addObject: [NSNumber numberWithInt:73]];
    [wins addObject: [NSNumber numberWithInt:146]];
    [wins addObject: [NSNumber numberWithInt:292]];
    [wins addObject: [NSNumber numberWithInt:273]];
    [wins addObject: [NSNumber numberWithInt:84]];


    for (NSNumber *win in wins){
        
        int a = [win intValue];
        int b = [self scoreForPlayerX];
        
        if ((a & b) == a ){
            return @"X";
        }
    }
    
    
    for (NSNumber *win in wins){
        
        int a = [win intValue];
        int b = [self scoreForPlayerO];
        
        if ((a & b) == a ){
            return @"O";
        }
    }
    
return nil;

}



- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    
    double delayInSeconds = 0.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelOne.text = @"";});
    
    
    delayInSeconds = 0.2;
     popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelTwo.text = @"";});
    
     delayInSeconds = 0.3;
     popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelThree.text = @"";});
    
     delayInSeconds = 0.4;
     popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelFour.text = @"";});
    
     delayInSeconds = 0.5;
     popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelFive.text = @"";});
    
     delayInSeconds = 0.6;
     popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelSix.text = @"";});
    
     delayInSeconds = 0.7;
     popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelSeven.text = @"";});
    
     delayInSeconds = 0.8;
     popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelEight.text = @"";});
    
     delayInSeconds = 0.9;
     popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ self.myLabelNine.text = @"";});

    
    
    
    
//    
//    self.myLabelTwo.text = @"";
//    //sleep(2);
//    self.myLabelThree.text = @"";
//   // sleep(2);
//    self.myLabelFour.text = @"";
//  //  sleep(2);
//    self.myLabelFive.text = @"";
//    self.myLabelSix.text = @"";
//    self.myLabelSeven.text = @"";
//    self.myLabelEight.text = @"";
//    self.myLabelNine.text = @"";
    
}



# pragma mark - Helper Methods

- (int) scoreForPlayerX {
    
    int total = 0;
    
    if ([self.myLabelOne.text isEqualToString: @"X"]) { total = total + 1;}
    if ([self.myLabelTwo.text isEqualToString: @"X"]) { total = total + 2;}
    if ([self.myLabelThree.text isEqualToString: @"X"]) { total = total + 4;}
    if ([self.myLabelFour.text isEqualToString: @"X"]) { total = total + 8;}
    if ([self.myLabelFive.text isEqualToString: @"X"]){ total = total + 16;}
    if ([self.myLabelSix.text isEqualToString: @"X"]) { total = total + 32;}
    if ([self.myLabelSeven.text isEqualToString: @"X"]) { total = total + 64;}
    if ([self.myLabelEight.text isEqualToString: @"X"]){ total = total + 128;}
    if ([self.myLabelNine.text isEqualToString: @"X"]) { total = total + 256;}

    return total;
}

- (int) scoreForPlayerO  {
    
    int total = 0;

    if ([self.myLabelOne.text isEqualToString: @"O"]) { total = total + 1;}
    if ([self.myLabelTwo.text isEqualToString: @"O"]) { total = total + 2;}
    if ([self.myLabelThree.text isEqualToString: @"O"]) { total = total + 4;}
    if ([self.myLabelFour.text isEqualToString: @"O"]) { total = total + 8;}
    if ([self.myLabelFive.text isEqualToString: @"O"]) { total = total + 16;}
    if ([self.myLabelSix.text isEqualToString: @"O"]){ total = total + 32;}
    if ([self.myLabelSeven.text isEqualToString: @"O"]) { total = total + 64;}
    if ([self.myLabelEight.text isEqualToString: @"O"]) { total = total + 128;}
    if ([self.myLabelNine.text isEqualToString: @"O"]) { total = total + 256;}

return total;
}





- (UILabel *)findLabelUsingPoint:(CGPoint)point
{
        if (CGRectContainsPoint(self.myLabelOne.frame, point)){
            return self.myLabelOne;
        }
        if (CGRectContainsPoint(self.myLabelTwo.frame, point)){
            return self.myLabelTwo;
        }
        if (CGRectContainsPoint(self.myLabelThree.frame, point)){
            return self.myLabelThree;
        }
        if (CGRectContainsPoint(self.myLabelFour.frame, point)){
            return self.myLabelFour;
        }
        if (CGRectContainsPoint(self.myLabelFive.frame, point)){
            return self.myLabelFive;
        }
        if (CGRectContainsPoint(self.myLabelSix.frame, point)){
            return self.myLabelSix;
        }
        if (CGRectContainsPoint(self.myLabelSeven.frame, point)){
            return self.myLabelSeven;
        }
        if (CGRectContainsPoint(self.myLabelEight.frame, point)){
            return self.myLabelEight;
        }
        if (CGRectContainsPoint(self.myLabelNine.frame, point)){
            return self.myLabelNine;
        }
    return nil;
    
}

- (void) tooglePlayer{
    
    if (self.nextPlayer == 1){
        self.nextPlayer = 2;
        self.whichPlayerLabel.text = @"O";
        self.whichPlayerLabel.textColor = [UIColor redColor];
    } else
    if (self.nextPlayer == 2){
        self.nextPlayer = 1;
        self.whichPlayerLabel.text = @"X";
        self.whichPlayerLabel.textColor = [UIColor blueColor];
}
}

@end

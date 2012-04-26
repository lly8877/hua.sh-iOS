//
//  MainViewController.h
//  login
//
//  Created by Longyi Li on 4/14/12.

//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate,UITextFieldDelegate>

@property (nonatomic, retain) UITextField* usernameTextField;
@property (nonatomic, retain) UITextField* passwordTextField;

- (IBAction)showInfo:(id)sender;

@end

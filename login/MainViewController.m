//
//  MainViewController.m
//  login
//
//  Created by Longyi Li on 4/14/12.
//  Copyright (c) 2012 Oracle. All rights reserved.
//

#import "MainViewController.h"
#import "LayoutHelper.h"

@interface MainViewController ()

@end

@interface MainViewController (privateMethods)
- (void) CustomizeViews;
@end

@implementation MainViewController

@synthesize usernameTextField = m_usernameTextField;
@synthesize passwordTextField = m_passwordTextField;

- (void)loadView
{
    [super loadView];
    m_usernameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    m_passwordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    
    m_usernameTextField.delegate = self;
    m_passwordTextField.delegate = self;
    [self.view addSubview:m_usernameTextField];
    [self.view addSubview:m_passwordTextField];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self CustomizeViews];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil] autorelease];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.view.center = CGPointMake(self.view.center.x, 100);
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	// the user pressed the "Done" button, so dismiss the keyboard
	[textField resignFirstResponder];
    self.view.frame = [[UIScreen mainScreen] bounds];
	return YES;
}

@end

@implementation MainViewController(privateMethods)

- (void) CustomizeViews
{
    self.view.backgroundColor = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Background_Login"]] autorelease];
    // set the looks
    
    m_usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    m_passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    m_usernameTextField.placeholder = NSLocalizedString(@"username", @"username");
    m_passwordTextField.placeholder = NSLocalizedString(@"password", @"password");
    
    m_usernameTextField.returnKeyType = UIReturnKeyDone;
    m_passwordTextField.returnKeyType = UIReturnKeyDone;
    
    m_passwordTextField.secureTextEntry = YES;
    
    m_usernameTextField.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
    m_passwordTextField.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
    
    m_usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    m_passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    // set the size
    CGRect l_bounds = self.view.bounds;
    [m_passwordTextField sizeToFit];
    [m_usernameTextField sizeToFit];
    [LayoutHelper SetBoundsWidthFor:m_usernameTextField withWidth:G_SEPERATE(l_bounds.size.width)];
    [LayoutHelper SetBoundsWidthFor:m_passwordTextField withWidth:G_SEPERATE(l_bounds.size.width)];    
    m_usernameTextField.frame = m_usernameTextField.bounds;
    m_passwordTextField.frame = m_passwordTextField.bounds;
    
    // set position
    
    // passwordTextField just below the golden line
    
    CGFloat l_yOffset = G_SEPERATE(m_passwordTextField.bounds.size.height);
    
    m_usernameTextField.center = CGPointMake(
                                             l_bounds.size.width/2,
                                             G_SEPERATE(l_bounds.size.height) - l_yOffset
                                             );
    
    m_passwordTextField.center = CGPointMake(
                                             l_bounds.size.width/2,
                                             G_SEPERATE(l_bounds.size.height) + l_yOffset
                                             );
}

@end
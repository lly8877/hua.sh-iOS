//
//  MainViewController.m
//  login
//
//  Created by Longyi Li on 4/14/12.

//

#import "MainViewController.h"

// views
#import "LayoutHelper.h"

// requests
#import "ConnectModuleLoginRequest.h"

@interface MainViewController ()

@end

@interface MainViewController (privateMethods)
- (void) loginWithUsername:(NSString*)in_username andPassword:(NSString*)in_password;
- (void) customizeViews;
@end

@implementation MainViewController

@synthesize usernameTextField = m_usernameTextField;
@synthesize passwordTextField = m_passwordTextField;

- (void)loadView
{
    [super loadView];
    self.usernameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    [self.view addSubview:self.usernameTextField];
    [self.view addSubview:self.passwordTextField];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self customizeViews];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    if (textField == self.passwordTextField)
    {
        [self loginWithUsername:self.usernameTextField.text andPassword:self.passwordTextField.text];
    }
	return YES;
}

@end

@implementation MainViewController(privateMethods)

- (void) loginWithUsername:(NSString*)in_username andPassword:(NSString*)in_password
{
    [ConnectModuleLoginRequest loginAs:in_username withPassword:in_password withDelegate:self];
}

- (void) customizeViews
{
    self.view.backgroundColor = [[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Background_Login"]] autorelease];
    // set the looks
    
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.usernameTextField.placeholder = NSLocalizedString(@"username", @"username");
    self.passwordTextField.placeholder = NSLocalizedString(@"password", @"password");
    
    self.usernameTextField.returnKeyType = UIReturnKeyDone;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    
    self.passwordTextField.secureTextEntry = YES;
    
    self.usernameTextField.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
    self.passwordTextField.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
    
    self.usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    // set the size
    CGRect l_bounds = self.view.bounds;
    [self.passwordTextField sizeToFit];
    [self.usernameTextField sizeToFit];
    [LayoutHelper SetBoundsWidthFor:self.usernameTextField withWidth:G_SEPERATE(l_bounds.size.width)];
    [LayoutHelper SetBoundsWidthFor:self.passwordTextField withWidth:G_SEPERATE(l_bounds.size.width)];    
    self.usernameTextField.frame = self.usernameTextField.bounds;
    self.passwordTextField.frame = self.passwordTextField.bounds;
    
    // set position
    
    // passwordTextField just below the golden line
    
    CGFloat l_yOffset = G_SEPERATE(self.passwordTextField.bounds.size.height);
    
    self.usernameTextField.center = CGPointMake(
                                             l_bounds.size.width/2,
                                             G_SEPERATE(l_bounds.size.height) - l_yOffset
                                             );
    
    self.passwordTextField.center = CGPointMake(
                                             l_bounds.size.width/2,
                                             G_SEPERATE(l_bounds.size.height) + l_yOffset
                                             );
}

@end
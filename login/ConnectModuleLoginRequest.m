//
//  ConnectModuleLoginRequest.m
//  login
//
//  Created by Longyi Li on 4/14/12.

//

#import "ConnectModuleLoginRequest.h"
#import "JSONFetcher.h"

@interface ConnectModuleLoginRequest(privateMethods)

- (id) initWithDelegate:(id)aDelegate;
- (void) storeLoginInfo:(id)result;
@end

@implementation ConnectModuleLoginRequest

@synthesize delegate = m_delegate;

+ (void) loginAs: (NSString *)in_username withPassword:(NSString *)in_password withDelegate:(id)aDelegate
{
    ConnectModuleLoginRequest* l_loginRequest = [[ConnectModuleLoginRequest alloc] initWithDelegate:aDelegate];
    
    NSString* url = [NSString stringWithFormat:@"http://huadiansh.herokuapp.com/users/login.json?username=%@&password=%@", in_username, in_password];
    JSONFetcher* l_jsonFetcher = [[JSONFetcher alloc] initWithURLString:url receiver:l_loginRequest];
    [l_jsonFetcher start];
    
}

- (void)receiveResponse:(JSONFetcher *)in_fetcher
{
    NSDictionary* l_json = in_fetcher.result;
    BOOL l_success;
    NSString* l_reason;
    NSString* l_token;
    
    if (l_json)
    {
        NSLog(@"%s login result: %@", __PRETTY_FUNCTION__, l_json);
        
        NSArray* l_allKeys = l_json.allKeys;
        NSAssert(l_allKeys.count == 2, @"Should have two objects");
        
        l_success = [[l_json objectForKey:@"success"] boolValue] == YES;
        l_token = [l_json objectForKey:@"token"];
        l_reason = [l_json objectForKey:@"reason"];
        
        [self storeLoginInfo:in_fetcher.result];


    }
    [in_fetcher release];
    in_fetcher = nil;
     
}
@end

@implementation ConnectModuleLoginRequest(privateMethods)
    
- (id) initWithDelegate:(id)aDelegate
{
	self = [super init];
	if( self ) {
		self.delegate = aDelegate;
	}
	return self;
}

- (void) storeLoginInfo:(id)result
{
    // TODO: store it in model.
}

@end

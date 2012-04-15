//
//  ConnectModuleLoginRequest.h
//  login
//
//  Created by Longyi Li on 4/14/12.
//  Copyright (c) 2012 Oracle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONFetcher.h"

@protocol ConnectModuleLoginRequestDelegate <NSObject>
@optional
- (void) didLoginSucceed: (LoginInfo*)theInfo;
- (void) didLoginFail: withError:(NSString*)aError;
@end

@interface ConnectModuleLoginRequest : NSObject
<JSONFetcherDelegate>
{
    id <ConnectModuleLoginRequestDelegate> m_delegate;
}

@property (assign) id<ConnectModuleLoginRequestDelegate> delegate;
+ (void) loginAs: (NSString *)aUser withPassword:(NSString *)aPassword withDelegate:(id)aDelegate;
@end

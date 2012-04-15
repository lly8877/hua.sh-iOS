//
//  ModelRepository.h
//  login
//
//  Created by Longyi Li on 4/14/12.
//  Copyright (c) 2012 Oracle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum 
{
	LoginStateLoggedOut = 0,
	LoginStateLoggedIn = 1,
	LoginStateLoggingIn,
	LoginStateLoggingOut
} LoginState;


// foward Declarations
@class LoginInfo;

@interface ModelRepository : NSObject
{
    LoginInfo* m_loginInfo;
    LoginState m_loginState;
}

@property (retain) LoginInfo* loginInfo;
@property (assign) LoginState loginState;

+ (ModelRepository*) sharedRepository;

@end

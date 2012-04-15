//
//  ModelRepository.m
//  login
//
//  Created by Longyi Li on 4/14/12.
//  Copyright (c) 2012 Oracle. All rights reserved.
//

#import "ModelRepository.h"

//models
#import "LoginInfo.h"

@implementation ModelRepository

@synthesize loginInfo = m_loginInfo;
@synthesize loginState = m_loginState;


// singleton implementation borrowed from Apple Document
// https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaObjects/CocoaObjects.html
// Listing 2-15  Strict implementation of a singleton
static ModelRepository *sharedRepository = nil;

+ (ModelRepository*)sharedRepository
{
    if (sharedRepository == nil) {
        sharedRepository = [[super allocWithZone:NULL] init];
    }
    return sharedRepository;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self sharedRepository] retain];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (oneway void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

- (id) init
{
    self = [super init];
    NSAssert(self,@"ModelRepository must be initialized.");
    
    self.loginState = LoginStateLoggedOut;
    self.loginInfo = [[LoginInfo alloc] init];

    return self;
}

- (void) dealloc
{
    [self.loginInfo release];
    
    [super dealloc];
    
}

@end

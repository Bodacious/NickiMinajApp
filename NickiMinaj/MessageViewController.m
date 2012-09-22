//
//  MessageViewController.m
//  NickiMinaj
//
//  Created by Gavin Morrice on 16/09/2012.
//  Copyright (c) 2012 Katana Code. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

@synthesize backButton = _backButton;
@synthesize whiteBackground = _whiteBackground;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.whiteBackground.layer setMasksToBounds: NO];
    [self.whiteBackground.layer setCornerRadius: 2]; // if you like rounded corners
    [self.whiteBackground.layer setShadowOffset: CGSizeMake(0, 15)];
    [self.whiteBackground.layer setShadowRadius: 4];
    [self.whiteBackground.layer setShadowOpacity: 0.5];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.backButton = nil;
}

-(void)dealloc
{
    [_backButton release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)backButtonTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end

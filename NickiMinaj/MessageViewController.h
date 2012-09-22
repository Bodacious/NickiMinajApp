//
//  MessageViewController.h
//  NickiMinaj
//
//  Created by Gavin Morrice on 16/09/2012.
//  Copyright (c) 2012 Katana Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MessageViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) IBOutlet UIView *whiteBackground;

-(IBAction)backButtonTapped:(id)sender;

@end

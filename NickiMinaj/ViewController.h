//
//  ViewController.h
//  NickiInMyPocket
//
//  Created by Gavin Morrice on 16/09/2012.
//  Copyright (c) 2012 Katana Code. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
@property (nonatomic, retain) IBOutlet UIButton *playStopButton;
@property (nonatomic, retain) IBOutlet UIButton *resetButton;
@property (nonatomic, retain) IBOutlet UIButton *infoButton;

//-(AVAudioPlayer *)audioPlayer;

-(void)setupPlayStopButton;
-(void)incrementBeat;
-(void)changeBackgroundForBeat;
-(IBAction)playStopButtonTapped:(id)sender;
-(IBAction)resetButtonTapped:(id)sender;
-(IBAction)infoButtonTapped:(id)sender;
-(BOOL)chorusPlaying;
@end

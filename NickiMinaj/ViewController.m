//
//  ViewController.m
//  NickiInMyPocket
//
//  Created by Gavin Morrice on 16/09/2012.
//  Copyright (c) 2012 Katana Code. All rights reserved.
//

#import "UIColor+CustomColors.h"
#import "ViewController.h"
#import "MessageViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    int beat;
    float delay, rapidDelay;
    NSArray *colors;
    BOOL playing;
}


@synthesize audioPlayer = _audioPlayer;
@synthesize playStopButton = _playStopButton;
@synthesize resetButton = _resetButton;
@synthesize infoButton = _infoButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    beat = 0;
    
    delay = 0.95;
    
    rapidDelay = delay/8;
    
    playing = NO;
    
    colors = [[NSMutableArray alloc] initWithObjects: UIColor.customYellowColor, UIColor.customTurquoiseColor, UIColor.customPinkColor, UIColor.customBlueColor, nil];
    
    [self setupPlayStopButton];
    
    [[self audioPlayer] prepareToPlay];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.audioPlayer = nil;
    self.playStopButton = nil;
}

-(void)dealloc
{
    [_audioPlayer release];
    [colors release];
    
    // keep last ...
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)incrementBeat
{
    [self changeBackgroundForBeat];
    beat += 1;
    if ([self chorusPlaying]){
        [self performSelector: @selector(incrementBeat) withObject: nil afterDelay: rapidDelay];
    } else {
        [self performSelector: @selector(incrementBeat) withObject: nil afterDelay: delay];
    }
}

-(void)changeBackgroundForBeat
{
    UIColor *colorForBeat = [colors objectAtIndex: beat % 4];
    [[self view] setBackgroundColor: colorForBeat];
}

-(IBAction)playStopButtonTapped:(id)sender
{
    if (playing){
        [NSObject cancelPreviousPerformRequestsWithTarget: self
                                                 selector: @selector(incrementBeat)
                                                   object: nil];
        playing = false;
        [self.audioPlayer pause];
    } else {
        playing = true;
        [self.audioPlayer play];
        [self incrementBeat];
    }
    [[self playStopButton] setSelected: playing];
}

-(IBAction)resetButtonTapped:(id)sender
{
    // Save the value of 'playing' - if it's YES and
    // we call playStopButtonTapped then it will be set to false
    BOOL wasPlaying = playing;
    if (wasPlaying) {
        [self playStopButtonTapped: self];
    }
    
    // set the beat back to zero
    beat = 0;
    
    // set the playback back to zero
    [self.audioPlayer setCurrentTime:0];

    // set the background back to white
    [[self view] setBackgroundColor: UIColor.whiteColor];

    // play the song again if it was playing
    if (wasPlaying){
        [self playStopButtonTapped: self];
    }
}

-(IBAction)infoButtonTapped:(id)sender
{
    MessageViewController *controller = [[MessageViewController alloc] init];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    [controller release];
}


-(AVAudioPlayer *)audioPlayer{
    if (_audioPlayer) return _audioPlayer;

    NSString *musicPath = [[NSBundle mainBundle] pathForResource: @"Pound the Alarm" ofType: @"caf"];
    NSURL *musicURL = [NSURL fileURLWithPath:musicPath isDirectory:NO];
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: musicURL error: &error];
    _audioPlayer.numberOfLoops = -1;
    
    return _audioPlayer;
}

-(void)setupPlayStopButton
{
    UIImage *greenImage = [[UIImage imageNamed: @"greenButton"] stretchableImageWithLeftCapWidth: 8.0
                                                                                    topCapHeight: 0];
    
    UIImage *redImage   = [[UIImage imageNamed: @"redButton"] stretchableImageWithLeftCapWidth: 8.0
                                                                                  topCapHeight: 0];
    
    
    [self.playStopButton setBackgroundImage: greenImage forState: UIControlStateNormal];
    [self.playStopButton setBackgroundImage: redImage forState: UIControlStateSelected];
    
    [self.playStopButton setTitle:@"Pound It!" forState:UIControlStateNormal];
    [self.playStopButton setTitle:@"Pause It!" forState:UIControlStateSelected];
    
    [self.playStopButton.titleLabel setFont: [UIFont boldSystemFontOfSize: 20]];
    [self.playStopButton.titleLabel setShadowColor: [UIColor lightGrayColor]];
    [self.playStopButton.titleLabel setShadowOffset: CGSizeMake(0, -1)];
}

// returns YES if the chorus is currently playing
-(BOOL)chorusPlaying
{
    return (self.audioPlayer.currentTime > 68.0f && self.audioPlayer.currentTime < 84.0f) ||
    (self.audioPlayer.currentTime > 134.0f && self.audioPlayer.currentTime < 150.0f) ||
    (self.audioPlayer.currentTime > 184.0f && self.audioPlayer.currentTime < 200.0f);
}
@end

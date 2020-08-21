#import "OrizonDockPlayerView.h"

@implementation OrizonDockPlayerView
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    [self setup];
  } return self;
}


-(void) setup {
  [self setBackgroundColor:[UIColor secondarySystemBackgroundColor]];
  [self setTranslatesAutoresizingMaskIntoConstraints:NO];

  [self addImageView];
  [self addSkipButton];
  [self addPlayPauseButton];
  [self addNowPlayingView];
}


-(void) addImageView {
  imageView = [UIImageView new];
  [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [imageView setBackgroundColor:[UIColor tertiarySystemBackgroundColor]];
  [imageView setClipsToBounds:YES];
  [imageView.layer setContinuousCorners:YES];
  [imageView.layer setCornerRadius:15];
  [self addSubview:imageView];

  [imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:16].active = YES;
  [imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:16].active = YES;
  [imageView.heightAnchor constraintEqualToConstant:60].active = YES;
  [imageView.widthAnchor constraintEqualToConstant:60].active = YES;
  [self.bottomAnchor constraintEqualToAnchor:imageView.bottomAnchor constant:16].active = YES;
}


-(void) addSkipButton {
  skipButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [skipButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [skipButton setImage:[UIImage systemImageNamed:@"forward.fill"] forState:UIControlStateNormal];
  [skipButton setTintColor:[UIColor tertiarySystemBackgroundColor]];
  [self addSubview:skipButton];

  [skipButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
  [skipButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-20].active = YES;
  [skipButton.heightAnchor constraintEqualToConstant:40].active = YES;
  [skipButton.widthAnchor constraintEqualToConstant:40].active = YES;
}


-(void) addPlayPauseButton {
  playPauseButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [playPauseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [playPauseButton setImage:[UIImage systemImageNamed:@"play.fill"] forState:UIControlStateNormal];
  [playPauseButton setTintColor:[UIColor tertiarySystemBackgroundColor]];
  [self addSubview:playPauseButton];

  [playPauseButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
  [playPauseButton.trailingAnchor constraintEqualToAnchor:skipButton.leadingAnchor constant:-8].active = YES;
  [playPauseButton.heightAnchor constraintEqualToConstant:40].active = YES;
  [playPauseButton.widthAnchor constraintEqualToConstant:40].active = YES;
}


-(void) addNowPlayingView {
  nowPlayingView = [NowPlayingLabelView new];
  [nowPlayingView.titleLabel setText:@"Unknown"];
  [nowPlayingView.artistLabel setText:[[UIDevice currentDevice] model]];
  [self addSubview:nowPlayingView];

  [nowPlayingView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
  [nowPlayingView.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:16].active = YES;
  [nowPlayingView.trailingAnchor constraintEqualToAnchor:playPauseButton.leadingAnchor constant:-16].active = YES;
}
@end
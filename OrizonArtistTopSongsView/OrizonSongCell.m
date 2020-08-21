#import "OrizonSongCell.h"

@implementation OrizonSongCell
@synthesize imageView, nowPlayingView;
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    [self setup];
  } return self;
}


-(void) setup {
  [self addImageView];
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

  [imageView.topAnchor constraintEqualToAnchor: self.topAnchor].active = YES;
  [imageView.leadingAnchor constraintEqualToAnchor: self.leadingAnchor].active = YES;
  [imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
  [imageView.widthAnchor constraintEqualToAnchor:imageView.heightAnchor].active = YES;
}


-(void) addNowPlayingView {
  nowPlayingView = [NowPlayingLabelView new];
  [nowPlayingView.titleLabel setText:@"Unknown"];
  [nowPlayingView.artistLabel setText:[[UIDevice currentDevice] model]];
  [self addSubview:nowPlayingView];

  [nowPlayingView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
  [nowPlayingView.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:16].active = YES;
  [nowPlayingView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-20].active = YES;
}
@end
#import "NowPlayingLabelView.h"

@implementation NowPlayingLabelView
@synthesize titleLabel, artistLabel;
-(id) init {
  if(self = [super init]) {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self setup];
  } return self;
}


-(void) setup {
  [self addTitleLabel];
  [self addArtistLabel];
}


-(void) addTitleLabel {
  titleLabel = [UILabel new];
  [titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [titleLabel setFont:[UIFont systemFontOfSize:15 weight:UIFontWeightMedium]];
  [titleLabel setTextAlignment:NSTextAlignmentLeft];
  [titleLabel setTextColor:[UIColor labelColor]];
  [self addSubview:titleLabel];

  [titleLabel.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
  [titleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
  [titleLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}


-(void) addArtistLabel {
  artistLabel = [UILabel new];
  [artistLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [artistLabel setFont:[UIFont systemFontOfSize:15]];
  [artistLabel setTextAlignment:NSTextAlignmentLeft];
  [artistLabel setTextColor:[UIColor secondaryLabelColor]];
  [self addSubview:artistLabel];

  [artistLabel.topAnchor constraintEqualToAnchor:titleLabel.bottomAnchor constant:2].active = YES;
  [artistLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
  [artistLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
  [self.bottomAnchor constraintEqualToAnchor:artistLabel.bottomAnchor].active = YES;
}
@end
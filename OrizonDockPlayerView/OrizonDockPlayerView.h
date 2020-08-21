#import "OrizonDockPlayerBaseView.h"
#import "NowPlayingLabelView.h"

@interface OrizonDockPlayerView : OrizonDockPlayerBaseView {
  UIImageView *imageView;
  UIButton *skipButton, *playPauseButton;
  NowPlayingLabelView *nowPlayingView;
}
@end
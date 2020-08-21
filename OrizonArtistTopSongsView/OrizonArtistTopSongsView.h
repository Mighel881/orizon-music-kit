#import "../CALayer+Corners.h"
#import "OrizonSongCell.h"

@interface OrizonArtistTopSongsView : UIView <UICollectionViewDataSource, UICollectionViewDelegate> {
  UIView *contentView;
  UIButton *playPauseButton;
  UICollectionView *songsCollectionView;
  UILabel *topSongsLabel, *genreLabel, *artistLabel;
}
@end
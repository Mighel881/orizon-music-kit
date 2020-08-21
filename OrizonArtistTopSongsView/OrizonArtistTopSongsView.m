#import "OrizonArtistTopSongsView.h"

@implementation OrizonArtistTopSongsView
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    [self setup];
  } return self;
}


-(void) setup {
  [self setTranslatesAutoresizingMaskIntoConstraints:NO];

  [self addContentView];
  [self addPlayPauseButton];
  [self addSongsCollectionView];
  [self addTopSongsLabel];
  [self addGenreLabel];
  [self addArtistLabel];
  [self addArtistImageView];
}


-(void) addContentView {
  contentView = [UIView new];
  [contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [contentView setBackgroundColor:[UIColor secondarySystemBackgroundColor]];
  [contentView setClipsToBounds:YES];
  [contentView.layer setContinuousCorners:YES];
  [contentView.layer setCornerRadius:20];
  [self addSubview:contentView];

  [contentView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
  [contentView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
  [contentView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
  // [contentView.heightAnchor constraintEqualToConstant:400].active = YES;
}


-(void) addPlayPauseButton {
  playPauseButton = [UIButton buttonWithType:UIButtonTypeSystem];
  [playPauseButton setTranslatesAutoresizingMaskIntoConstraints:NO];
  [playPauseButton setBackgroundColor:[UIColor tertiarySystemBackgroundColor]];
  [playPauseButton setImage:[UIImage systemImageNamed:@"play.fill"] forState:UIControlStateNormal];
  [playPauseButton setTintColor:[UIColor whiteColor]];
  [playPauseButton setClipsToBounds:YES];
  [playPauseButton.layer setContinuousCorners:YES];
  [playPauseButton.layer setCornerRadius:30];
  [self addSubview:playPauseButton];

  [playPauseButton.centerYAnchor constraintEqualToAnchor:contentView.bottomAnchor constant:-10].active = YES;
  [playPauseButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
  [playPauseButton.heightAnchor constraintEqualToConstant:60].active = YES;
  [playPauseButton.widthAnchor constraintEqualToConstant:60].active = YES;
  [self.bottomAnchor constraintEqualToAnchor:playPauseButton.bottomAnchor].active = YES;
}


-(void) addSongsCollectionView {
  UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
  [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];

  songsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
  [songsCollectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [songsCollectionView setBackgroundColor:nil];
  [songsCollectionView setDataSource:self];
  [songsCollectionView setDelegate:self];
  [songsCollectionView setPagingEnabled:YES];
  [songsCollectionView setShowsHorizontalScrollIndicator:NO];
  [songsCollectionView registerClass:[OrizonSongCell class] forCellWithReuseIdentifier:@"Song"];
  [contentView addSubview:songsCollectionView];

  [songsCollectionView.leadingAnchor constraintEqualToAnchor:contentView.leadingAnchor constant:16].active = YES;
  [songsCollectionView.bottomAnchor constraintEqualToAnchor:playPauseButton.topAnchor constant:-8].active = YES;
  [songsCollectionView.trailingAnchor constraintEqualToAnchor:contentView.trailingAnchor constant:-16].active = YES;
  [songsCollectionView.heightAnchor constraintEqualToConstant:128].active = YES;
}


-(void) addTopSongsLabel {
  topSongsLabel = [UILabel new];
  [topSongsLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [topSongsLabel setFont:[UIFont systemFontOfSize:13 weight:UIFontWeightMedium]];
  [topSongsLabel setText:@"Top Songs"];
  [topSongsLabel setTextAlignment:NSTextAlignmentLeft];
  [topSongsLabel setTextColor:[UIColor secondaryLabelColor]];
  [self addSubview:topSongsLabel];

  [topSongsLabel.bottomAnchor constraintEqualToAnchor:songsCollectionView.topAnchor constant:-8].active = YES;
  [topSongsLabel.leadingAnchor constraintEqualToAnchor:songsCollectionView.leadingAnchor].active = YES;
  [topSongsLabel.trailingAnchor constraintEqualToAnchor:songsCollectionView.trailingAnchor].active = YES;
}


-(void) addGenreLabel {
  genreLabel = [UILabel new];
  [genreLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [genreLabel setFont:[UIFont systemFontOfSize:15 weight:UIFontWeightMedium]];
  [genreLabel setText:@"Pop"];
  [genreLabel setTextAlignment:NSTextAlignmentCenter];
  [genreLabel setTextColor:[UIColor secondaryLabelColor]];
  [self addSubview:genreLabel];

  [genreLabel.bottomAnchor constraintEqualToAnchor:topSongsLabel.topAnchor constant:-60].active = YES;
  [genreLabel.leadingAnchor constraintEqualToAnchor:topSongsLabel.leadingAnchor].active = YES;
  [genreLabel.trailingAnchor constraintEqualToAnchor:topSongsLabel.trailingAnchor].active = YES;
}


-(void) addArtistLabel {
  artistLabel = [UILabel new];
  [artistLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [artistLabel setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightBold]];
  [artistLabel setText:@"Awaatif Al Sadek"];
  [artistLabel setTextAlignment:NSTextAlignmentCenter];
  [artistLabel setTextColor:[UIColor labelColor]];
  [self addSubview:artistLabel];

  [artistLabel.bottomAnchor constraintEqualToAnchor:genreLabel.topAnchor constant:-8].active = YES;
  [artistLabel.leadingAnchor constraintEqualToAnchor:genreLabel.leadingAnchor].active = YES;
  [artistLabel.trailingAnchor constraintEqualToAnchor:genreLabel.trailingAnchor].active = YES;
}


-(void) addArtistImageView {
  UIImageView *imageView = [UIImageView new];
  [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [imageView setBackgroundColor:[UIColor tertiarySystemBackgroundColor]];
  [imageView setClipsToBounds:YES];
  [imageView.layer setContinuousCorners:YES];
  [imageView.layer setCornerRadius:45];
  [self addSubview:imageView];

  [imageView.topAnchor constraintEqualToAnchor: contentView.topAnchor constant:20].active = YES;
  [imageView.centerXAnchor constraintEqualToAnchor: contentView.centerXAnchor].active = YES;
  [imageView.bottomAnchor constraintEqualToAnchor:artistLabel.topAnchor constant:-16].active = YES;
  [imageView.widthAnchor constraintEqualToConstant:90].active = YES;
  [imageView.heightAnchor constraintEqualToConstant:90].active = YES;
}





// UICollectionViewDataSource
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 6;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  OrizonSongCell *cell = (OrizonSongCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Song" forIndexPath:indexPath];
  return cell;
}


// UICollectionViewDelegateFlowLayout
-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(collectionView.bounds.size.width, 60);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 8;
}

-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 0;
}
@end
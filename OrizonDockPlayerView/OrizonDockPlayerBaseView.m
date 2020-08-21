#import "OrizonDockPlayerBaseView.h"

@implementation OrizonDockPlayerBaseView
-(id) initWithFrame:(CGRect)frame {
  if(self = [super initWithFrame:frame]) {
    [self roundCorners];
  } return self;
}


-(void) roundCorners {
  [self setClipsToBounds:YES];
  [self.layer setContinuousCorners:YES];
  [self.layer setCornerRadius:30];
}
@end
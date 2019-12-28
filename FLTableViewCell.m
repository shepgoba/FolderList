#import "FLTableViewCell.h"

@implementation FLTableViewCell
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 10;
    frame.size.width -= 2 * 10;
    [super setFrame:frame];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    //self.imageView.frame = CGRectMake(0,0,32,32);
}
@end
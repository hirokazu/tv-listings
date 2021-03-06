#import "TVProgramCell.h"
#import "TVProgramCellSelectedBackgroundView.h"
#import "Debug.h"

@implementation TVProgramCell

@synthesize title;
@synthesize detail;
@synthesize time;
@synthesize date;
@synthesize category;

- (void)setTitle:(NSString *)text {
	if (title != text) {
		[title release];
		title = [text retain];
		[self setNeedsDisplay];
	}
}

- (void)setDetail:(NSString *)text {
	if (detail != text) {
		[detail release];
		detail = [text retain];
		[self setNeedsDisplay];
	}
}

- (void)setTime:(NSString *)text {
	if (time != text) {
		[time release];
		time = [text retain];
		[self setNeedsDisplay];
	}
}

- (void)setDate:(NSString *)text {
	if (date != text) {
		[date release];
		date = [text retain];
		[self setNeedsDisplay];
	}
}

- (void)setCategory:(NSString *)text {
	if (category != text) {
		[category release];
		category = [text retain];
		[self setNeedsDisplay];
	}
}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryNone];
		[self setOpaque:YES];
		
		TVProgramCellSelectedBackgroundView *selectedBackgroundView = [[TVProgramCellSelectedBackgroundView alloc] initWithFrame:[self frame]];
		[selectedBackgroundView setCell:self];
		[self setSelectedBackgroundView:selectedBackgroundView];
		[selectedBackgroundView release];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
	[self setNeedsDisplay];
	[self.selectedBackgroundView setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
	[[UIColor colorWithRed:0.0f green:0.2f blue:0.8f alpha:1.0f] set];
	[time drawInRect:CGRectMake(2.0f, 2.0f, 74.0f, 21.0f) withFont:[UIFont boldSystemFontOfSize:12.0f]];
	[[UIColor blackColor] set];
	[title drawInRect:CGRectMake(84.0f, 0.0f, 236.0f, 21.0f) withFont:[UIFont boldSystemFontOfSize:14.0f] lineBreakMode:UILineBreakModeTailTruncation];
	[[UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.0f] set];
	[detail drawInRect:CGRectMake(2.0f, 19.0f, 318.0f, 21.0f) withFont:[UIFont systemFontOfSize:14.0f] lineBreakMode:UILineBreakModeTailTruncation];
}

- (void)drawSelectedBackgroundRect:(CGRect)rect {
	CGGradientRef gradientForSelected = createTwoColorsGradient(5, 140, 245, 1, 93, 230);
	drawRoundedRectBackgroundGradient(rect, gradientForSelected, NO, NO, NO);
	CGGradientRelease(gradientForSelected);
	[[UIColor whiteColor] set];
	[time drawInRect:CGRectMake(2.0f, 2.0f, 74.0f, 21.0f) withFont:[UIFont boldSystemFontOfSize:12.0f]];
	[title drawInRect:CGRectMake(84.0f, 0.0f, 236.0f, 21.0f) withFont:[UIFont boldSystemFontOfSize:14.0f] lineBreakMode:UILineBreakModeTailTruncation];
	[detail drawInRect:CGRectMake(2.0f, 19.0f, 318.0f, 21.0f) withFont:[UIFont systemFontOfSize:14.0f] lineBreakMode:UILineBreakModeTailTruncation];
}

- (void)dealloc {
	LOG_CURRENT_METHOD;
	[title release];
	[detail release];
	[time release];
	[date release];
	[category release];
    [super dealloc];
}

@end

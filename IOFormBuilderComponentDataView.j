@import <AppKit/CPBox.j>

/*!
*       IOFormBuilderComponentDataView:
*
*                       - 
*/

// Class variables. Typically to use to share behavior between instances. See Scope paragraph in http://cappuccino.org/learn/tutorials/objective-j-tutorial.php
var BorderType = CPNoBorder,
    BackgroundColor = [CPColor whiteColor],//[CPColor colorWithCalibratedRed:0.912 green:0.912 blue:0.912 alpha:1.0],
    HEIGHT = 22,
    MARGIN = 5,
    VERTICAL_OFFSET = 2;

@implementation IOFormBuilderComponentDataView : CPBox
{
}

- (id)initWithFrame:(CGRect)aFrame
{
    CPLog.trace("Creating a new " + [self class] + " CGRect(" + aFrame.origin.x + "," + aFrame.origin.y + "," + aFrame.size.width + "," + aFrame.size.height + ")");
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = [[self bounds].size.width],
            height = [[self bounds].size.height];

        [self setBorderType:BorderType];
        [self setBackgroundColor:BackgroundColor];
    }
    return self;
}

- (void)setObjectValue:(id)anObject
{
    var subviews = [self subviews];
    for (var i=0; i < subviews.length; i++) {
        [subviews[i] removeFromSuperview];
    };
    CPLog.trace("Subviews: " + [self subviews]);
    [anObject fillView: self];
    CPLog.trace([[CPString alloc] initWithFormat:@" Set object value method: %@ class[%@] self %@ ", anObject, [anObject class], self]);
}

@end
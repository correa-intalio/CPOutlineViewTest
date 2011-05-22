@import "IOFormBuilderComponent.j"

/*!
*       IOFormBuilderField
*               
*               - Form Builder Field represents fields to add the from  
*
*/
@implementation IOFormBuilderField : IOFormBuilderComponent
{
}

- (id)init
{
    if (self = [super init])
    {
    }
    return self;
}
- (CPString)description
{
    return [super description];
}

- (id)initWithCoder:(CPCoder)theCoder
{
    if (self = [super init])
    {
        // _menu = [theCoder decodeObjectForKey:@"MenuSuperMenuKey"];
        // _title = [theCoder decodeObjectForKey:@"MenuTitleKey"];
        // [self setChildren:[theCoder decodeObjectForKey:@"MenuChildrenKey"]];
    }

    return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    // [aCoder encodeObject:_menu forKey:@"MenuSuperMenuKey"];
    // [aCoder encodeObject:_title forKey:@"MenuTitleKey"];
    // [aCoder encodeObject:_children forKey:@"MenuChildrenKey"];
}

- (id)fillView:(IOFormBuilderComponentDataView)aComponentDataView
{
    // Image
	var aContentRect = CGRectMake(50, 150, 210.0, 10.0);
	[aComponentDataView setFrame: aContentRect];
	var globalHeight = aContentRect.size.height;
  	var anImage = [[CPImage alloc] initWithContentsOfFile:"Resources/AccountNumber.jpg" size:CGSizeMake(46.0, 38.0)];
    var imageBox = [[CPBox alloc] initWithFrame:CGRectMake(2,2, [[anImage size].width], [[anImage size].height] - 2)];
    [imageBox setBackgroundColor:[CPColor colorWithPatternImage:anImage]];
    [imageBox setBorderType: CPNoBorder];

    // Text
    textBoxWidth = ([aContentRect.size.width] - [[anImage size].width]);
    //Changing this so all the texts are aligned
    textBox = [[CPBox alloc] initWithFrame:CGRectMake(50,0, textBoxWidth , globalHeight)];
    [textBox setBorderType: CPNoBorder];
    
    titleLabel = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
	[titleLabel setAlignment:CPCenterTextAlignment];

    [titleLabel setStringValue:"Account Number"];
    [titleLabel setFont:[CPFont boldSystemFontOfSize:14.0]];

    [titleLabel sizeToFit];

    [titleLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
 
    //Calcular Dinamicamente
    descriptionHeightDisplacement = 15;
 
    descriptionLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0,descriptionHeightDisplacement, textBoxWidth , globalHeight)];
	[descriptionLabel setAlignment:CPLeftTextAlignment];

    [descriptionLabel setStringValue:"String Type"];
    [descriptionLabel setFont:[CPFont systemFontOfSize:10.0]];

    [descriptionLabel sizeToFit];

    [descriptionLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    
    [textBox addSubview:titleLabel];
    [textBox addSubview:descriptionLabel];
    
    [aComponentDataView addSubview:imageBox];
    [aComponentDataView addSubview:textBox];
	
	return aComponentDataView;
}

- (int)heightOfRowByItem
{
    return 60;
}

@end
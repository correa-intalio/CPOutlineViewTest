@import "IOFormBuilderComponent.j"

/*!
*       IOFormBuilderTitle
*               
*               - Form Builder Title represents the title of each group: elements, actions, fields and lists 
*
*/
@implementation IOFormBuilderTitle : IOFormBuilderComponent
{
    CPString title;
}

- (id)initWithTitle:(CPString)aTitle
{
    if (self = [super init])
    {
        title = aTitle;
    }
    return self;
}

- (CPString)description
{
    return [[CPString alloc] initWithFormat:@"Title: %@ ", title];
}

- (id)fillView:(IOFormBuilderComponentDataView)aComponentDataView
{
    // var label = [[CPTextField alloc] initWithFrame:[aComponentDataView bounds]];
    //     [label setStringValue:title];
    //     [aComponentDataView addSubview:label];

	
	var titleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 195, 50)];
    [titleLabel setAlignment:CPCenterTextAlignment];

    [titleLabel setStringValue:title];
    [titleLabel setFont:[CPFont boldSystemFontOfSize:14.0]];

    [titleLabel sizeToFit];
    [titleLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [aComponentDataView addSubview:titleLabel];

    var descriptionLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0,15.0, 195 , 60)];
    [descriptionLabel setAlignment:CPLeftTextAlignment];

    [descriptionLabel setStringValue:"description"];
    [descriptionLabel setFont:[CPFont systemFontOfSize:10.0]];

    [descriptionLabel sizeToFit];

    [descriptionLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [aComponentDataView addSubview:descriptionLabel];

	return aComponentDataView;
}
- (int)heightOfRowByItem
{
    return 40;
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

/// Instance creation methods
+ (id)newWithTitle:(CPString)theTitle
{
    return [[self alloc] initWithTitle:theTitle];
}


@end
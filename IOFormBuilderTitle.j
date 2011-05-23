@import "IOFormBuilderComponent.j"

/*!
*       IOFormBuilderTitle
*               
*               - Form Builder Title represents the title of each group: elements, actions, fields and lists 
*
*/
var Componentheight = 20.0;

@implementation IOFormBuilderTitle : IOFormBuilderComponent
{
    CPString title;
    CPBox componentView;
    CPTextField titleLabel;
    CPTextField descriptionLabel;
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

- (CPBox)representationView
{
    if(!componentView)
    {
        componentView = [[CPBox alloc] initWithFrame:CGRectMake(0.0, 0.0, 195, Componentheight)];
        var titleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 195, 50)];
        
     	titleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 195, 50)];
        [titleLabel setAlignment:CPCenterTextAlignment];

        [titleLabel setFont:[CPFont boldSystemFontOfSize:14.0]];

        [titleLabel sizeToFit];
        [titleLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [componentView addSubview:titleLabel];

        descriptionLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0,50,195,30)];
        [descriptionLabel setAlignment:CPLeftTextAlignment];

        [descriptionLabel setFont:[CPFont systemFontOfSize:10.0]];

        [descriptionLabel sizeToFit];

        [descriptionLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [componentView addSubview:descriptionLabel];
    }
    
    [titleLabel setStringValue:title];
    [descriptionLabel setStringValue:"description"];
    
    return componentView;
}

- (id)fillView:(IOFormBuilderComponentDataView)aComponentDataView
{
    // var label = [[CPTextField alloc] initWithFrame:[aComponentDataView bounds]];
    //     [label setStringValue:title];
    //     [aComponentDataView addSubview:label];

    // if(!titleLabel)
    //     {
        componentView = [[CPBox alloc] initWithFrame:CGRectMake(0.0, 0.0, 200, Componentheight)];
        [componentView setBorderType:CPLineBorder];
        [componentView setBorderColor:[CPColor grayColor]];
        //[componentView setBackgroundColor:[CPColor redColor]];

    	titleLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 196.0, Componentheight - 1.0)];
        //titleLabel = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
        //titleLabel = [[CPTextField alloc] initWithFrame:[aComponentDataView bounds]];
        [titleLabel setAlignment:CPLeftTextAlignment];
        [titleLabel setTextColor:[CPColor grayColor]];

        [titleLabel setFont:[CPFont boldSystemFontOfSize:14.0]];

        //[titleLabel sizeToFit];
        //[titleLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        [componentView addSubview:titleLabel];
        [aComponentDataView addSubview:componentView];
        
        [titleLabel setBackgroundColor:[CPColor whiteColor]];

        // descriptionLabel = [[CPTextField alloc] initWithFrame:CGRectMake(0,15.0, 195 , 60)];
        // [descriptionLabel setAlignment:CPLeftTextAlignment];
        // 
        // [descriptionLabel setFont:[CPFont systemFontOfSize:10.0]];
        // 
        // [descriptionLabel sizeToFit];
        // 
        // [descriptionLabel setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
        // [aComponentDataView addSubview:descriptionLabel];
    // }

    [titleLabel setStringValue:title];
    //[descriptionLabel setStringValue:"description"];

	return aComponentDataView;
}
- (int)heightOfRowByItem
{
    return Componentheight;
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
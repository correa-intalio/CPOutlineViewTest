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
    return  "Description: [" + title + "]";
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
@import <Foundation/CPObject.j>

/*!
*       IOFormBuilderComponent
*               
*               - Datasource to use in Palette View in Form Builder.
*
*               - Abstract class. 
*/
@implementation IOFormBuilderComponent : CPObject
{
    CPArray     children @accessors(property=children);
    
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
    return [self title];
}

- (void)insertSubmenu:(IOFormBuilderComponent)theItem atIndex:(int)theIndex
{
    // CPLog.debug(@"insert menu: %@ in menu: %@ at index: %i", theItem, self, theIndex);

    if ([[self children] containsObject:theItem])
        return;

    if ([theItem menu])
        [theItem removeFromMenu];

    [theItem setMenu:self];

    if (theIndex === -1)
        [[self children] addObject:theItem];
    else
        [[self children] insertObject:theItem atIndex:theIndex];

    // CPLog.debug(@"%@ children: %@", self, [self children]);
}

- (void)removeFromMenu
{
    // CPLog.debug(@"remove menu: %@ from menu: %@", self, [self menu]);

    [[[self menu] children] removeObject:self];

    CPLog.debug([[self menu] children]);

    [self setMenu:nil];
}

- (void)setChildren:(CPArray)theChildren
{
    if (theChildren === nil)
        theChildren = [];

    if (_children === theChildren)
        return;

    var childIndex = [theChildren count];
    while (childIndex--)
    {
        var child = theChildren[childIndex];
        [child setMenu:self];
    }

    _children = theChildren;
}

- (id)initWithCoder:(CPCoder)theCoder
{
    if (self = [super init])
    {
        _menu = [theCoder decodeObjectForKey:@"MenuSuperMenuKey"];
        _title = [theCoder decodeObjectForKey:@"MenuTitleKey"];
        [self setChildren:[theCoder decodeObjectForKey:@"MenuChildrenKey"]];
    }

    return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    [aCoder encodeObject:_menu forKey:@"MenuSuperMenuKey"];
    [aCoder encodeObject:_title forKey:@"MenuTitleKey"];
    [aCoder encodeObject:_children forKey:@"MenuChildrenKey"];
}

@end
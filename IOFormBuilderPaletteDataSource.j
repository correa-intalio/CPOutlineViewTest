@import <Foundation/CPObject.j>
@import "IOFormBuilderTitle.j"
/*!
*       IOFormBuilderPaletteDataSource
*               
*               - Datasource to use in Palette View in Form Builder.
*
*               - Abstract class. To manage children relationship. It mustn't be Instantiated.
*/
@implementation IOFormBuilderPaletteDataSource : CPObject
{
    /*!
    *   
    */
    IOFormBuilderComponent     root @accessors;
}

- (id)init
{
    if (self = [super init])
    {
		//TODO: [CPException raise:"MyException" reason:"You didn't do something right."];
        var elementsTitle = [IOFormBuilderTitle newWithTitle:"Elements"],
	        actionsTitle = [IOFormBuilderTitle newWithTitle:"Actions"],
	        fieldsTitle = [IOFormBuilderTitle newWithTitle:"Fields"],
	        listsTitle = [IOFormBuilderTitle newWithTitle:"Lists"],
	    	children = [elementsTitle,actionsTitle,fieldsTitle,listsTitle];
		root = [IOFormBuilderTitle newWithTitle:"Root"];
		[root setChildren: children];
    }
    return self;
}

- (CPString)description
{
    return [super description];
}

- (id)outlineView:(CPOutlineView)theOutlineView child:(int)theIndex ofItem:(id)theItem
{
    if (theItem === nil)
    	theItem = [self root];

    CPLog.debug(@"child: %i ofItem:%@ : %@", theIndex, theItem, [[theItem children] objectAtIndex:theIndex]);

    return [[theItem children] objectAtIndex:theIndex];
}

- (BOOL)outlineView:(CPOutlineView)theOutlineView isItemExpandable:(id)theItem
{
    if (theItem === nil)
    	theItem = [self root];

    CPLog.debug(@"isItemExpandable:%@ : %@", theItem, [[theItem children] count] > 0);

    return [[theItem children] count] > 0;
}

- (int)outlineView:(CPOutlineView)theOutlineView numberOfChildrenOfItem:(id)theItem
{
    if (theItem === nil)
        theItem = [self root];

    CPLog.debug(@"numberOfChildrenOfItem:%@ : %i", theItem, [[theItem children] count]);

    return [[theItem children] count];
}

- (id)outlineView:(CPOutlineView)anOutlineView objectValueForTableColumn:(CPTableColumn)theColumn byItem:(id)theItem
{
    // if ([theColumn identifier] === @"Two")
    //  return @"Two";

    if (theItem === nil)
    	theItem = [self root];

    CPLog.debug(@"objectValueForTableColumn:%@ byItem:%@ : %@", theColumn, theItem, [theItem description]);
	//debugger;
    return [theItem];
}

@end
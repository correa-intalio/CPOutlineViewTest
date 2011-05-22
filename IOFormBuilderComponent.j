@import <Foundation/CPObject.j>
@import "IOFormBuilderComponentDataView.j"
/*!
*       IOFormBuilderComponent
*               
*               - Datasource to use in Palette View in Form Builder.
*
*               - Abstract class. To manage children relationship. It mustn't be Instantiated.
*/
@implementation IOFormBuilderComponent : CPObject
{
    /*!
    *   
    */
    CPArray     children @accessors;
}

- (id)init
{
    if (self = [super init])
    {
		//TODO: [CPException raise:"MyException" reason:"You didn't do something right."];
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
    	theItem = [[theItem children] objectAtIndex:0];

    CPLog.debug(@"child: %i ofItem:%@ : %@", theIndex, theItem, [[theItem children] objectAtIndex:theIndex]);

    return [[theItem children] objectAtIndex:theIndex];
}

- (BOOL)outlineView:(CPOutlineView)theOutlineView isItemExpandable:(id)theItem
{
    if (theItem === nil)
    	theItem = [[theItem children] objectAtIndex:0];

    CPLog.debug(@"isItemExpandable:%@ : %@", theItem, [[theItem children] count] > 0);

    return [[theItem children] count] > 0;
}

- (int)outlineView:(CPOutlineView)theOutlineView numberOfChildrenOfItem:(id)theItem
{
    if (theItem === nil)
        theItem = [[theItem children] objectAtIndex:0];

    CPLog.debug(@"numberOfChildrenOfItem:%@ : %i", theItem, [[theItem children] count]);

    return [[theItem children] count];
}

- (id)outlineView:(CPOutlineView)anOutlineView objectValueForTableColumn:(CPTableColumn)theColumn byItem:(id)theItem
{
    // if ([theColumn identifier] === @"Two")
    //  return @"Two";

    if (theItem === nil)
    	theItem = [[theItem children] objectAtIndex:0];

    // CPLog.debug(@"objectValueForTableColumn:%@ byItem:%@ : %@", theColumn, theItem, [theItem title]);

    return [theItem description];
}

- (id)fillView:(IOFormBuilderComponentDataView)aComponentDataView
{
	var label = [[CPTextField alloc] initWithFrame:[aComponentDataView bounds]];
    [label setStringValue:["Hola!!!!"]];
    [aComponentDataView addSubview:label];
	
	return [aComponentDataView];
}

@end
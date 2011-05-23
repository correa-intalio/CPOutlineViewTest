@import <AppKit/CPOutlineView.j>
/*!
*       IOFormBuilderPaletteView
*                   - 
*
*/
@implementation IOFormBuilderPaletteView : CPView
{
    /*!
    *   
    */
    IOFormBuilderComponent     root @accessors;
    
}

- (id)initWithFrame:(CGRect)aFrame
{
    CPLog.trace("Creating a new " + [self class] + " CGRect(" + aFrame.origin.x + "," + aFrame.origin.y + "," + aFrame.size.width + "," + aFrame.size.height + ")");
    self = [super initWithFrame:aFrame];
    if (self)
    {
        var width = [[self bounds].size.width],
            height = [[self bounds].size.height],
            column = [[CPTableColumn alloc] initWithIdentifier:@"One"],
            scrollView = [[CPScrollView alloc] initWithFrame:[self bounds]],
            outlineView = [[CPOutlineView alloc] initWithFrame:[self bounds]];
            
        var elementsTitle = [IOFormBuilderTitle newWithTitle:"Elements"],
	        actionsTitle = [IOFormBuilderTitle newWithTitle:"Actions"],
	        fieldsTitle = [IOFormBuilderTitle newWithTitle:"Fields"],
	        listsTitle = [IOFormBuilderTitle newWithTitle:"Lists"],
	    	children = [elementsTitle,actionsTitle,fieldsTitle,listsTitle];
		var field = [[IOFormBuilderField alloc] init];
		[fieldsTitle setChildren: [field]]; 
		root = [IOFormBuilderTitle newWithTitle:"Root"];
		[root setChildren: children];

        [outlineView addTableColumn:column];
        [column setDataView:[[IOFormBuilderComponentDataView alloc] initWithFrame:CGRectMakeZero()]];
        //[_outlineView setOutlineTableColumn:column];
        setTimeout(function(){
        [column setWidth:200];
        },0);

        [column setWidth:CPRectGetWidth([self bounds])];
        [outlineView registerForDraggedTypes:[CustomOutlineViewDragType]];

        [outlineView setDataSource:self];
        [outlineView setDelegate:self];
        [outlineView setAllowsMultipleSelection:YES];
        [outlineView expandItem:nil expandChildren:YES];
        //[self setRowHeight:50.0];
        [outlineView setIntercellSpacing:CPSizeMake(0.0, 10.0)]

        [scrollView setDocumentView:outlineView];
        [self addSubview:scrollView];
    }
    return self;
}
@end

/*!
*       PaletteDataSource
*               
*               - Datasource to use in Palette View in Form Builder.
*
*/
@implementation IOFormBuilderPaletteView (OutlineViewDataSource)

- (id)outlineView:(CPOutlineView)theOutlineView child:(int)theIndex ofItem:(id)theItem
{
    if (theItem === nil)
    	theItem = [self root];
    return [[theItem children] objectAtIndex:theIndex];
}

- (BOOL)outlineView:(CPOutlineView)theOutlineView isItemExpandable:(id)theItem
{
    if (theItem === nil)
    	theItem = [self root];
    return [[theItem children] count] > 0;
}

- (int)outlineView:(CPOutlineView)theOutlineView numberOfChildrenOfItem:(id)theItem
{
    if (theItem === nil)
        theItem = [self root];
    return [[theItem children] count];
}

- (id)outlineView:(CPOutlineView)anOutlineView objectValueForTableColumn:(CPTableColumn)theColumn byItem:(id)theItem
{
    if (theItem === nil)
    	theItem = [self root];

    return theItem;
}
@end
/*!
*           IOFormBuilderPaletteView
*                   -
*
*
*/
@implementation IOFormBuilderPaletteView (OutlineViewDelegate)

- (int)outlineView:(CPOutlineView)outlineView heightOfRowByItem:(id)anItem
{
    return [anItem heightOfRowByItem];
}
@end
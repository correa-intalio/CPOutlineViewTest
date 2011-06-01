@import <AppKit/CPOutlineView.j>
@import "IOFormBuilderTitle.j"
@import "IOFormBuilderField.j"
/*!
*       IOFormBuilderPaletteView
*                   - 
*
*/

CustomOutlineViewDragType = @"CustomOutlineViewDragType";


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
        
        var elementsTitle = [IOFormBuilderTitle newWithTitle:"FORM ELEMENTS"],
	        actionsTitle = [IOFormBuilderTitle newWithTitle:"FORM ACTIONS"],
	        fieldsTitle = [IOFormBuilderTitle newWithTitle:"FORM FIELDS"],
	        listsTitle = [IOFormBuilderTitle newWithTitle:"FORM LISTS"],
	    	children = [elementsTitle,actionsTitle,fieldsTitle,listsTitle];
	    	
        var field = [[IOFormBuilderField alloc] init];
        var field2 = [[IOFormBuilderField alloc] init];
        [fieldsTitle setChildren: [field, field2]]; 
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
        [outlineView setAllowsMultipleSelection:NO];
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

- (BOOL)outlineView:(CPOutlineView)anOutlineView writeItems:(CPArray)theItems toPasteboard:(CPPasteBoard)thePasteBoard
{
    _draggedItems = theItems;
    [thePasteBoard declareTypes:[CustomOutlineViewDragType] owner:self];
    [thePasteBoard setData:[CPKeyedArchiver archivedDataWithRootObject:theItems] forType:CustomOutlineViewDragType];

    return YES;
}

- (CPDragOperation)outlineView:(CPOutlineView)anOutlineView validateDrop:(id < CPDraggingInfo >)theInfo proposedItem:(id)theItem proposedChildIndex:(int)theIndex
{
    CPLog.debug(@"validate item: %@ at index: %i", theItem, theIndex);

    if (theItem === nil)
        [anOutlineView setDropItem:nil dropChildIndex:theIndex];

    [anOutlineView setDropItem:theItem dropChildIndex:theIndex];

    return CPDragOperationEvery;
}

- (BOOL)outlineView:(CPOutlineView)outlineView acceptDrop:(id < CPDraggingInfo >)theInfo item:(id)theItem childIndex:(int)theIndex
{
    // if (theItem === nil)
    //     theItem = [self menu];
    // 
    // // CPLog.debug(@"drop item: %@ at index: %i", theItem, theIndex);
    // 
    // var menuIndex = [_draggedItems count];
    // 
    // while (menuIndex--)
    // {
    //     var menu = [_draggedItems objectAtIndex:menuIndex];
    // 
    //     // CPLog.debug(@"move item: %@ to: %@ index: %@", menu, theItem, theIndex);
    // 
    //     if (menu === theItem)
    //         continue;
    // 
    //     [menu removeFromMenu];
    //     [theItem insertSubmenu:menu atIndex:theIndex];
    //     theIndex += 1;
    // }
    // 
    // return YES;
    return NO;
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

- (BOOL)outlineView:(CPOutlineView)anOutlineView shouldEditTableColumn:(CPTableColumn)aColumn item:(int)aRow
{
    CPLog.trace("......Diego.....");
    return YES;
}
@end

@implementation CPColor (OutlineView) 
+ (CPColor)selectionColor 
{ 
        //return [CPColor colorWithPatternImage:[[CPImage alloc] 
        //initByReferencingFile:@"Resources/gradient.png" size:CGSizeMake (1,20)]]; 
        return [CPColor colorWithHexString:@"5f83b9"]; 
} 

+ (CPColor)selectionColorSourceView { 
        //return [CPColor colorWithPatternImage:[[CPImage alloc] initByReferencingFile:@"Resources/tableviewselection.png" size:CGSizeMake(6,22)]];  
        return [CPColor greenColor];
} 

@end

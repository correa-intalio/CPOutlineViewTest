/*
 * AppController.j
 * outlineview
 *
 * Created by You on January 22, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPOutlineView.j>
@import "IOFormBuilderPaletteDataSource.j"
@import "IOFormBuilderComponentDataView.j"

CPLogRegister(CPLogConsole);

CustomOutlineViewDragType = @"CustomOutlineViewDragType";


var rowHeights = [ ];


@implementation AppController : CPObject
{
    CPOutlineView   _outlineView;

    CPArray         _draggedItems;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];
	var datasource = [[IOFormBuilderPaletteDataSource alloc] init];
    var scrollView = [[CPScrollView alloc] initWithFrame:[contentView bounds]];

    _outlineView = [[CPOutlineView alloc] initWithFrame:[contentView bounds]];

    var column = [[CPTableColumn alloc] initWithIdentifier:@"One"];
    [_outlineView addTableColumn:column];
    [column setDataView:[[IOFormBuilderComponentDataView alloc] initWithFrame:CGRectMakeZero()]];
    //[_outlineView setOutlineTableColumn:column];
    setTimeout(function(){
    [column setWidth:200];
    },0);

    [column setWidth:CPRectGetWidth([_outlineView bounds])];
    [_outlineView registerForDraggedTypes:[CustomOutlineViewDragType]];

    [_outlineView setDataSource:datasource];
    [_outlineView setDelegate:self];
    [_outlineView setAllowsMultipleSelection:YES];
    [_outlineView expandItem:nil expandChildren:YES];
    //[_outlineView setRowHeight:50.0];
    [_outlineView setIntercellSpacing:CPSizeMake(0.0, 10.0)]

    [scrollView setDocumentView:_outlineView];
    [theWindow setContentView:scrollView];

    // [theWindow setContentView:_outlineView];

    [theWindow orderFront:self];

}

- (int)outlineView:(CPOutlineView)outlineView heightOfRowByItem:(id)anItem
{
    return [anItem heightOfRowByItem];
}

@end
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
@import "IOFormBuilderPaletteView.j"
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

    [theWindow setContentView:[[IOFormBuilderPaletteView alloc] initWithFrame:[contentView bounds]]];
    [theWindow orderFront:self];

}
@end
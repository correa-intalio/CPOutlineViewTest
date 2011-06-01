/*
 * AppController.j
 * outlineview
 *
 * Created by You on January 22, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPOutlineView.j>
@import "IOFormBuilderPaletteView.j"
CPLogRegister(CPLogConsole);



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
    var dragReceiver = [[DragReceiver alloc] initWithFrame:CGRectMake(300,150,300,200)];

        
    [contentView addSubview:[[IOFormBuilderPaletteView alloc] initWithFrame:CGRectMake(0.0, 0.0, 250, 600)]];
    [contentView addSubview:dragReceiver];
    [theWindow orderFront:self];

}
@end

@import <AppKit/CPView.j>



@implementation DragReceiver : CPView
{
    CPTextField textField;
}

- (id)initWithFrame:(CGRect)aFrame 
{
    
	self = [super initWithFrame:aFrame];
	[self setBackgroundColor:[CPColor lightGrayColor]];
	textField = [[CPTextField alloc] initWithFrame:CGRectMake(0,0,200,20)];
	[textField setStringValue:@""];
	[textField setEditable:NO];
	[textField setFont:[CPFont systemFontOfSize:14.0]];
	[textField sizeToFit];
	[self addSubview:textField];
	
	[self registerForDraggedTypes:[CustomOutlineViewDragType]];
	return self;
}

- (void)performDragOperation:(CPDraggingInfo)aSender
{
    var data = [[aSender draggingPasteboard] dataForType:CustomOutlineViewDragType];
    var item = [CPKeyedUnarchiver unarchiveObjectWithData:data];
    console.log(item);
    // var types = [[aSender draggingPasteboard] types];
    // CPLog.trace("performDragOperation data:" + item + " types:" + types);
    textField setStringValue:item[0] 
    [[CPNotificationCenter defaultCenter] postNotificationName:@"CustomOutlineViewDragType" object:self];
    [self setBackgroundColor:[CPColor lightGrayColor]];
}



- (void)draggingEntered:(CPDraggingInfo)aSender
{
    [self setBackgroundColor:[CPColor lightGrayColor]];
}

- (void)draggingExited:(CPDraggingInfo)aSender
{
    [self setBackgroundColor:[CPColor lightGrayColor]];
}
@end
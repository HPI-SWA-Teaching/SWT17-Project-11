event handling
filterMouseEvent: anEvent for: anObject
	anEvent isDraggingEvent ifTrue: [ self step updateDraw ].
	((self step isEventInNavigator: anEvent) or:
	[(self step isEventInHighlightedMorph: anEvent) or: 
	[anObject = self step highlightedMorph]])
		ifFalse: [ anEvent ignore ].
	^ anEvent
*46Deprecated
showHScrollBarOnlyWhenNeeded: bool
	"Get rid of scroll bar for short panes that don't want it shown."

	self deprecated.

	self setProperty: #noHScrollBarPlease toValue: bool not.
	self setProperty: #hScrollBarAlways toValue: bool not.
	
	bool
		ifTrue: [self hScrollBarPolicy: #whenNeeded]
		ifFalse: [self hScrollBarPolicy: #never].
	
	self hHideOrShowScrollBar.

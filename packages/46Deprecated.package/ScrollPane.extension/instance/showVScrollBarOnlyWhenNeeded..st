*46Deprecated
showVScrollBarOnlyWhenNeeded: bool
	"Get rid of scroll bar for short panes that don't want it shown."

	self deprecated. 

	self setProperty: #noVScrollBarPlease toValue: bool not.
	self setProperty: #vScrollBarAlways toValue: bool not.
	
	bool
		ifTrue: [self vScrollBarPolicy: #whenNeeded]
		ifFalse: [self vScrollBarPolicy: #never].
	
	self vHideOrShowScrollBar.

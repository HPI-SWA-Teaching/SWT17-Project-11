*46Deprecated
hideHScrollBarIndefinitely: bool
	"Get rid of scroll bar for short panes that don't want it shown."

	self deprecated. 
	
	self setProperty: #noHScrollBarPlease toValue: bool.
	
	bool
		ifTrue: [self hScrollBarPolicy: #never]
		ifFalse: [self hScrollBarPolicy: #whenNeeded].
	
	self hHideOrShowScrollBar.

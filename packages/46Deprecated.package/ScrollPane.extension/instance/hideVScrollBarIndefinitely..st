*46Deprecated
hideVScrollBarIndefinitely: bool
	"Get rid of scroll bar for short panes that don't want it shown."

	self deprecated. 
	
	self setProperty: #noVScrollBarPlease toValue: bool.
	
	bool
		ifTrue: [self vScrollBarPolicy: #never]
		ifFalse: [self vScrollBarPolicy: #whenNeeded].
	
	self vHideOrShowScrollBar.

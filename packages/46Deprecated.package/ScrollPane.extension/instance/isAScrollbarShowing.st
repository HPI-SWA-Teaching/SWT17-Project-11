*46Deprecated
isAScrollbarShowing
	"Return true if a either retractable scroll bar is currently showing"
	
	self flag: #deprectaed. "mt: Use #isAnyScrollbarShowing"
	retractableScrollBar ifFalse:[^true].
	^self hIsScrollbarShowing or: [self vIsScrollbarShowing]

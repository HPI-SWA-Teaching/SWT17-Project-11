as yet unclassified
endStory
	self isRunning ifFalse: [^	self].
	self isRunning: false. 
	self onEndBlock ifNotNil: [self onEndBlock value].
	self currentStep exitStep.
	self navigator delete.
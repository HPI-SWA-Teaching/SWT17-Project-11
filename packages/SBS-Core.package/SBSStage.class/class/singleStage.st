accessing
singleStage

	self basicSingleStage ifNil: [self singleStage: self basicNew initialize].
	^ self basicSingleStage
actions
findByCriteria: aMethodBlock
 
	^ self basicUseDeepSearch 
			ifTrue: [self deepSearchCriteria: aMethodBlock]
			ifFalse: [self flatSearchCriteria: aMethodBlock]
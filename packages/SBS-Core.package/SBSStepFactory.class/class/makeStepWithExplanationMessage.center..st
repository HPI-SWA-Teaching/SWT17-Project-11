as yet unclassified
makeStepWithExplanationMessage: anExplanationString center: aPoint 
	^ SBSStep new addExplanation: ((SBSExplanation withText: anExplanationString atCenter: aPoint) textColor: self DefaultExplanationTextColor;
			 backgroundColor: self DefaultExplanationBackgroundColor)
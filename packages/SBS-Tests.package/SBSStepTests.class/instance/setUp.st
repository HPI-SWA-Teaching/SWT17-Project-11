as yet unclassified
setUp 

	| step1 |
	step1 := (SBSStepFactory makeStepWithExplainationMessage: 'TEST' atPosition: 200@200).
	story := ((SBSStory  withTitle: 'test') addStep: step1).

	self wantsToTest: step1.
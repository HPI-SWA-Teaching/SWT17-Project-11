as yet unclassified
testFadeExitAnimation
	self subject morphs first addExitAnimation: ((SBSFadeAnimation newFadeOutWithDuration: 400) onFinishBlock: [self assert: self subject morphs first color alpha equals: 0]).
	self subject morphs first play startPlay.
	self assert: (self subject morphs first color alpha roundTo: 0.1) equals: 0.5.
	self subject morphs first play nextScene.
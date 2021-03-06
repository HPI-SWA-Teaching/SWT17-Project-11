*46Deprecated
exportSegmentWithCatagories: catList classes: classList fileName: aFileName directory: aDirectory
	"Store my project out on the disk as an *exported* ImageSegment.  All outPointers will be in a form that can be resolved in the target image.  Name it <project name>.extSeg.  What do we do about subProjects, especially if they are out as local image segments?  Force them to come in?
	Player classes are included automatically."

	| is str ans revertSeg roots holder |
	self flag: #toRemove.
	self halt.  "unused"
	"world == World ifTrue: [^ false]."
		"self inform: 'Can''t send the current world out'."
	world ifNil: [^ false].  world presenter ifNil: [^ false].

	ScrapBook default emptyScrapBook.
	world currentHand pasteBuffer: nil.	  "don't write the paste buffer."
	world currentHand mouseOverHandler initialize.	  "forget about any references here"
		"Display checkCurrentHandForObjectToPaste."
	Command initialize.
	world clearCommandHistory.
	world fullReleaseCachedState; releaseViewers. 
	world cleanseStepList.
	world localFlapTabs size = world flapTabs size ifFalse: [
		self error: 'Still holding onto Global flaps'].
	world releaseSqueakPages.
	holder := Project allProjects.	"force them in to outPointers, where DiskProxys are made"

	"Just export me, not my previous version"
	revertSeg := self parameterAt: #revertToMe.
	self projectParameters removeKey: #revertToMe ifAbsent: [].

	roots := OrderedCollection new.
	roots add: self; add: world; add: transcript; add: changeSet; add: thumbnail.
	roots add: world activeHand; addAll: classList; addAll: (classList collect: [:cls | cls class]).

	roots := roots reject: [ :x | x isNil].	"early saves may not have active hand or thumbnail"

	catList do: [:sysCat | 
		(SystemOrganization listAtCategoryNamed: sysCat asSymbol) do: [:symb |
			roots add: (Smalltalk at: symb); add: (Smalltalk at: symb) class]].

	is := ImageSegment new copySmartRootsExport: roots asArray.
		"old way was (is := ImageSegment new copyFromRootsForExport: roots asArray)"

	is state = #tooBig ifTrue: [^ false].

	str := ''.
	"considered legal to save a project that has never been entered"
	(is outPointers includes: world) ifTrue: [
		str := str, '\Project''s own world is not in the segment.' withCRs].
	str isEmpty ifFalse: [
		ans := (UIManager default
				 chooseFrom: #('Do not write file' 'Write file anyway' 'Debug')
				 title: str).
		ans = 1 ifTrue: [
			revertSeg ifNotNil: [self projectParameterAt: #revertToMe put: revertSeg].
			^ false].
		ans = 3 ifTrue: [self halt: 'Segment not written']].

	is writeForExportWithSources: aFileName inDirectory: aDirectory.
	revertSeg ifNotNil: [self projectParameterAt: #revertToMe put: revertSeg].
	holder.
	world flapTabs do: [:ft | 
			(ft respondsTo: #unhibernate) ifTrue: [ft unhibernate]].
	is arrayOfRoots do: [:obj |
		obj isScriptEditorMorph ifTrue: [obj unhibernate]].
	^ true

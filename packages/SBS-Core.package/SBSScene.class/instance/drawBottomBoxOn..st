drawing
drawBottomBoxOn: aCanvas

	self
		drawBox: (self left @ self highlightedMorph bottom corner: self bottomRight)
		on: aCanvas.
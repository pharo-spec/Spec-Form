Extension { #name : 'Object' }

{ #category : '*Spec-Form' }
Object >> asFormPresenter [
	
	^ SRDynamicDescriptionCache 
		use: Dictionary new 
		during: [ self simpleReneDescription asFormPresenterOn: self ]
]

{ #category : '*Spec-Form' }
Object >> asFormPresenterWithOwner: anOwner [
	
	^ SRDynamicDescriptionCache 
		use: Dictionary new 
		during: [ 
			self simpleReneDescription 
				asFormPresenterOn: self
				withOwner: anOwner ]
]

{ #category : '*Spec-Form' }
Object >> asFormPresenterWithinApplication: app [
	
	^ SRDynamicDescriptionCache 
		use: Dictionary new 
		during: [ 
			self simpleReneDescription 
				asFormPresenterOn: self
				withinApplication: app ]
]

Extension { #name : 'Object' }

{ #category : '*Spec-Form' }
Object >> asFormPresenter [
	
	^ SRDynamicDescriptionCache 
		use: Dictionary new 
		during: [ self simpleReneDescription asFormPresenterOn: self ]
]

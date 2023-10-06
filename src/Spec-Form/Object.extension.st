Extension { #name : #Object }

{ #category : #'*Spec-Form' }
Object >> asSpPresenter [
	
	^ SRDynamicDescriptionCache 
		use: Dictionary new 
		during: [ self simpleReneDescription asSpecPresenterOn: self ]
]

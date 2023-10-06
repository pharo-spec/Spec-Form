Extension { #name : #SRContainer }

{ #category : #'*Spec-Form' }
SRContainer >> asSpecPresenterOn: anObject [
	
	^ SFContainerPresenter memento: (anObject simpleReneMementoClass
			model: anObject 
			description: self)
]

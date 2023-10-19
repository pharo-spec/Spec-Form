Extension { #name : #SRContainer }

{ #category : #'*Spec-Form' }
SRContainer >> asFormPresenterOn: anObject [
	
	^ SFContainerPresenter memento: (anObject simpleReneMementoClass
		model: anObject 
		description: self)
]

{ #category : #'*Spec-Form' }
SRContainer >> initialExtent [

	^ self propertyAt: #initialExtent ifAbsent: [ nil ]
]

{ #category : #'*Spec-Form' }
SRContainer >> initialExtent: aPoint [

	self propertyAt: #initialExtent put: aPoint
]

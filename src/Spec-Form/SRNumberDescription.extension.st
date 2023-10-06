Extension { #name : #SRNumberDescription }

{ #category : #'*Spec-Form' }
SRNumberDescription >> beFloat [

	self kind: Float.
	self digits: 2
]

{ #category : #'*Spec-Form' }
SRNumberDescription >> digits [

	^ self propertyAt:  #digits ifAbsent: [ 0 ]
]

{ #category : #'*Spec-Form' }
SRNumberDescription >> digits: aNumber [

	self propertyAt:  #digits put: 2
]

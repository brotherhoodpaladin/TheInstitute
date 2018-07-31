Scriptname bp:ActivateLinkedContainerDummyScript extends ObjectReference Const 
{This script activates a linked reference container.}

Event OnActivate(ObjectReference akActionRef)
	Debug.Trace("Activated by " + akActionRef)
	getLinkedRef().activate(akActionRef)
EndEvent

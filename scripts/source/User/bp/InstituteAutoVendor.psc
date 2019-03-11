ScriptName bp:InstituteAutoVendor extends ObjectReference Const Hidden
{This script is used to automatically sell items.}

;-- Properties --------------------------------------
Message Property akAutoVendorConfirmationMessage Auto Const Mandatory
{The confirmation message to confirm the sale of the items.}
Message Property akAutoVendorInvalidItem Auto Const Mandatory
{The message to display when an invalid item is placed in the container.}
Keyword Property UnscrappableObject Auto Const Mandatory
{A keyword that indicates that the item should not be scrapped and may be unique.}

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Event OnInit()
	; Before we can use OnMenuOpenCloseEvent we must register it.
	Debug.Trace("Attempting to Register for Event")
	RegisterForMenuOpenCloseEvent("ContainerMenu")
	; Register a filter if necessary.
	;	Debug.Trace("Attempting to set Inventory Filter")
	;	AddInventoryEventFilter(None)
	Debug.DumpEventRegistrations(self)
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	Debug.Trace("Checking Menu Name")
	If (asMenuName== "ContainerMenu")
		Debug.Trace("Inside ContainerMenu")
		If (!abOpening)
			Debug.Trace("ContainerMenu Closing")
			; Check for Keyword Unscrappable which usually indicates unique objects.
			removeUniqueItems(Game.GetPlayer(), Self)
			Debug.Trace("Removed unscrappable items and returned to player.")

			int iNumItems = Self.GetItemCount(None)
			int iTotalValue = Self.GetInventoryValue()
			Debug.Trace("Items: " + iNumItems + " Total Value: " + iTotalValue)

			If (iNumItems > 0 && iTotalValue > 0)
				; Since we deal in whole caps, we will cast it back to int to round to a whole number.
				int iDisposalFee = (iTotalValue as float * 0.25) as int
				int iTotal = iTotalValue - iDisposalFee
				int iSelectedButtonIndex =  akAutoVendorConfirmationMessage.show(iNumItems as float, iTotalValue as float, iDisposalFee as float, iTotal as float, 0, 0, 0, 0, 0)
				If (iSelectedButtonIndex == 1)
					Debug.Trace("Player confirmed sale.")
					Self.RemoveAllItems(None, False)
					Debug.Trace("Items removed from container inventory.")
					Game.GivePlayerCaps(iTotal)
					Debug.Trace("Player given caps.")
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

; Remove items that are marked with the Keyword Unscrappable since these are generally unique items.
Function removeUniqueItems(Actor akActorRef, ObjectReference akContainerRef)
	if(akContainerRef.GetItemCount(UnscrappableObject) > 0)
		akContainerRef.RemoveItem(UnscrappableObject, -1, False, akActorRef)
		akAutoVendorInvalidItem.show()
	EndIf
EndFunction

; This method works on containers which have an open/close functionality like chests.
;/
Event OnClose(ObjectReference akActionRef)
If (akActionRef == Game.GetPlayer() as ObjectReference)
; Check for Keyword Unscrappable which usually indicates unique objects.
removeUniqueItems(Game.GetPlayer(), Self)
int iNumItems = Self.GetItemCount(None)
int iTotalValue = Self.GetInventoryValue()
If (iNumItems > 0 && iTotalValue > 0)
int iDisposalFee = (iTotalValue as float * 0.25) as int
int iTotal = iTotalValue - iDisposalFee
int iSelectedButtonIndex =  akAutoVendorConfirmationMessage.show(iNumItems as float, iTotalValue as float, iDisposalFee as float, iTotal as float, 0, 0, 0, 0, 0)
If (iSelectedButtonIndex == 1)
Self.RemoveAllItems(None, False)
Game.GivePlayerCaps(iTotal);
EndIf
EndIf
EndIf
EndEvent
/;

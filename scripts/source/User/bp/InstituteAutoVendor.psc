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
	RegisterForMenuOpenCloseEvent("ContainerMenu")
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	If (asMenuName== "ContainerMenu")
		If (!abOpening)
			; Check for Keyword Unscrappable which usually indicates unique objects.
			removeUniqueItems(Game.GetPlayer(), Self)

			int iNumItems = Self.GetItemCount(None)
			int iTotalValue = Self.GetInventoryValue()
			If (iNumItems > 0 && iTotalValue > 0)
				; Since we deal in whole caps, we will cast it back to int to round to a whole number.
				int iDisposalFee = (iTotalValue as float * 0.25) as int
				int iTotal = iTotalValue - iDisposalFee
				int iSelectedButtonIndex =  akAutoVendorConfirmationMessage.show(iNumItems as float, iTotalValue as float, iDisposalFee as float, iTotal as float, 0, 0, 0, 0, 0)
				If (iSelectedButtonIndex == 1)
					Self.RemoveAllItems(None, False)
					Game.GivePlayerCaps(iTotal);
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

ScriptName bp:InstituteRecycler extends ObjectReference Const hidden
{ This script will breakdown scrap items added to the container into components and add the scrap to an alternate container, or player.
An example implementation would use a container which had the CA_JunkItems list as a limiter on it. Items added would be transferred to
the temporary container and processed. The resulting scrap would  be added back to the alternate container or player.}

;-- Properties --------------------------------------

Group Required
Message Property pRecyclerDialogMessage Auto Const Mandatory
{Dialog to display to the user to confirm before recycling.}
ObjectReference Property pRecyclerTemporaryContainerRef Auto Const Mandatory
{The temporary container where the scrap will be processed before transferring to pRecyclerStorageContainerRef or player.}
FormList Property pRecyclerComponents Auto Const Mandatory
{A list of components, e.g. c_Acid.}
FormList Property pRecyclerScrap Auto Const Mandatory
{A list of scrap objects, e.g. c_Acid_scrap.}
FormList Property CA_JunkItems Auto Const Mandatory
{A list of scrap items identified as junk. Used in AddInventoryEventFilter to allow OnItemAdded/OnItemRemoved events to work.}
EndGroup

Group Optional
ObjectReference Property pRecyclerStorageContainerRef Auto Const
{Optional Container to send recycled scrop components to on completion. The default is the player.}
EndGroup

; There are 31 types of components and matching scrap objects in the game.
Group Components
component Property c_Acid Auto Const
component Property c_Adhesive Auto Const
component Property c_Aluminum Auto Const
component Property c_AntiBallisticFiber Auto Const
component Property c_Antiseptic Auto Const
component Property c_Asbestos Auto Const
component Property c_Bone Auto Const
component Property c_Ceramic Auto Const
component Property c_Circuitry Auto Const
component Property c_Cloth Auto Const
component Property c_Concrete Auto Const
component Property c_Copper Auto Const
component Property c_Cork Auto Const
component Property c_Crystal Auto Const
component Property c_Fertilizer Auto Const
component Property c_Fiberglass Auto Const
component Property c_FiberOptics Auto Const
component Property c_Gears Auto Const
component Property c_Glass Auto Const
component Property c_Gold Auto Const
component Property c_Lead Auto Const
component Property c_Leather Auto Const
component Property c_NuclearMaterial Auto Const
component Property c_Oil Auto Const
component Property c_Plastic Auto Const
component Property c_Rubber Auto Const
component Property c_Screws Auto Const
component Property c_Silver Auto Const
component Property c_Springs Auto Const
component Property c_Steel Auto Const
component Property c_Wood Auto Const
EndGroup

; There are 31 types of scrap objects and matching components in the game.
Group Scrap
MiscObject Property c_Acid_scrap Auto Const
MiscObject Property c_Adhesive_scrap Auto Const
MiscObject Property c_Aluminum_scrap Auto Const
MiscObject Property c_AntiBallisticFiber_scrap Auto Const
MiscObject Property c_Antiseptic_scrap Auto Const
MiscObject Property c_Asbestos_scrap Auto Const
MiscObject Property c_Bone_scrap Auto Const
MiscObject Property c_Ceramic_scrap Auto Const
MiscObject Property c_Circuitry_scrap Auto Const
MiscObject Property c_Cloth_scrap Auto Const
MiscObject Property c_Concrete_scrap Auto Const
MiscObject Property c_Copper_scrap Auto Const
MiscObject Property c_Cork_scrap Auto Const
MiscObject Property c_Crystal_scrap Auto Const
MiscObject Property c_Fertilizer_scrap Auto Const
MiscObject Property c_Fiberglass_scrap Auto Const
MiscObject Property c_FiberOptics_scrap Auto Const
MiscObject Property c_Gears_scrap Auto Const
MiscObject Property c_Glass_scrap Auto Const
MiscObject Property c_Gold_scrap Auto Const
MiscObject Property c_Lead_scrap Auto Const
MiscObject Property c_Leather_scrap Auto Const
MiscObject Property c_NuclearMaterial_scrap Auto Const
MiscObject Property c_Oil_scrap Auto Const
MiscObject Property c_Plastic_scrap Auto Const
MiscObject Property c_Rubber_scrap Auto Const
MiscObject Property c_Screws_scrap Auto Const
MiscObject Property c_Silver_scrap Auto Const
MiscObject Property c_Springs_scrap Auto Const
MiscObject Property c_Steel_scrap Auto Const
MiscObject Property c_Wood_scrap Auto Const
EndGroup

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Event OnInit()
	; Before we can use OnMenuOpenCloseEvent we must register it.
	RegisterForMenuOpenCloseEvent("ContainerMenu")
	AddInventoryEventFilter(CA_JunkItems)
EndEvent

Event OnClose(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		int itemCount = Self.GetItemCount(None)
		if(itemCount > 0)
			int iSelectedButtonIndex = pRecyclerDialogMessage.Show()
			If (iSelectedButtonIndex == 1)
				Debug.Notification(itemCount + " items to be recycled.")
				Self.RemoveAllItems(pRecyclerTemporaryContainerRef, False)
				AutoRecycle(pRecyclerComponents, pRecyclerScrap, pRecyclerTemporaryContainerRef)
				If(pRecyclerStorageContainerRef != None)
					pRecyclerTemporaryContainerRef.RemoveAllItems(pRecyclerStorageContainerRef as ObjectReference, False)
				Else
					pRecyclerTemporaryContainerRef.RemoveAllItems(Game.getPlayer() as ObjectReference, False)
				EndIf
				Debug.Notification("All items have been recycled.")
			EndIf
		EndIf
	EndIf
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	Self.RemoveItem(akBaseItem, aiItemCount, True, pRecyclerTemporaryContainerRef)
	AutoRecycle(pRecyclerComponents,pRecyclerScrap, pRecyclerTemporaryContainerRef)
	If(pRecyclerStorageContainerRef != None)
		pRecyclerTemporaryContainerRef.RemoveAllItems(pRecyclerStorageContainerRef as ObjectReference, False)
	Else
		pRecyclerTemporaryContainerRef.RemoveAllItems(Game.getPlayer() as ObjectReference, False)
	EndIf
EndEvent


Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	If (asMenuName== "ContainerMenu")
		If (!abOpening)
			int itemCount = Self.GetItemCount(None)
			if(itemCount > 0)
				Debug.Notification(itemCount + " items to be recycled.")
				int iSelectedButtonIndex = pRecyclerDialogMessage.Show()
				If (iSelectedButtonIndex == 1)

					;/
					recycle(c_Acid, c_Acid_scrap)
					recycle(c_Adhesive, c_Adhesive_scrap)
					recycle(c_Aluminum, c_Aluminum_scrap)
					recycle(c_AntiBallisticFiber, c_AntiBallisticFiber_scrap)
					recycle(c_Antiseptic, c_Antiseptic_scrap)
					recycle(c_Asbestos, c_Asbestos_scrap)
					recycle(c_Bone, c_Bone_scrap)
					recycle(c_Ceramic, c_Ceramic_scrap)
					recycle(c_Circuitry, c_Circuitry_scrap)
					recycle(c_Cloth, c_Cloth_scrap)
					recycle(c_Concrete, c_Concrete_scrap)
					recycle(c_Copper, c_Copper_scrap)
					recycle(c_Cork, c_Cork_scrap)
					recycle(c_Crystal, c_Crystal_scrap)
					recycle(c_Fertilizer, c_Fertilizer_scrap)
					recycle(c_Fiberglass, c_Fiberglass_scrap)
					recycle(c_FiberOptics, c_FiberOptics_scrap)
					recycle(c_Gears, c_Gears_scrap)
					recycle(c_Glass, c_Glass_scrap)
					recycle(c_Gold, c_Gold_scrap)
					recycle(c_Lead,c_Lead_scrap)
					recycle(c_Leather, c_Leather_scrap)
					recycle(c_NuclearMaterial, c_NuclearMaterial_scrap)
					recycle(c_Oil, c_Oil_scrap)
					recycle(c_Plastic, c_Plastic_scrap)
					recycle(c_Rubber, c_Rubber_scrap)
					recycle(c_Screws, c_Screws_scrap)
					recycle(c_Silver, c_Silver_scrap)
					recycle(c_Springs, c_Springs_scrap)
					recycle(c_Steel, c_Steel_scrap)
					recycle(c_Wood, c_Wood_scrap)
					/;

					Self.RemoveAllItems(pRecyclerTemporaryContainerRef, False)
					AutoRecycle(pRecyclerComponents, pRecyclerScrap, pRecyclerTemporaryContainerRef)
					If(pRecyclerStorageContainerRef != None)
						;Self.RemoveAllItems(pRecyclerStorageContainerRef as ObjectReference, false)
						pRecyclerTemporaryContainerRef.RemoveAllItems(pRecyclerStorageContainerRef as ObjectReference, false)
					Else
						;Self.RemoveAllItems(Game.getPlayer() as ObjectReference, false)
						pRecyclerTemporaryContainerRef.RemoveAllItems(Game.getPlayer() as ObjectReference, False)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

;/
; Basic Recycling Function that takes a specific component (if any) from the ObjectReference container (self),
; and returns the scrap back to the original container.
/;
Function Recycle(component C, MiscObject CS)
	int numComponents = Self.getComponentCount(C as Form)
	Self.removeComponents(C, numComponents, True)
	Self.addItem(CS as Form, numComponents, True)
EndFunction

;/
; Advanced Recycling Function that takes component lists and checks for components (if any) from
; the ObjectReference container (self) and returns the scrap back to the original container.
/;
Function AdvancedRecycle(FormList akComponentFormList, FormList akScrapFormList)
	int iIndex = akComponentFormList.GetSize()
	While iIndex
		iIndex -= 1
		component componentReference = akComponentFormList.GetAt(iIndex) as component
		Form scrapReference = akScrapFormList.getAt(iIndex) as Form
		int numComponents = Self.getComponentCount(componentReference as Form)
		Self.removeComponents(componentReference, numComponents, True)
		Self.addItem(scrapReference, numComponents, True)
	EndWhile
EndFunction

;/
; Auto Recycling Function that takes component and scrap lists. It checks for components (if any) from
; the ObjectReference container provided and returns the scrap back to ObjectReference.
;
; Note: The akComponentFormList and akScrapFormList should have the same number of components and in
; the same order. You can compare with the Component and Scrap Groups in this script.
/;
Function AutoRecycle(FormList akComponentFormList, FormList akScrapFormList, ObjectReference akContainer)
	int iIndex = akComponentFormList.GetSize()
	While iIndex
		iIndex -= 1
		component componentReference = akComponentFormList.GetAt(iIndex) as component
		Form scrapReference = akScrapFormList.getAt(iIndex) as Form
		int numComponents = akContainer.getComponentCount(componentReference as Form)
		akContainer.removeComponents(componentReference, numComponents, True)
		akContainer.addItem(scrapReference, numComponents, True)
	EndWhile
EndFunction

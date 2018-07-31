;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname bp:Fragments:Terminals:InstituteRequisitionHolotape Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
requisition(pPlayer,pAluminum,pCaps001, pFailureMessage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
requisition(pPlayer,pAntiBallisticFiber,pCaps001, pFailureMessage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
requisition(pPlayer,pFiberglass,pCaps001, pFailureMessage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
requisition(pPlayer,pAdhesive,pCaps001, pFailureMessage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
requisition(pPlayer,pCrystal,pCaps001, pFailureMessage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
requisition(pPlayer,pCircuitry,pCaps001, pFailureMessage)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
requisition(pPlayer,pFiberOptics,pCaps001, pFailureMessage)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;-- Properties --------------------------------------
MiscObject Property pCaps001 Auto Const
Actor Property pPlayer Auto Const
Message Property pFailureMessage Auto Const

Group MaterielRequisitions
  MiscObject Property pAdhesive Auto Const
  MiscObject Property pAluminum Auto Const
  MiscObject Property pAntiBallisticFiber Auto Const
  MiscObject Property pCircuitry Auto Const
  MiscObject Property pCrystal Auto Const
  MiscObject Property pFiberglass Auto Const
  MiscObject Property pFiberOptics Auto Const
EndGroup


;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Function requisition (Actor akActor, MiscObject akRequistionedObject, MiscObject akCaps, Message akMessage)
  int caps = akActor.getItemCount(akCaps)
  int cost = akRequistionedObject.getGoldValue()
  If (caps >= cost)
    akActor.additem(akRequistionedObject, 1)
    akActor.removeItem(akCaps, cost)
  ElseIf (caps < cost)
    akMessage.show()
  EndIf
EndFunction

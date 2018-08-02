Scriptname bp:BobbleHeadDisplayContainer extends ObjectReference Const
{This script activates and de-activates linked static Bobbleheads when added or removed from the container.}

;-- Properties --------------------------------------

Keyword Property BobbleheadKeyword Auto Const

Group BobbleHeads
  MiscObject Property BobbleHead_Agility Auto Const
  MiscObject Property BobbleHead_Barter Auto Const
  MiscObject Property BobbleHead_BigGuns Auto Const
  MiscObject Property BobbleHead_Charisma Auto Const
  MiscObject Property BobbleHead_Endurance Auto Const
  MiscObject Property BobbleHead_EnergyWeapons Auto Const
  MiscObject Property BobbleHead_Explosives Auto Const
  MiscObject Property BobbleHead_Intelligence Auto Const
  MiscObject Property BobbleHead_LockPicking Auto Const
  MiscObject Property BobbleHead_Luck Auto Const
  MiscObject Property BobbleHead_Medicine Auto Const
  MiscObject Property BobbleHead_Melee Auto Const
  MiscObject Property BobbleHead_Perception Auto Const
  MiscObject Property BobbleHead_Repair Auto Const
  MiscObject Property BobbleHead_Science Auto Const
  MiscObject Property BobbleHead_SmallGuns Auto Const
  MiscObject Property BobbleHead_Sneak Auto Const
  MiscObject Property BobbleHead_Speech Auto Const
  MiscObject Property BobbleHead_Strength Auto Const
  MiscObject Property BobbleHead_Unarmed Auto Const
EndGroup

Group StaticBobbleHeads
  ObjectReference Property pAgilityBobbleHead Auto Const
  {The reference for Agility Bobblehead.}
  ObjectReference Property pBarterBobbleHead Auto Const
  {The reference for Barter Bobblehead.}
  ObjectReference Property pBigGunsBobbleHead Auto Const
  {The reference for Big Guns Bobblehead.}
  ObjectReference Property pCharismaBobbleHead Auto Const
  {The reference for Charisma Bobblehead.}
  ObjectReference Property pEnduranceBobbleHead Auto Const
  {The reference for Endurance Bobblehead.}
  ObjectReference Property pEnergyWeaponsBobbleHead Auto Const
  {The reference for Energy Weapons Bobblehead.}
  ObjectReference Property pExplosivesBobbleHead Auto Const
  {The reference for Explosives Bobblehead.}
  ObjectReference Property pIntelligenceBobbleHead Auto Const
  {The reference for Intelligence Bobblehead.}
  ObjectReference Property pLockPickingBobbleHead Auto Const
  {The reference for Lock Picking Bobblehead.}
  ObjectReference Property pLuckBobbleHead Auto Const
  {The reference for Luck Bobblehead.}
  ObjectReference Property pMedicineBobbleHead Auto Const
  {The reference for Medicine Bobblehead.}
  ObjectReference Property pMeleeBobbleHead Auto Const
  {The reference for Melee Bobblehead.}
  ObjectReference Property pPerceptionBobbleHead Auto Const
  {The reference for Perception Bobblehead.}
  ObjectReference Property pRepairBobbleHead Auto Const
  {The reference for Repair Bobblehead.}
  ObjectReference Property pScienceBobbleHead Auto Const
  {The reference for Science Bobblehead.}
  ObjectReference Property pSmallGunsBobbleHead Auto Const
  {The reference for Small Guns Bobblehead.}
  ObjectReference Property pSneakBobbleHead Auto Const
  {The reference for Sneak Bobblehead.}
  ObjectReference Property pSpeechBobbleHead Auto Const
  {The reference for Speech Bobblehead.}
  ObjectReference Property pStrengthBobbleHead Auto Const
  {The reference for Strength Bobblehead.}
  ObjectReference Property pUnarmedBobbleHead Auto Const
  {The reference for Unarmed Bobblehead.}
EndGroup

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

Event OnInit()
  Debug.Trace("Initialized BobbleHead Display Container.")
  AddInventoryEventFilter(BobbleheadKeyword)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
  Debug.Notification(akBaseItem.GetName() + " added.")

  If(BobbleHead_Agility == akBaseItem)
    pAgilityBobbleHead.Enable()
  ElseIf(BobbleHead_Barter == akBaseItem)
    pBarterBobbleHead.Enable()
  ElseIf(BobbleHead_BigGuns == akBaseItem)
    pBigGunsBobbleHead.Enable()
  ElseIf(BobbleHead_Charisma == akBaseItem)
    pCharismaBobbleHead.Enable()
  ElseIf(BobbleHead_Endurance == akBaseItem)
    pEnduranceBobbleHead.Enable()
  ElseIf(BobbleHead_EnergyWeapons == akBaseItem)
    pEnergyWeaponsBobbleHead.Enable()
  ElseIf(BobbleHead_Explosives == akBaseItem)
    pExplosivesBobbleHead.Enable()
  ElseIf(BobbleHead_Intelligence == akBaseItem)
    pIntelligenceBobbleHead.Enable()
  ElseIf(BobbleHead_LockPicking == akBaseItem)
    pLockPickingBobbleHead.Enable()
  ElseIf(BobbleHead_Luck == akBaseItem)
    pLuckBobbleHead.Enable()
  ElseIf(BobbleHead_Medicine == akBaseItem)
    pMedicineBobbleHead.Enable()
  ElseIf(BobbleHead_Melee == akBaseItem)
    pMeleeBobbleHead.Enable()
  ElseIf(BobbleHead_Perception == akBaseItem)
    pPerceptionBobbleHead.Enable()
  ElseIf(BobbleHead_Repair == akBaseItem)
    pRepairBobbleHead.Enable()
  ElseIf(BobbleHead_Science == akBaseItem)
    pScienceBobbleHead.Enable()
  ElseIf(BobbleHead_SmallGuns == akBaseItem)
    pSmallGunsBobbleHead.Enable()
  ElseIf(BobbleHead_Sneak == akBaseItem)
    pSneakBobbleHead.Enable()
  ElseIf(BobbleHead_Speech == akBaseItem)
    pSpeechBobbleHead.Enable()
  ElseIf(BobbleHead_Strength == akBaseItem)
    pStrengthBobbleHead.Enable()
  ElseIf(BobbleHead_Unarmed == akBaseItem)
    pUnarmedBobbleHead.Enable()
  EndIf

EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
  Debug.Notification(akBaseItem.GetName() + " removed.")

  If(BobbleHead_Agility == akBaseItem)
    pAgilityBobbleHead.Disable()
  ElseIf(BobbleHead_Barter == akBaseItem)
    pBarterBobbleHead.Disable()
  ElseIf(BobbleHead_BigGuns == akBaseItem)
    pBigGunsBobbleHead.Disable()
  ElseIf(BobbleHead_Charisma == akBaseItem)
    pCharismaBobbleHead.Disable()
  ElseIf(BobbleHead_Endurance == akBaseItem)
    pEnduranceBobbleHead.Disable()
  ElseIf(BobbleHead_EnergyWeapons == akBaseItem)
    pEnergyWeaponsBobbleHead.Disable()
  ElseIf(BobbleHead_Explosives == akBaseItem)
    pExplosivesBobbleHead.Disable()
  ElseIf(BobbleHead_Intelligence == akBaseItem)
    pIntelligenceBobbleHead.Disable()
  ElseIf(BobbleHead_LockPicking == akBaseItem)
    pLockPickingBobbleHead.Disable()
  ElseIf(BobbleHead_Luck == akBaseItem)
    pLuckBobbleHead.Disable()
  ElseIf(BobbleHead_Medicine == akBaseItem)
    pMedicineBobbleHead.Disable()
  ElseIf(BobbleHead_Melee == akBaseItem)
    pMeleeBobbleHead.Disable()
  ElseIf(BobbleHead_Perception == akBaseItem)
    pPerceptionBobbleHead.Disable()
  ElseIf(BobbleHead_Repair == akBaseItem)
    pRepairBobbleHead.Disable()
  ElseIf(BobbleHead_Science == akBaseItem)
    pScienceBobbleHead.Disable()
  ElseIf(BobbleHead_SmallGuns == akBaseItem)
    pSmallGunsBobbleHead.Disable()
  ElseIf(BobbleHead_Sneak == akBaseItem)
    pSneakBobbleHead.Disable()
  ElseIf(BobbleHead_Speech == akBaseItem)
    pSpeechBobbleHead.Disable()
  ElseIf(BobbleHead_Strength == akBaseItem)
    pStrengthBobbleHead.Disable()
  ElseIf(BobbleHead_Unarmed == akBaseItem)
    pUnarmedBobbleHead.Disable()
  EndIf

EndEvent

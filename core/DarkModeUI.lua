local DarkModeUI=CreateFrame("Frame")
local DarkModeTooltip=CreateFrame("Frame")
DarkModeTooltip:RegisterEvent("PLAYER_LOGIN")
local DarkModeFrames=CreateFrame("Frame")
DarkModeFrames:RegisterEvent("PLAYER_LOGIN")
local event_frame = CreateFrame("Frame")
local TOOLTIP = true;
local TALKINGHEAD = false;
local DARKFRAMES = true;
local enable
local onevent

function onevent(frame, event, ...)
    if event == "PLAYER_LOGIN" then
        enable()
    end
end
event_frame:SetScript("OnEvent", onevent)
event_frame:RegisterEvent("PLAYER_LOGIN")

local f = CreateFrame("Frame")
function f:OnEvent(event, addon)
    if not TALKINGHEAD == true then
        if addon == "Blizzard_TalkingHeadUI" then
            hooksecurefunc(
                "TalkingHeadFrame_PlayCurrent",
                function()
                    TalkingHeadFrame:Hide()
                end
            )
            self:UnregisterEvent(event)
        end
    end
end
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", f.OnEvent)

local CF = CreateFrame("Frame")
CF:RegisterEvent("PLAYER_ENTERING_WORLD")
CF:RegisterEvent("GROUP_ROSTER_UPDATE")

function ColorRaid()
    for g = 1, NUM_RAID_GROUPS do
        local group = _G["CompactRaidGroup" .. g .. "BorderFrame"]
        if group then
            for _, region in pairs({group:GetRegions()}) do
                if region:IsObjectType("Texture") then
                    region:SetVertexColor(1, 1, 1)
                end
            end
        end
        for m = 1, 5 do
            local frame = _G["CompactRaidGroup" .. g .. "Member" .. m]
            if frame then
                groupcolored = true
                for _, region in pairs({frame:GetRegions()}) do
                    if region:GetName():find("Border") then
                        region:SetVertexColor(1, 1, 1)
                    end
                end
            end
            local frame = _G["CompactRaidFrame" .. m]
            if frame then
                singlecolored = true
                for _, region in pairs({frame:GetRegions()}) do
                    if region:GetName():find("Border") then
                        region:SetVertexColor(1, 1, 1)
                    end
                end
            end
        end
    end
    for _, region in pairs({CompactRaidFrameContainerBorderFrame:GetRegions()}) do
        if region:IsObjectType("Texture") then
            region:SetVertexColor(1, 1, 1)
        end
    end
end

CF:SetScript(
    "OnEvent",
    function(self, event)
        if DARKFRAMES == true then
            ColorRaid()
            CF:SetScript(
                "OnUpdate",
                function()
                    if CompactRaidGroup1 and not groupcolored == true then
                        ColorRaid()
                    end
                    if CompactRaidFrame1 and not singlecolored == true then
                        ColorRaid()
                    end
                end
            )
            if event == "GROUP_ROSTER_UPDATE" then
                return
            end
            if
                not (IsAddOnLoaded("Shadowed Unit Frames") or IsAddOnLoaded("PitBull Unit Frames 4.0") or
                IsAddOnLoaded("X-Perl UnitFrames"))
            then
                for i, v in pairs(
                    {
                        AlternatePowerBarBorder,
                        AlternatePowerBarLeftBorder,
                        AlternatePowerBarRightBorder,
                        TargetFrameToTTextureFrameTexture,
                    }
                ) do
                    v:SetVertexColor(.35, .35, .35)
                end

                for _, region in pairs({StopwatchFrame:GetRegions()}) do
                    region:SetVertexColor(.35, .35, .35)
                end

                for _, region in pairs({CompactRaidFrameManager:GetRegions()}) do
                    if region:IsObjectType("Texture") then
                        region:SetVertexColor(.35, .35, .35)
                    end
                end
                for _, region in pairs({CompactRaidFrameManagerContainerResizeFrame:GetRegions()}) do
                    if region:GetName():find("Border") then
                        region:SetVertexColor(.35, .35, .35)
                    end
                end
                

                for i, v in pairs(
                    {
                        PlayerPVPIcon,
                        TargetFrameTextureFramePVPIcon,
                        FocusFrameTextureFramePVPIcon
                    }
                ) do
                    v:SetAlpha(0)
                end
                for i = 1, 4 do
                    _G["PartyMemberFrame" .. i .. "PVPIcon"]:SetAlpha(0)
                    _G["PartyMemberFrame" .. i .. "NotPresentIcon"]:Hide()
                    _G["PartyMemberFrame" .. i .. "NotPresentIcon"].Show = function()
                    end
                end
                PlayerFrameGroupIndicator:SetAlpha(0)
                PlayerHitIndicator:SetText(nil)
                PlayerHitIndicator.SetText = function()
                end
                PetHitIndicator:SetText(nil)
                PetHitIndicator.SetText = function()
                end
                for _, child in pairs({WarlockPowerFrame:GetChildren()}) do
                    for _, region in pairs({child:GetRegions()}) do
                        if region:GetDrawLayer() == "BORDER" then
                            region:SetVertexColor(.35, .35, .35)
                        end
                    end
                end
            else
                CastingBarFrameBorder:SetVertexColor(.35, .35, .35)
            end

            for i, v in pairs(
                {
                    MicroButtonAndBagsBar.MicroBagBar,
                    MainMenuBarArtFrameBackground.BackgroundLarge,
                    MainMenuBarArtFrameBackground.BackgroundLarge2,
                    MainMenuBarArtFrameBackground.BackgroundSmall,
                    MainMenuBarArtFrameBackground.BagsArt,
                    MainMenuBarArtFrameBackground.MicroButtonArt,
                    StatusTrackingBarManager.SingleBarLarge,
                    StatusTrackingBarManager.SingleBarSmall,
                    SlidingActionBarTexture0,
                    SlidingActionBarTexture1,
                    MainMenuBarTexture0,
                    MainMenuBarTexture1,
                    MainMenuBarTexture2,
                    MainMenuBarTexture3,
                    MainMenuMaxLevelBar0,
                    MainMenuMaxLevelBar1,
                    MainMenuMaxLevelBar2,
                    MainMenuMaxLevelBar3,
                    MainMenuXPBarTextureLeftCap,
                    MainMenuXPBarTextureRightCap,
                    MainMenuXPBarTextureMid,
                    ReputationWatchBarTexture0,
                    ReputationWatchBarTexture1,
                    ReputationWatchBarTexture2,
                    ReputationWatchBarTexture3,
                    ReputationXPBarTexture0,
                    ReputationXPBarTexture1,
                    ReputationXPBarTexture2,
                    ReputationXPBarTexture3,
                }
            ) do
                v:SetVertexColor(.35, .35, .35)
            end
            for i, v in pairs(
                {
                    MainMenuBarArtFrame.LeftEndCap,
                    MainMenuBarArtFrame.RightEndCap,
                    StanceBarLeft,
                    StanceBarMiddle,
                    StanceBarRight
                }
            ) do
                v:SetVertexColor(.35, .35, .35)
            end
        end
    end
)

if (IsAddOnLoaded("ClassicUI")) then
   
end

local CF = CreateFrame("Frame")
local _, instanceType = IsInInstance()
CF:RegisterEvent("ADDON_LOADED")
CF:RegisterEvent("PLAYER_ENTERING_WORLD")
CF:RegisterEvent("ARENA_PREP_OPPONENT_SPECIALIZATIONS")
CF:SetScript(
    "OnEvent",
    function(self, event, addon)
        if DARKFRAMES == true then
            if addon == "Blizzard_ArenaUI" and not (IsAddOnLoaded("Shadowed Unit Frames")) then
                for i, v in pairs(
                    {
                        ArenaEnemyFrame1Texture,
                        ArenaEnemyFrame2Texture,
                        ArenaEnemyFrame3Texture,
                        ArenaEnemyFrame4Texture,
                        ArenaEnemyFrame5Texture,
                        ArenaEnemyFrame1SpecBorder,
                        ArenaEnemyFrame2SpecBorder,
                        ArenaEnemyFrame3SpecBorder,
                        ArenaEnemyFrame4SpecBorder,
                        ArenaEnemyFrame5SpecBorder,
                        ArenaEnemyFrame1PetFrameTexture,
                        ArenaEnemyFrame2PetFrameTexture,
                        ArenaEnemyFrame3PetFrameTexture,
                        ArenaEnemyFrame4PetFrameTexture,
                        ArenaEnemyFrame5PetFrameTexture
                    }
                ) do
                    v:SetVertexColor(.35, .35, .35)
                end
            elseif
                event == "ARENA_PREP_OPPONENT_SPECIALIZATIONS" or (event == "PLAYER_ENTERING_WORLD" and instanceType == "arena")
            then
                for i, v in pairs(
                    {
                        ArenaPrepFrame1Texture,
                        ArenaPrepFrame2Texture,
                        ArenaPrepFrame3Texture,
                        ArenaPrepFrame4Texture,
                        ArenaPrepFrame5Texture,
                        ArenaPrepFrame1SpecBorder,
                        ArenaPrepFrame2SpecBorder,
                        ArenaPrepFrame3SpecBorder,
                        ArenaPrepFrame4SpecBorder,
                        ArenaPrepFrame5SpecBorder
                    }
                ) do
                    v:SetVertexColor(.35, .35, .35)
                end
            end

            if IsAddOnLoaded("Blizzard_ArenaUI") then
                for i, v in pairs(
                    {
                        ArenaEnemyFrame1Texture,
                        ArenaEnemyFrame2Texture,
                        ArenaEnemyFrame3Texture,
                        ArenaEnemyFrame4Texture,
                        ArenaEnemyFrame5Texture,
                        ArenaEnemyFrame1SpecBorder,
                        ArenaEnemyFrame2SpecBorder,
                        ArenaEnemyFrame3SpecBorder,
                        ArenaEnemyFrame4SpecBorder,
                        ArenaEnemyFrame5SpecBorder,
                        ArenaEnemyFrame1PetFrameTexture,
                        ArenaEnemyFrame2PetFrameTexture,
                        ArenaEnemyFrame3PetFrameTexture,
                        ArenaEnemyFrame4PetFrameTexture,
                        ArenaEnemyFrame5PetFrameTexture
                    }
                ) do
                    v:SetVertexColor(.35, .35, .35)
                end
            end
        end
    end
)

DarkModeFrames:SetScript("OnEvent", function(self, event)
		for i, v in pairs({	
			GameMenuFrame.Border.TopEdge,
			GameMenuFrame.Border.RightEdge,
			GameMenuFrame.Border.BottomEdge,
			GameMenuFrame.Border.LeftEdge,
			GameMenuFrame.Border.TopRightCorner,
			GameMenuFrame.Border.TopLeftCorner,
			GameMenuFrame.Border.BottomLeftCorner,
			GameMenuFrame.Border.BottomRightCorner,
			StaticPopup1.Border.TopEdge,
			StaticPopup1.Border.RightEdge,
			StaticPopup1.Border.BottomEdge,
			StaticPopup1.Border.LeftEdge,
			StaticPopup1.Border.TopRightCorner,
			StaticPopup1.Border.TopLeftCorner,
			StaticPopup1.Border.BottomLeftCorner,
			StaticPopup1.Border.BottomRightCorner}) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i = 1, 5 do
			_G["ContainerFrame".. i .."BackgroundTop"]:SetVertexColor(.35, .35, .35)
			_G["ContainerFrame".. i .."BackgroundMiddle1"]:SetVertexColor(.35, .35, .35)
			_G["ContainerFrame".. i .."BackgroundMiddle2"]:SetVertexColor(.35, .35, .35)
			_G["ContainerFrame".. i .."BackgroundBottom"]:SetVertexColor(.35, .35, .35)
		end
		BackpackTokenFrame:GetRegions():SetVertexColor(.35, .35, .35)


		ActionBarUpButton:GetRegions():SetVertexColor(.35, .35, .35)
		ActionBarDownButton:GetRegions():SetVertexColor(.35, .35, .35)

		for i, v in pairs({	
			LFDRoleCheckPopup.Border.TopEdge,
			LFDRoleCheckPopup.Border.RightEdge,
			LFDRoleCheckPopup.Border.BottomEdge,
			LFDRoleCheckPopup.Border.LeftEdge,
			LFDRoleCheckPopup.Border.TopRightCorner,
			LFDRoleCheckPopup.Border.TopLeftCorner,
			LFDRoleCheckPopup.Border.BottomLeftCorner,
			LFDRoleCheckPopup.Border.BottomRightCorner,
			PVPReadyDialog.Border.TopEdge,
			PVPReadyDialog.Border.RightEdge,
			PVPReadyDialog.Border.BottomEdge,
			PVPReadyDialog.Border.LeftEdge,
			PVPReadyDialog.Border.TopRightCorner,
			PVPReadyDialog.Border.TopLeftCorner,
			PVPReadyDialog.Border.BottomLeftCorner,
			PVPReadyDialog.Border.BottomRightCorner,}) do
				v:SetVertexColor(.35, .35, .35)
		end

		TimerTracker:HookScript("OnEvent", function(self)
			if event ~= "START_TIMER" then return; end
			for i = 1, #self.timerList do
				_G['TimerTrackerTimer'..i..'StatusBarBorder']:SetVertexColor(.35, .35, .35)
			end
		end)

		for i, v in pairs({	
			CharacterFrame.NineSlice.RightEdge,
			CharacterFrame.NineSlice.LeftEdge,
			CharacterFrame.NineSlice.TopEdge,
			CharacterFrame.NineSlice.BottomEdge,
			CharacterFrame.NineSlice.PortraitFrame,
			CharacterFrame.NineSlice.TopRightCorner,
			CharacterFrame.NineSlice.TopLeftCorner,
			CharacterFrame.NineSlice.BottomLeftCorner,
			CharacterFrame.NineSlice.BottomRightCorner,
			TokenFramePopup.Border.TopEdge,
			TokenFramePopup.Border.RightEdge,
			TokenFramePopup.Border.BottomEdge,
			TokenFramePopup.Border.LeftEdge,
			TokenFramePopup.Border.TopRightCorner,
			TokenFramePopup.Border.TopLeftCorner,
			TokenFramePopup.Border.BottomLeftCorner,
			TokenFramePopup.Border.BottomRightCorner,
			ReputationDetailFrame.Border.TopEdge,
			ReputationDetailFrame.Border.RightEdge,
			ReputationDetailFrame.Border.BottomEdge,
			ReputationDetailFrame.Border.LeftEdge,
			ReputationDetailFrame.Border.TopRightCorner,
			ReputationDetailFrame.Border.TopLeftCorner,
			ReputationDetailFrame.Border.BottomLeftCorner,
			ReputationDetailFrame.Border.BottomRightCorner }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			CharacterFrame.Bg,
			CharacterFrame.TitleBg, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({	
			CharacterFrameInset.NineSlice.RightEdge,
			CharacterFrameInset.NineSlice.LeftEdge,
			CharacterFrameInset.NineSlice.TopEdge,
			CharacterFrameInset.NineSlice.BottomEdge,
			CharacterFrameInset.NineSlice.PortraitFrame,
			CharacterFrameInset.NineSlice.TopRightCorner,
			CharacterFrameInset.NineSlice.TopLeftCorner,
			CharacterFrameInset.NineSlice.BottomLeftCorner,
			CharacterFrameInset.NineSlice.BottomRightCorner,
			CharacterFrameInsetRight.NineSlice.RightEdge,
			CharacterFrameInsetRight.NineSlice.LeftEdge,
			CharacterFrameInsetRight.NineSlice.TopEdge,
			CharacterFrameInsetRight.NineSlice.BottomEdge,
			CharacterFrameInsetRight.NineSlice.PortraitFrame,
			CharacterFrameInsetRight.NineSlice.TopRightCorner,
			CharacterFrameInsetRight.NineSlice.TopLeftCorner,
			CharacterFrameInsetRight.NineSlice.BottomLeftCorner,
			CharacterFrameInsetRight.NineSlice.BottomRightCorner,
			PaperDollInnerBorderLeft,
			PaperDollInnerBorderRight,
			PaperDollInnerBorderTop,
			PaperDollInnerBorderTopLeft,
			PaperDollInnerBorderTopRight,
			PaperDollInnerBorderBottom,
			PaperDollInnerBorderBottomLeft,
			PaperDollInnerBorderBottomRight,
			PaperDollInnerBorderBottom2 }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			CharacterFeetSlotFrame,
			CharacterHandsSlotFrame,
			CharacterWaistSlotFrame,
			CharacterLegsSlotFrame,
			CharacterFinger0SlotFrame,
			CharacterFinger1SlotFrame,
			CharacterTrinket0SlotFrame,
			CharacterTrinket1SlotFrame,
			CharacterWristSlotFrame,
			CharacterTabardSlotFrame,
			CharacterShirtSlotFrame,
			CharacterChestSlotFrame,
			CharacterBackSlotFrame,
			CharacterShoulderSlotFrame,
			CharacterNeckSlotFrame,
			CharacterHeadSlotFrame,
			CharacterMainHandSlotFrame,
			CharacterSecondaryHandSlotFrame }) do
				v:SetAlpha(0)
		end
		_G.select(CharacterMainHandSlot:GetNumRegions(), CharacterMainHandSlot:GetRegions()):SetAlpha(0)
		_G.select(CharacterSecondaryHandSlot:GetNumRegions(), CharacterSecondaryHandSlot:GetRegions()):SetAlpha(0)

		for i, v in pairs({ 	
			ReputationListScrollFrameScrollBarThumbTexture,
			ReputationListScrollFrameScrollBarScrollUpButton.Normal,
			ReputationListScrollFrameScrollBarScrollDownButton.Normal,
			ReputationListScrollFrameScrollBarScrollUpButton.Disabled,
			ReputationListScrollFrameScrollBarScrollDownButton.Disabled,

 		}) do
			v:SetVertexColor(.35, .35, .35)
		end
		_G.select(1, ReputationListScrollFrame:GetRegions()):SetVertexColor(.35, .35, .35)
		_G.select(2, ReputationListScrollFrame:GetRegions()):SetVertexColor(.35, .35, .35)

		for i, v in pairs({ 	
			TokenFrameContainerScrollBarTop,
			TokenFrameContainerScrollBarMiddle,
			TokenFrameContainerScrollBarBottom,
			TokenFrameContainerScrollBarThumbTexture,
			TokenFrameContainerScrollBarScrollUpButton.Normal,
			TokenFrameContainerScrollBarScrollDownButton.Normal,
			TokenFrameContainerScrollBarScrollUpButton.Disabled,
			TokenFrameContainerScrollBarScrollDownButton.Disabled,

 		}) do
			v:SetVertexColor(.35, .35, .35)
		end
	
		for i, v in pairs({ SpellBookFrame.NineSlice.TopEdge,
			SpellBookFrame.NineSlice.RightEdge,
			SpellBookFrame.NineSlice.LeftEdge,
			SpellBookFrame.NineSlice.TopEdge,
			SpellBookFrame.NineSlice.BottomEdge,
			SpellBookFrame.NineSlice.PortraitFrame,
			SpellBookFrame.NineSlice.TopRightCorner,
			SpellBookFrame.NineSlice.TopLeftCorner,
			SpellBookFrame.NineSlice.BottomLeftCorner,
			SpellBookFrame.NineSlice.BottomRightCorner,
		 	SpellBookFrameInset.NineSlice.BottomEdge, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			SpellBookFrame.Bg,
			SpellBookFrame.TitleBg,
			SpellBookFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end
		SpellBookFrameInset:SetAlpha(0)
		
		for i, v in pairs({ PVEFrame.NineSlice.TopEdge,
			PVEFrame.NineSlice.TopRightCorner,
			PVEFrame.NineSlice.RightEdge,
			PVEFrame.NineSlice.BottomRightCorner,
			PVEFrame.NineSlice.BottomEdge,
			PVEFrame.NineSlice.BottomLeftCorner,
			PVEFrame.NineSlice.LeftEdge,
			PVEFrame.NineSlice.TopLeftCorner }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			PVEFrame.Bg,
			PVEFrame.TitleBg,
			LFDQueueFrameBackground,
			LFDParentFrameRoleBackground,
			PVEFrameLeftInset.NineSlice.TopEdge,
			PVEFrameLeftInset.NineSlice.TopRightCorner,
			PVEFrameLeftInset.NineSlice.RightEdge,
			PVEFrameLeftInset.NineSlice.BottomRightCorner,
			PVEFrameLeftInset.NineSlice.BottomEdge,
			PVEFrameLeftInset.NineSlice.BottomLeftCorner,
			PVEFrameLeftInset.NineSlice.LeftEdge,
			PVEFrameLeftInset.NineSlice.TopLeftCorner,
			LFDParentFrameInset.NineSlice.TopEdge,
			LFDParentFrameInset.NineSlice.TopRightCorner,
			LFDParentFrameInset.NineSlice.RightEdge,
			LFDParentFrameInset.NineSlice.BottomRightCorner,
			LFDParentFrameInset.NineSlice.BottomEdge,
			LFDParentFrameInset.NineSlice.BottomLeftCorner,
			LFDParentFrameInset.NineSlice.LeftEdge,
			LFDParentFrameInset.NineSlice.TopLeftCorner,
			RaidFinderFrameRoleInset.NineSlice.TopEdge,
			RaidFinderFrameRoleInset.NineSlice.TopRightCorner,
			RaidFinderFrameRoleInset.NineSlice.RightEdge,
			RaidFinderFrameRoleInset.NineSlice.BottomRightCorner,
			RaidFinderFrameRoleInset.NineSlice.BottomEdge,
			RaidFinderFrameRoleInset.NineSlice.BottomLeftCorner,
			RaidFinderFrameRoleInset.NineSlice.LeftEdge,
			RaidFinderFrameRoleInset.NineSlice.TopLeftCorner,
			RaidFinderFrameBottomInset.NineSlice.TopEdge,
			RaidFinderFrameBottomInset.NineSlice.TopRightCorner,
			RaidFinderFrameBottomInset.NineSlice.RightEdge,
			RaidFinderFrameBottomInset.NineSlice.BottomRightCorner,
			RaidFinderFrameBottomInset.NineSlice.BottomEdge,
			RaidFinderFrameBottomInset.NineSlice.BottomLeftCorner,
			RaidFinderFrameBottomInset.NineSlice.LeftEdge,
			RaidFinderFrameBottomInset.NineSlice.TopLeftCorner,
			LFGListFrame.CategorySelection.Inset.NineSlice.TopEdge,
			LFGListFrame.CategorySelection.Inset.NineSlice.TopRightCorner,
			LFGListFrame.CategorySelection.Inset.NineSlice.RightEdge,
			LFGListFrame.CategorySelection.Inset.NineSlice.BottomRightCorner,
			LFGListFrame.CategorySelection.Inset.NineSlice.BottomEdge,
			LFGListFrame.CategorySelection.Inset.NineSlice.BottomLeftCorner,
			LFGListFrame.CategorySelection.Inset.NineSlice.LeftEdge,
			LFGListFrame.CategorySelection.Inset.NineSlice.TopLeftCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			PVEFrameTopFiligree,
			PVEFrameBottomFiligree,
			PVEFrameBlueBg,
			LFGListFrame.CategorySelection.Inset.CustomBG }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ 
			FriendsFrame.NineSlice.TopEdge,
			FriendsFrame.NineSlice.TopEdge,
			FriendsFrame.NineSlice.TopRightCorner,
			FriendsFrame.NineSlice.RightEdge,
			FriendsFrame.NineSlice.BottomRightCorner,
			FriendsFrame.NineSlice.BottomEdge,
			FriendsFrame.NineSlice.BottomLeftCorner,
			FriendsFrame.NineSlice.LeftEdge,
			FriendsFrame.NineSlice.TopLeftCorner,
			FriendsFriendsFrame.Border.TopEdge,
			FriendsFriendsFrame.Border.RightEdge,
			FriendsFriendsFrame.Border.BottomEdge,
			FriendsFriendsFrame.Border.LeftEdge,
			FriendsFriendsFrame.Border.TopRightCorner,
			FriendsFriendsFrame.Border.TopLeftCorner,
			FriendsFriendsFrame.Border.BottomLeftCorner,
			FriendsFriendsFrame.Border.BottomRightCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			FriendsFrame.Bg,
			FriendsFrame.TitleBg,
			FriendsFrameInset.NineSlice.TopEdge,
			FriendsFrameInset.NineSlice.TopEdge,
			FriendsFrameInset.NineSlice.TopRightCorner,
			FriendsFrameInset.NineSlice.RightEdge,
			FriendsFrameInset.NineSlice.BottomRightCorner,
			FriendsFrameInset.NineSlice.BottomEdge,
			FriendsFrameInset.NineSlice.BottomLeftCorner,
			FriendsFrameInset.NineSlice.LeftEdge,
			FriendsFrameInset.NineSlice.TopLeftCorner }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({ 	
			FriendsListFrameScrollFrameTop,
			FriendsListFrameScrollFrameMiddle,
			FriendsListFrameScrollFrameBottom,
			FriendsListFrameScrollFrameThumbTexture,
			FriendsListFrameScrollFrameScrollUpButton.Normal,
			FriendsListFrameScrollFrameScrollDownButton.Normal,
			FriendsListFrameScrollFrameScrollUpButton.Disabled,
			FriendsListFrameScrollFrameScrollDownButton.Disabled,

 		}) do
			v:SetVertexColor(.35, .35, .35)
		end
	
		for i, v in pairs({ WorldMapFrame.BorderFrame.NineSlice.TopEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopRightCorner,
			WorldMapFrame.BorderFrame.NineSlice.RightEdge,
			WorldMapFrame.BorderFrame.NineSlice.BottomRightCorner,
			WorldMapFrame.BorderFrame.NineSlice.BottomEdge,
			WorldMapFrame.BorderFrame.NineSlice.BottomLeftCorner,
			WorldMapFrame.BorderFrame.NineSlice.LeftEdge,
			WorldMapFrame.BorderFrame.NineSlice.TopLeftCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({ 
			WorldMapFrame.NavBar.InsetBorderBottom,
			WorldMapFrame.NavBar.InsetBorderBottomLeft,
			WorldMapFrame.NavBar.InsetBorderBottomRight,
			WorldMapFrame.NavBar.InsetBorderLeft,
			WorldMapFrame.NavBar.InsetBorderRight, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			WorldMapFrame.BorderFrame.Bg,
			WorldMapFrame.BorderFrame.TitleBg, }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ ChannelFrame.NineSlice.TopEdge,
			ChannelFrame.NineSlice.TopEdge,
			ChannelFrame.NineSlice.TopRightCorner,
			ChannelFrame.NineSlice.RightEdge,
			ChannelFrame.NineSlice.BottomRightCorner,
			ChannelFrame.NineSlice.BottomEdge,
			ChannelFrame.NineSlice.BottomLeftCorner,
			ChannelFrame.NineSlice.LeftEdge,
			ChannelFrame.NineSlice.TopLeftCorner,
			ChannelFrame.LeftInset.NineSlice.BottomEdge,
			ChannelFrame.LeftInset.NineSlice.BottomLeftCorner,
			ChannelFrame.LeftInset.NineSlice.BottomRightCorner,
			ChannelFrame.RightInset.NineSlice.BottomEdge,
			ChannelFrame.RightInset.NineSlice.BottomLeftCorner,
			ChannelFrame.RightInset.NineSlice.BottomRightCorner,
			ChannelFrameInset.NineSlice.BottomEdge, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			ChannelFrame.Bg,
			ChannelFrame.TitleBg,
			ChannelFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ ChatFrame1EditBoxLeft,
			ChatFrame1EditBoxRight,
			ChatFrame1EditBoxMid,
			ChatFrame2EditBoxLeft,
			ChatFrame2EditBoxRight,
			ChatFrame2EditBoxMid,
			ChatFrame3EditBoxLeft,
			ChatFrame3EditBoxRight,
			ChatFrame3EditBoxMid,
			ChatFrame4EditBoxLeft,
			ChatFrame4EditBoxRight,
			ChatFrame4EditBoxMid,
			ChatFrame5EditBoxLeft,
			ChatFrame5EditBoxRight,
			ChatFrame5EditBoxMid,
			ChatFrame6EditBoxLeft,
			ChatFrame6EditBoxRight,
			ChatFrame6EditBoxMid,
			ChatFrame7EditBoxLeft,
			ChatFrame7EditBoxRight,
			ChatFrame7EditBoxMid,	}) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ 
			MailFrame.NineSlice.TopEdge,
			MailFrame.NineSlice.TopRightCorner,
			MailFrame.NineSlice.RightEdge,
			MailFrame.NineSlice.BottomRightCorner,
			MailFrame.NineSlice.BottomEdge,
			MailFrame.NineSlice.BottomLeftCorner,
			MailFrame.NineSlice.LeftEdge,
			MailFrame.NineSlice.TopLeftCorner,
			OpenMailFrame.NineSlice.TopEdge,
			OpenMailFrame.NineSlice.TopRightCorner,
			OpenMailFrame.NineSlice.RightEdge,
			OpenMailFrame.NineSlice.BottomRightCorner,
			OpenMailFrame.NineSlice.BottomEdge,
			OpenMailFrame.NineSlice.BottomLeftCorner,
			OpenMailFrame.NineSlice.LeftEdge,
			OpenMailFrame.NineSlice.TopLeftCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({ 
			MailFrameInset.NineSlice.TopEdge,
			MailFrameInset.NineSlice.TopRightCorner,
			MailFrameInset.NineSlice.RightEdge,
			MailFrameInset.NineSlice.BottomRightCorner,
			MailFrameInset.NineSlice.BottomEdge,
			MailFrameInset.NineSlice.BottomLeftCorner,
			MailFrameInset.NineSlice.LeftEdge,
			MailFrameInset.NineSlice.TopLeftCorner,
			OpenMailFrameInset.NineSlice.TopEdge,
			OpenMailFrameInset.NineSlice.TopRightCorner,
			OpenMailFrameInset.NineSlice.RightEdge,
			OpenMailFrameInset.NineSlice.BottomRightCorner,
			OpenMailFrameInset.NineSlice.BottomEdge,
			OpenMailFrameInset.NineSlice.BottomLeftCorner,
			OpenMailFrameInset.NineSlice.LeftEdge,
			OpenMailFrameInset.NineSlice.TopLeftCorner,  }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			MailFrame.Bg,
			MailFrame.TitleBg,
			OpenMailFrame.Bg,
			OpenMailFrame.TitleBg }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ MerchantFrame.NineSlice.TopEdge,
			MerchantFrame.NineSlice.RightEdge,
			MerchantFrame.NineSlice.BottomEdge,
			MerchantFrame.NineSlice.LeftEdge,
			MerchantFrame.NineSlice.TopRightCorner,
			MerchantFrame.NineSlice.TopLeftCorner,
			MerchantFrame.NineSlice.BottomLeftCorner,
			MerchantFrame.NineSlice.BottomRightCorner,
			StackSplitFrame.SingleItemSplitBackground, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			MerchantFrame.Bg,
			MerchantFrame.TitleBg,
			MerchantFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ 
			AddonList.NineSlice.TopEdge,
			AddonList.NineSlice.RightEdge,
			AddonList.NineSlice.BottomEdge,
			AddonList.NineSlice.LeftEdge,
			AddonList.NineSlice.TopRightCorner,
			AddonList.NineSlice.TopLeftCorner,
			AddonList.NineSlice.BottomLeftCorner,
			AddonList.NineSlice.BottomRightCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({ 
			AddonListInset.NineSlice.TopEdge,
			AddonListInset.NineSlice.TopRightCorner,
			AddonListInset.NineSlice.RightEdge,
			AddonListInset.NineSlice.BottomRightCorner,
			AddonListInset.NineSlice.BottomEdge,
			AddonListInset.NineSlice.BottomLeftCorner,
			AddonListInset.NineSlice.LeftEdge,
			AddonListInset.NineSlice.TopLeftCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			AddonListBg,
			AddonList.TitleBg, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({ 	
			AddonListScrollFrameScrollBarTop,
			AddonListScrollFrameScrollBarMiddle,
			AddonListScrollFrameScrollBarBottom,
			AddonListScrollFrameScrollBarThumbTexture,
			AddonListScrollFrameScrollBarScrollUpButton.Normal,
			AddonListScrollFrameScrollBarScrollDownButton.Normal,
			AddonListScrollFrameScrollBarScrollUpButton.Disabled,
			AddonListScrollFrameScrollBarScrollDownButton.Disabled,

 		}) do
			v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ GossipFrame.NineSlice.TopEdge,
			GossipFrame.NineSlice.RightEdge,
			GossipFrame.NineSlice.BottomEdge,
			GossipFrame.NineSlice.LeftEdge,
			GossipFrame.NineSlice.TopRightCorner,
			GossipFrame.NineSlice.TopLeftCorner,
			GossipFrame.NineSlice.BottomLeftCorner,
			GossipFrame.NineSlice.BottomRightCorner,
		 	GossipFrameInset.NineSlice.BottomEdge, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			GossipFrame.Bg,
			GossipFrame.TitleBg,
			GossipFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ BankFrame.NineSlice.TopEdge,
			BankFrame.NineSlice.RightEdge,
			BankFrame.NineSlice.BottomEdge,
			BankFrame.NineSlice.LeftEdge,
			BankFrame.NineSlice.TopRightCorner,
			BankFrame.NineSlice.TopLeftCorner,
			BankFrame.NineSlice.BottomLeftCorner,
			BankFrame.NineSlice.BottomRightCorner,	}) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			BankFrame.Bg,
			BankFrame.TitleBg }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ QuestFrame.NineSlice.TopEdge,
			QuestFrame.NineSlice.RightEdge,
			QuestFrame.NineSlice.BottomEdge,
			QuestFrame.NineSlice.LeftEdge,
			QuestFrame.NineSlice.TopRightCorner,
			QuestFrame.NineSlice.TopLeftCorner,
			QuestFrame.NineSlice.BottomLeftCorner,
			QuestFrame.NineSlice.BottomRightCorner,
			QuestFrameInset.NineSlice.BottomEdge,
			QuestLogPopupDetailFrame.NineSlice.TopEdge,
			QuestLogPopupDetailFrame.NineSlice.RightEdge,
			QuestLogPopupDetailFrame.NineSlice.BottomEdge,
			QuestLogPopupDetailFrame.NineSlice.LeftEdge,
			QuestLogPopupDetailFrame.NineSlice.TopRightCorner,
			QuestLogPopupDetailFrame.NineSlice.TopLeftCorner,
			QuestLogPopupDetailFrame.NineSlice.BottomLeftCorner,
			QuestLogPopupDetailFrame.NineSlice.BottomRightCorner,
			QuestLogPopupDetailFrame.NineSlice.BottomEdge,
			QuestNPCModelTopBorder,
			QuestNPCModelRightBorder,
			QuestNPCModelTopRightCorner,
			QuestNPCModelBottomRightCorner,
			QuestNPCModelBottomBorder,
			QuestNPCModelBottomLeftCorner,
			QuestNPCModelLeftBorder,
			QuestNPCModelTopLeftCorner,
			QuestNPCModelTextTopBorder,
			QuestNPCModelTextRightBorder,
			QuestNPCModelTextTopRightCorner,
			QuestNPCModelTextBottomRightCorner,
			QuestNPCModelTextBottomBorder,
			QuestNPCModelTextBottomLeftCorner,
			QuestNPCModelTextLeftBorder,
			QuestNPCModelTextTopLeftCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			QuestFrame.Bg,
			QuestFrame.TitleBg,
			QuestFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({ DressUpFrame.NineSlice.TopEdge,
			DressUpFrame.NineSlice.RightEdge,
			DressUpFrame.NineSlice.BottomEdge,
			DressUpFrame.NineSlice.LeftEdge,
			DressUpFrame.NineSlice.TopRightCorner,
			DressUpFrame.NineSlice.TopLeftCorner,
			DressUpFrame.NineSlice.BottomLeftCorner,
			DressUpFrame.NineSlice.BottomRightCorner,
			DressUpFrameInset.NineSlice.BottomEdge, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			DressUpFrame.Bg,
			DressUpFrame.TitleBg,
			DressUpFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			DressUpFrameInset.NineSlice.TopEdge,
			DressUpFrameInset.NineSlice.TopRightCorner,
			DressUpFrameInset.NineSlice.RightEdge,
			DressUpFrameInset.NineSlice.BottomRightCorner,
			DressUpFrameInset.NineSlice.BottomEdge,
			DressUpFrameInset.NineSlice.BottomLeftCorner,
			DressUpFrameInset.NineSlice.LeftEdge,
			DressUpFrameInset.NineSlice.TopLeftCorner }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({ LootFrame.NineSlice.TopEdge,
			LootFrame.NineSlice.RightEdge,
			LootFrame.NineSlice.BottomEdge,
			LootFrame.NineSlice.LeftEdge,
			LootFrame.NineSlice.TopRightCorner,
			LootFrame.NineSlice.TopLeftCorner,
			LootFrame.NineSlice.BottomLeftCorner,
			LootFrame.NineSlice.BottomRightCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({ LootFrame.NineSlice.TopEdge,
			LootFrameInset.NineSlice.RightEdge,
			LootFrameInset.NineSlice.BottomEdge,
			LootFrameInset.NineSlice.LeftEdge,
			LootFrameInset.NineSlice.TopRightCorner,
			LootFrameInset.NineSlice.TopLeftCorner,
			LootFrameInset.NineSlice.BottomLeftCorner,
			LootFrameInset.NineSlice.BottomRightCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			LootFrame.Bg,
			LootFrame.TitleBg,
			LootFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({	ItemTextFrame.NineSlice.TopEdge,
			ItemTextFrame.NineSlice.RightEdge,
			ItemTextFrame.NineSlice.BottomEdge,
			ItemTextFrame.NineSlice.LeftEdge,
			ItemTextFrame.NineSlice.TopRightCorner,
			ItemTextFrame.NineSlice.TopLeftCorner,
			ItemTextFrame.NineSlice.BottomLeftCorner,
			ItemTextFrame.NineSlice.BottomRightCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({	PetitionFrame.NineSlice.TopEdge,
			PetitionFrame.NineSlice.RightEdge,
			PetitionFrame.NineSlice.BottomEdge,
			PetitionFrame.NineSlice.LeftEdge,
			PetitionFrame.NineSlice.TopRightCorner,
			PetitionFrame.NineSlice.TopLeftCorner,
			PetitionFrame.NineSlice.BottomLeftCorner,
			PetitionFrame.NineSlice.BottomRightCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end
		for i, v in pairs({
			PetitionFrame.Bg,
			PetitionFrame.TitleBg,
			PetitionFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end

		for i, v in pairs({	GuildRegistrarFrame.NineSlice.TopEdge,
			GuildRegistrarFrame.NineSlice.RightEdge,
			GuildRegistrarFrame.NineSlice.BottomEdge,
			GuildRegistrarFrame.NineSlice.LeftEdge,
			GuildRegistrarFrame.NineSlice.TopRightCorner,
			GuildRegistrarFrame.NineSlice.TopLeftCorner,
			GuildRegistrarFrame.NineSlice.BottomLeftCorner,
			GuildRegistrarFrame.NineSlice.BottomRightCorner,
			TabardFrame.NineSlice.TopEdge,
			TabardFrame.NineSlice.RightEdge,
			TabardFrame.NineSlice.BottomEdge,
			TabardFrame.NineSlice.LeftEdge,
			TabardFrame.NineSlice.TopRightCorner,
			TabardFrame.NineSlice.TopLeftCorner,
			TabardFrame.NineSlice.BottomLeftCorner,
			TabardFrame.NineSlice.BottomRightCorner, }) do
				v:SetVertexColor(.35, .35, .35)
		end	
		for i, v in pairs({
			GuildRegistrarFrame.Bg,
			GuildRegistrarFrame.TitleBg,
			GuildRegistrarFrameInset.Bg,
			TabardFrame.Bg,
			TabardFrame.TitleBg,
			TabardFrameInset.Bg }) do
				v:SetVertexColor(.35, .35, .35)
		end

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_TalentUI" then
				for i, v in pairs({ 
					PlayerTalentFrame.NineSlice.TopEdge,
					PlayerTalentFrame.NineSlice.RightEdge,
					PlayerTalentFrame.NineSlice.BottomEdge,
					PlayerTalentFrame.NineSlice.LeftEdge,
					PlayerTalentFrame.NineSlice.TopRightCorner,
					PlayerTalentFrame.NineSlice.TopLeftCorner,
					PlayerTalentFrame.NineSlice.BottomLeftCorner,
					PlayerTalentFrame.NineSlice.BottomRightCorner,
					PlayerTalentFrame.NineSlice.BottomEdge,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.TopEdge,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.RightEdge,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.BottomEdge,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.LeftEdge,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.TopRightCorner,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.TopLeftCorner,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.BottomLeftCorner,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.BottomRightCorner,
					PlayerTalentFrameTalentsPvpTalentFrameTalentList.NineSlice.BottomEdge, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
				PlayerTalentFrameInset.NineSlice.RightEdge,
				PlayerTalentFrameInset.NineSlice.BottomEdge,
				PlayerTalentFrameInset.NineSlice.LeftEdge,
				PlayerTalentFrameInset.NineSlice.TopRightCorner,
				PlayerTalentFrameInset.NineSlice.TopLeftCorner,
				PlayerTalentFrameInset.NineSlice.BottomLeftCorner,
				PlayerTalentFrameInset.NineSlice.BottomRightCorner,
				PlayerTalentFrameInset.NineSlice.BottomEdge,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.TopEdge,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.RightEdge,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.BottomEdge,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.LeftEdge,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.TopRightCorner,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.TopLeftCorner,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.BottomLeftCorner,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.BottomRightCorner,
				PlayerTalentFrameTalentsPvpTalentFrameTalentList.Inset.NineSlice.BottomEdge, }) do
					v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({ 	
					PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBarThumbTexture,
					PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBarTop,
					PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBarMiddle,
					PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBarBottom,
					PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBarScrollUpButton.Normal,
					PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBarScrollDownButton.Normal,
					PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBarScrollUpButton.Disabled,
					PlayerTalentFrameTalentsPvpTalentFrameTalentListScrollFrameScrollBarScrollDownButton.Disabled }) do
					v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					PVEFrameTopFiligree,
					PVEFrameBottomFiligree,
					PVEFrameBlueBg,
					LFGListFrame.CategorySelection.Inset.CustomBG }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					PlayerTalentFrame.Bg,
					PlayerTalentFrame.TitleBg,
					PlayerTalentFrameInset.Bg,
					PlayerTalentFrameTalentsPvpTalentFrameTalentListBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					PlayerTalentFrameTalents.bg }) do
						v:SetVertexColor(.35, .35, .35)
				end
				_G.select(1, PlayerTalentFrameSpecialization:GetRegions()):SetVertexColor(.35, .35, .35)
				_G.select(5, PlayerTalentFrameSpecialization:GetRegions()):SetVertexColor(.35, .35, .35)
				_G.select(6, PlayerTalentFrameSpecialization:GetRegions()):SetVertexColor(.35, .35, .35)
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_Collections" then
				for i, v in pairs({ 
					CollectionsJournal.NineSlice.TopEdge,
					CollectionsJournal.NineSlice.TopRightCorner,
					CollectionsJournal.NineSlice.RightEdge,
					CollectionsJournal.NineSlice.BottomRightCorner,
					CollectionsJournal.NineSlice.BottomEdge,
					CollectionsJournal.NineSlice.BottomLeftCorner,
					CollectionsJournal.NineSlice.LeftEdge,
					CollectionsJournal.NineSlice.TopLeftCorner}) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					CollectionsJournal.Bg,
					CollectionsJournal.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					MountJournal.LeftInset.NineSlice.TopEdge,
					MountJournal.LeftInset.NineSlice.TopRightCorner,
					MountJournal.LeftInset.NineSlice.TopLeftCorner,
					MountJournal.LeftInset.NineSlice.RightEdge,
					MountJournal.LeftInset.NineSlice.BottomRightCorner,
					MountJournal.LeftInset.NineSlice.BottomEdge,
					MountJournal.LeftInset.NineSlice.BottomLeftCorner,
					MountJournal.LeftInset.NineSlice.LeftEdge,
					MountJournal.BottomLeftInset.NineSlice.TopEdge,
					MountJournal.BottomLeftInset.NineSlice.TopRightCorner,
					MountJournal.BottomLeftInset.NineSlice.TopLeftCorner,
					MountJournal.BottomLeftInset.NineSlice.RightEdge,
					MountJournal.BottomLeftInset.NineSlice.BottomRightCorner,
					MountJournal.BottomLeftInset.NineSlice.BottomEdge,
					MountJournal.BottomLeftInset.NineSlice.BottomLeftCorner,
					MountJournal.BottomLeftInset.NineSlice.LeftEdge,
					MountJournal.RightInset.NineSlice.TopEdge,
					MountJournal.RightInset.NineSlice.TopRightCorner,
					MountJournal.RightInset.NineSlice.TopLeftCorner,
					MountJournal.RightInset.NineSlice.RightEdge,
					MountJournal.RightInset.NineSlice.BottomRightCorner,
					MountJournal.RightInset.NineSlice.BottomEdge,
					MountJournal.RightInset.NineSlice.BottomLeftCorner,
					MountJournal.RightInset.NineSlice.LeftEdge,
					ToyBox.iconsFrame.NineSlice.TopEdge,
					ToyBox.iconsFrame.NineSlice.RightEdge,
					ToyBox.iconsFrame.NineSlice.BottomEdge,
					ToyBox.iconsFrame.NineSlice.LeftEdge,
					ToyBox.iconsFrame.NineSlice.TopRightCorner,
					ToyBox.iconsFrame.NineSlice.TopLeftCorner,
					ToyBox.iconsFrame.NineSlice.BottomLeftCorner,
					ToyBox.iconsFrame.NineSlice.BottomRightCorner,
					ToyBox.iconsFrame.NineSlice.BottomEdge,
					HeirloomsJournal.iconsFrame.NineSlice.TopEdge,
					HeirloomsJournal.iconsFrame.NineSlice.RightEdge,
					HeirloomsJournal.iconsFrame.NineSlice.BottomEdge,
					HeirloomsJournal.iconsFrame.NineSlice.LeftEdge,
					HeirloomsJournal.iconsFrame.NineSlice.TopRightCorner,
					HeirloomsJournal.iconsFrame.NineSlice.TopLeftCorner,
					HeirloomsJournal.iconsFrame.NineSlice.BottomLeftCorner,
					HeirloomsJournal.iconsFrame.NineSlice.BottomRightCorner,
					HeirloomsJournal.iconsFrame.NineSlice.BottomEdge,
					PetJournalLeftInset.NineSlice.TopEdge,
					PetJournalLeftInset.NineSlice.RightEdge,
					PetJournalLeftInset.NineSlice.BottomEdge,
					PetJournalLeftInset.NineSlice.LeftEdge,
					PetJournalLeftInset.NineSlice.TopRightCorner,
					PetJournalLeftInset.NineSlice.TopLeftCorner,
					PetJournalLeftInset.NineSlice.BottomLeftCorner,
					PetJournalLeftInset.NineSlice.BottomRightCorner,
					PetJournalLeftInset.NineSlice.BottomEdge,
					PetJournalPetCardInset.NineSlice.TopEdge,
					PetJournalPetCardInset.NineSlice.RightEdge,
					PetJournalPetCardInset.NineSlice.BottomEdge,
					PetJournalPetCardInset.NineSlice.LeftEdge,
					PetJournalPetCardInset.NineSlice.TopRightCorner,
					PetJournalPetCardInset.NineSlice.TopLeftCorner,
					PetJournalPetCardInset.NineSlice.BottomLeftCorner,
					PetJournalPetCardInset.NineSlice.BottomRightCorner,
					PetJournalPetCardInset.NineSlice.BottomEdge, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({ 	
					MountJournalListScrollFrameScrollBarThumbTexture,
					MountJournalListScrollFrameScrollBarTop,
					MountJournalListScrollFrameScrollBarMiddle,
					MountJournalListScrollFrameScrollBarBottom,
					MountJournalListScrollFrameScrollBarScrollUpButton.Normal,
					MountJournalListScrollFrameScrollBarScrollDownButton.Normal,
					MountJournalListScrollFrameScrollBarScrollUpButton.Disabled,
					MountJournalListScrollFrameScrollBarScrollDownButton.Disabled,
					PetJournalListScrollFrameScrollBarThumbTexture,
					PetJournalListScrollFrameScrollBarTop,
					PetJournalListScrollFrameScrollBarMiddle,
					PetJournalListScrollFrameScrollBarBottom,
					PetJournalListScrollFrameScrollBarScrollUpButton.Normal,
					PetJournalListScrollFrameScrollBarScrollDownButton.Normal,
					PetJournalListScrollFrameScrollBarScrollUpButton.Disabled,
					PetJournalListScrollFrameScrollBarScrollDownButton.Disabled, }) do
					v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_EncounterJournal" then
				for i, v in pairs({ EncounterJournal.NineSlice.TopEdge,
					EncounterJournal.NineSlice.RightEdge,
					EncounterJournal.NineSlice.BottomEdge,
					EncounterJournal.NineSlice.LeftEdge,
					EncounterJournal.NineSlice.TopRightCorner,
					EncounterJournal.NineSlice.TopLeftCorner,
					EncounterJournal.NineSlice.BottomLeftCorner,
					EncounterJournal.NineSlice.BottomRightCorner,
					EncounterJournalInset.NineSlice.BottomEdge, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				EncounterJournalInset:SetAlpha(0)
				for i, v in pairs({
					EncounterJournal.Bg,
					EncounterJournal.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_Communities" then
				for i, v in pairs({ 
					CommunitiesFrame.NineSlice.TopEdge,
					CommunitiesFrame.NineSlice.RightEdge,
					CommunitiesFrame.NineSlice.BottomEdge,
					CommunitiesFrame.NineSlice.LeftEdge,
					CommunitiesFrame.NineSlice.TopRightCorner,
					CommunitiesFrame.NineSlice.TopLeftCorner,
					CommunitiesFrame.NineSlice.BottomLeftCorner,
					CommunitiesFrame.NineSlice.BottomRightCorner,
					CommunitiesFrame.GuildMemberDetailFrame.Border.TopEdge,
					CommunitiesFrame.GuildMemberDetailFrame.Border.RightEdge,
					CommunitiesFrame.GuildMemberDetailFrame.Border.BottomEdge,
					CommunitiesFrame.GuildMemberDetailFrame.Border.LeftEdge,
					CommunitiesFrame.GuildMemberDetailFrame.Border.TopRightCorner,
					CommunitiesFrame.GuildMemberDetailFrame.Border.TopLeftCorner,
					CommunitiesFrame.GuildMemberDetailFrame.Border.BottomLeftCorner,
					CommunitiesFrame.GuildMemberDetailFrame.Border.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					CommunitiesFrame.Bg,
					CommunitiesFrame.TitleBg,
					CommunitiesFrameInset.Bg,
					CommunitiesFrame.MemberList.ColumnDisplay.Background,

				 }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					CommunitiesFrameInset.NineSlice.TopEdge,
					CommunitiesFrameInset.NineSlice.RightEdge,
					CommunitiesFrameInset.NineSlice.BottomEdge,
					CommunitiesFrameInset.NineSlice.LeftEdge,
					CommunitiesFrameInset.NineSlice.TopRightCorner,
					CommunitiesFrameInset.NineSlice.TopLeftCorner,
					CommunitiesFrameInset.NineSlice.BottomLeftCorner,
					CommunitiesFrameInset.NineSlice.BottomRightCorner,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.TopEdge,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.RightEdge,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomEdge,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.LeftEdge,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.TopRightCorner,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.TopLeftCorner,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomLeftCorner,
					CommunitiesFrameCommunitiesList.InsetFrame.NineSlice.BottomRightCorner,
					CommunitiesFrame.ChatEditBox.Left,
					CommunitiesFrame.ChatEditBox.Mid,
					CommunitiesFrame.ChatEditBox.Right,
					CommunitiesFrame.Chat.InsetFrame.NineSlice.TopEdge,
					CommunitiesFrame.Chat.InsetFrame.NineSlice.RightEdge,
					CommunitiesFrame.Chat.InsetFrame.NineSlice.BottomEdge,
					CommunitiesFrame.Chat.InsetFrame.NineSlice.LeftEdge,
					CommunitiesFrame.Chat.InsetFrame.NineSlice.TopRightCorner,
					CommunitiesFrame.Chat.InsetFrame.NineSlice.TopLeftCorner,
					CommunitiesFrame.Chat.InsetFrame.NineSlice.BottomLeftCorner,
					CommunitiesFrame.Chat.InsetFrame.NineSlice.BottomRightCorner,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.TopEdge,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.RightEdge,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.BottomEdge,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.LeftEdge,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.TopRightCorner,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.TopLeftCorner,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.BottomLeftCorner,
					CommunitiesFrame.MemberList.InsetFrame.NineSlice.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					CommunitiesFrameCommunitiesList.TopFiligree,
					CommunitiesFrameCommunitiesList.BottomFiligree,
					CommunitiesFrameCommunitiesList.Bg}) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({ 	
					CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.thumbTexture,
					CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollBarTop,
					CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollBarMiddle,
					CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollBarBottom,
					CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollUpButton.Normal,
					CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollDownButton.Normal,
					CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollUpButton.Disabled,
					CommunitiesFrame.MemberList.ListScrollFrame.scrollBar.ScrollDownButton.Disabled,
					CommunitiesFrameCommunitiesListListScrollFrameThumbTexture,
					CommunitiesFrameCommunitiesListListScrollFrameTop,
					CommunitiesFrameCommunitiesListListScrollFrameMiddle,
					CommunitiesFrameCommunitiesListListScrollFrameBottom,
					CommunitiesFrameCommunitiesListListScrollFrameScrollUpButton.Normal,
					CommunitiesFrameCommunitiesListListScrollFrameScrollDownButton.Normal,
					CommunitiesFrameCommunitiesListListScrollFrameScrollUpButton.Disabled,
					CommunitiesFrameCommunitiesListListScrollFrameScrollDownButton.Disabled,
					CommunitiesFrame.Chat.MessageFrame.ScrollBar.thumbTexture,
					CommunitiesFrame.Chat.MessageFrame.ScrollBar.ScrollBarTop,
					CommunitiesFrame.Chat.MessageFrame.ScrollBar.ScrollBarMiddle,
					CommunitiesFrame.Chat.MessageFrame.ScrollBar.ScrollBarBottom,
					CommunitiesFrame.Chat.MessageFrame.ScrollBar.ScrollUp.Normal,
					CommunitiesFrame.Chat.MessageFrame.ScrollBar.ScrollDown.Normal,
					CommunitiesFrame.Chat.MessageFrame.ScrollBar.ScrollUp.Disabled,
					CommunitiesFrame.Chat.MessageFrame.ScrollBar.ScrollDown.Disabled, }) do
					v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_MacroUI" then
				for i, v in pairs({ MacroFrame.NineSlice.TopEdge,
					MacroFrame.NineSlice.RightEdge,
					MacroFrame.NineSlice.BottomEdge,
					MacroFrame.NineSlice.LeftEdge,
					MacroFrame.NineSlice.TopRightCorner,
					MacroFrame.NineSlice.TopLeftCorner,
					MacroFrame.NineSlice.BottomLeftCorner,
					MacroFrame.NineSlice.BottomRightCorner }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({ 
					MacroFrameInset.NineSlice.TopEdge,
					MacroFrameInset.NineSlice.TopRightCorner,
					MacroFrameInset.NineSlice.RightEdge,
					MacroFrameInset.NineSlice.BottomRightCorner,
					MacroFrameInset.NineSlice.BottomEdge,
					MacroFrameInset.NineSlice.BottomLeftCorner,
					MacroFrameInset.NineSlice.LeftEdge,
					MacroFrameInset.NineSlice.TopLeftCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					MacroFrame.Bg,
					MacroFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({ 	
					MacroButtonScrollFrameTop,
					MacroButtonScrollFrameMiddle,
					MacroButtonScrollFrameBottom,
					MacroButtonScrollFrameScrollBarThumbTexture,
					MacroButtonScrollFrameScrollBarScrollUpButton.Normal,
					MacroButtonScrollFrameScrollBarScrollDownButton.Normal,
					MacroButtonScrollFrameScrollBarScrollUpButton.Disabled,
					MacroButtonScrollFrameScrollBarScrollDownButton.Disabled,
				 }) do
					v:SetVertexColor(.35, .35, .35)
				end
				MacroHorizontalBarLeft:Hide();
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_AuctionHouseUI" then
				for i, v in pairs({ AuctionHouseFrame.NineSlice.TopEdge,
					AuctionHouseFrame.NineSlice.RightEdge,
					AuctionHouseFrame.NineSlice.BottomEdge,
					AuctionHouseFrame.NineSlice.LeftEdge,
					AuctionHouseFrame.NineSlice.TopRightCorner,
					AuctionHouseFrame.NineSlice.TopLeftCorner,
					AuctionHouseFrame.NineSlice.BottomLeftCorner,
					AuctionHouseFrame.NineSlice.BottomRightCorner,
					AuctionHouseFrame.NineSlice.BottomEdge,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.TopEdge,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.RightEdge,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.BottomEdge,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.LeftEdge,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.TopRightCorner,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.TopLeftCorner,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.BottomLeftCorner,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.BottomRightCorner,
					AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.NineSlice.BottomEdge,
					AuctionHouseFrame.BuyDialog.Border.TopEdge,
					AuctionHouseFrame.BuyDialog.Border.RightEdge,
					AuctionHouseFrame.BuyDialog.Border.BottomEdge,
					AuctionHouseFrame.BuyDialog.Border.LeftEdge,
					AuctionHouseFrame.BuyDialog.Border.TopRightCorner,
					AuctionHouseFrame.BuyDialog.Border.TopLeftCorner,
					AuctionHouseFrame.BuyDialog.Border.BottomLeftCorner,
					AuctionHouseFrame.BuyDialog.Border.BottomRightCorner,
					AuctionHouseFrame.BuyDialog.Border.BottomEdge, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					AuctionHouseFrame.Bg,
					AuctionHouseFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_FlightMap" then
				for i, v in pairs({ FlightMapFrame.BorderFrame.NineSlice.TopEdge,
					FlightMapFrame.BorderFrame.NineSlice.RightEdge,
					FlightMapFrame.BorderFrame.NineSlice.BottomEdge,
					FlightMapFrame.BorderFrame.NineSlice.LeftEdge,
					FlightMapFrame.BorderFrame.NineSlice.TopRightCorner,
					FlightMapFrame.BorderFrame.NineSlice.TopLeftCorner,
					FlightMapFrame.BorderFrame.NineSlice.BottomLeftCorner,
					FlightMapFrame.BorderFrame.NineSlice.BottomRightCorner,	}) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					FlightMapFrame.Bg,
					FlightMapFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_TradeSkillUI" then
				for i, v in pairs({ TradeSkillFrame.NineSlice.TopEdge,
					TradeSkillFrame.NineSlice.RightEdge,
					TradeSkillFrame.NineSlice.BottomEdge,
					TradeSkillFrame.NineSlice.LeftEdge,
					TradeSkillFrame.NineSlice.TopRightCorner,
					TradeSkillFrame.NineSlice.TopLeftCorner,
					TradeSkillFrame.NineSlice.BottomLeftCorner,
					TradeSkillFrame.NineSlice.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					TradeSkillFrame.Bg,
					TradeSkillFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_InspectUI" then
				for i, v in pairs({ InspectFrame.NineSlice.TopEdge,
					InspectFrame.NineSlice.RightEdge,
					InspectFrame.NineSlice.BottomEdge,
					InspectFrame.NineSlice.LeftEdge,
					InspectFrame.NineSlice.TopRightCorner,
					InspectFrame.NineSlice.TopLeftCorner,
					InspectFrame.NineSlice.BottomLeftCorner,
					InspectFrame.NineSlice.BottomRightCorner,
					InspectFrameInset.NineSlice.BottomEdge, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					InspectFrame.Bg,
					InspectFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({	
					InspectFrameInset.NineSlice.RightEdge,
					InspectFrameInset.NineSlice.LeftEdge,
					InspectFrameInset.NineSlice.TopEdge,
					InspectFrameInset.NineSlice.BottomEdge,
					InspectFrameInset.NineSlice.PortraitFrame,
					InspectFrameInset.NineSlice.TopRightCorner,
					InspectFrameInset.NineSlice.TopLeftCorner,
					InspectFrameInset.NineSlice.BottomLeftCorner,
					InspectFrameInset.NineSlice.BottomRightCorner,
					InspectModelFrameBorderLeft,
					InspectModelFrameBorderRight,
					InspectModelFrameBorderTop,
					InspectModelFrameBorderTopLeft,
					InspectModelFrameBorderTopRight,
					InspectModelFrameBorderBottom,
					InspectModelFrameBorderBottomLeft,
					InspectModelFrameBorderBottomRight,
					InspectModelFrameBorderBottom2 }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					InspectFeetSlotFrame,
					InspectHandsSlotFrame,
					InspectWaistSlotFrame,
					InspectLegsSlotFrame,
					InspectFinger0SlotFrame,
					InspectFinger1SlotFrame,
					InspectTrinket0SlotFrame,
					InspectTrinket1SlotFrame,
					InspectWristSlotFrame,
					InspectTabardSlotFrame,
					InspectShirtSlotFrame,
					InspectChestSlotFrame,
					InspectBackSlotFrame,
					InspectShoulderSlotFrame,
					InspectNeckSlotFrame,
					InspectHeadSlotFrame,
					InspectMainHandSlotFrame,
					InspectSecondaryHandSlotFrame }) do
						v:SetAlpha(0)
				end
				_G.select(InspectMainHandSlot:GetNumRegions(), InspectMainHandSlot:GetRegions()):Hide()
				_G.select(InspectSecondaryHandSlot:GetNumRegions(), InspectSecondaryHandSlot:GetRegions()):Hide()
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_Collections" or name == "Blizzard_Wardrobe" then
				for i, v in pairs({ 
					WardrobeFrame.NineSlice.TopEdge,
					WardrobeFrame.NineSlice.RightEdge,
					WardrobeFrame.NineSlice.BottomEdge,
					WardrobeFrame.NineSlice.LeftEdge,
					WardrobeFrame.NineSlice.TopRightCorner,
					WardrobeFrame.NineSlice.TopLeftCorner,
					WardrobeFrame.NineSlice.BottomLeftCorner,
					WardrobeFrame.NineSlice.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					WardrobeFrame.Bg,
					WardrobeFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.TopEdge,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.RightEdge,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.BottomEdge,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.LeftEdge,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.TopRightCorner,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.TopLeftCorner,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.BottomLeftCorner,
					WardrobeCollectionFrame.ItemsCollectionFrame.NineSlice.BottomRightCorner,
					WardrobeCollectionFrame.SetsCollectionFrame.LeftInset.NineSlice.TopEdge,
					WardrobeCollectionFrame.SetsCollectionFrame.LeftInset.NineSlice.RightEdge,
					WardrobeCollectionFrame.SetsCollectionFrame.LeftInset.NineSlice.BottomEdge,
					WardrobeCollectionFrame.SetsCollectionFrame.LeftInset.NineSlice.LeftEdge,
					WardrobeCollectionFrame.SetsCollectionFrame.LeftInset.NineSlice.TopRightCorner,
					WardrobeCollectionFrame.SetsCollectionFrame.LeftInset.NineSlice.TopLeftCorner,
					WardrobeCollectionFrame.SetsCollectionFrame.LeftInset.NineSlice.BottomLeftCorner,
					WardrobeCollectionFrame.SetsCollectionFrame.LeftInset.NineSlice.BottomRightCorner,
					WardrobeCollectionFrame.SetsCollectionFrame.RightInset.NineSlice.TopEdge,
					WardrobeCollectionFrame.SetsCollectionFrame.RightInset.NineSlice.RightEdge,
					WardrobeCollectionFrame.SetsCollectionFrame.RightInset.NineSlice.BottomEdge,
					WardrobeCollectionFrame.SetsCollectionFrame.RightInset.NineSlice.LeftEdge,
					WardrobeCollectionFrame.SetsCollectionFrame.RightInset.NineSlice.TopRightCorner,
					WardrobeCollectionFrame.SetsCollectionFrame.RightInset.NineSlice.TopLeftCorner,
					WardrobeCollectionFrame.SetsCollectionFrame.RightInset.NineSlice.BottomLeftCorner,
					WardrobeCollectionFrame.SetsCollectionFrame.RightInset.NineSlice.BottomRightCorner }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({ 	
					WardrobeCollectionFrameScrollFrameScrollBarBottom,
					WardrobeCollectionFrameScrollFrameScrollBarMiddle,
					WardrobeCollectionFrameScrollFrameScrollBarTop,
					WardrobeCollectionFrameScrollFrameScrollBarThumbTexture,
					WardrobeCollectionFrameScrollFrameScrollBarScrollUpButton.Normal,
					WardrobeCollectionFrameScrollFrameScrollBarScrollDownButton.Normal,
					WardrobeCollectionFrameScrollFrameScrollBarScrollUpButton.Disabled,
					WardrobeCollectionFrameScrollFrameScrollBarScrollDownButton.Disabled, }) do
					v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_TrainerUI" then
				for i, v in pairs({ ClassTrainerFrame.NineSlice.TopEdge,
					ClassTrainerFrame.NineSlice.RightEdge,
					ClassTrainerFrame.NineSlice.BottomEdge,
					ClassTrainerFrame.NineSlice.LeftEdge,
					ClassTrainerFrame.NineSlice.TopRightCorner,
					ClassTrainerFrame.NineSlice.TopLeftCorner,
					ClassTrainerFrame.NineSlice.BottomLeftCorner,
					ClassTrainerFrame.NineSlice.BottomRightCorner }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					ClassTrainerFrame.Bg,
					ClassTrainerFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_AchievementUI" then
				for i, v in pairs({ AchievementFrameHeaderRight,
					AchievementFrameHeaderLeft,
					AchievementFrameWoodBorderTopLeft,
					AchievementFrameWoodBorderBottomLeft,
					AchievementFrameWoodBorderTopRight,
					AchievementFrameWoodBorderBottomRight,
					AchievementFrameMetalBorderBottom,
					AchievementFrameMetalBorderBottomLeft,
					AchievementFrameMetalBorderBottomRight,
					AchievementFrameMetalBorderLeft,
					AchievementFrameMetalBorderRight,
					AchievementFrameMetalBorderTop,
					AchievementFrameMetalBorderTopLeft,
					AchievementFrameMetalBorderTopRight, }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_AzeriteUI" then
				for i, v in pairs({ AzeriteEmpoweredItemUI.BorderFrame.NineSlice.TopEdge,
					AzeriteEmpoweredItemUI.BorderFrame.NineSlice.RightEdge,
					AzeriteEmpoweredItemUI.BorderFrame.NineSlice.BottomEdge,
					AzeriteEmpoweredItemUI.BorderFrame.NineSlice.LeftEdge,
					AzeriteEmpoweredItemUI.BorderFrame.NineSlice.TopRightCorner,
					AzeriteEmpoweredItemUI.BorderFrame.NineSlice.TopLeftCorner,
					AzeriteEmpoweredItemUI.BorderFrame.NineSlice.BottomLeftCorner,
					AzeriteEmpoweredItemUI.BorderFrame.NineSlice.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					AzeriteEmpoweredItemUI.BorderFrame.Bg,
					AzeriteEmpoweredItemUI.BorderFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_AlliedRacesUI" then
				for i, v in pairs({ AlliedRacesFrame.NineSlice.TopEdge,
					AlliedRacesFrame.NineSlice.RightEdge,
					AlliedRacesFrame.NineSlice.BottomEdge,
					AlliedRacesFrame.NineSlice.LeftEdge,
					AlliedRacesFrame.NineSlice.TopRightCorner,
					AlliedRacesFrame.NineSlice.TopLeftCorner,
					AlliedRacesFrame.NineSlice.BottomLeftCorner,
					AlliedRacesFrame.NineSlice.BottomRightCorner,
					AlliedRacesFrameInset.NineSlice.BottomEdge, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					AlliedRacesFrame.Bg,
					AlliedRacesFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_IslandsQueueUI" then
				for i, v in pairs({ IslandsQueueFrame.NineSlice.TopEdge,
					IslandsQueueFrame.NineSlice.RightEdge,
					IslandsQueueFrame.NineSlice.BottomEdge,
					IslandsQueueFrame.NineSlice.LeftEdge,
					IslandsQueueFrame.NineSlice.TopRightCorner,
					IslandsQueueFrame.NineSlice.TopLeftCorner,
					IslandsQueueFrame.NineSlice.BottomLeftCorner,
					IslandsQueueFrame.NineSlice.BottomRightCorner,
					IslandsQueueFrame.ArtOverlayFrame.PortraitFrame, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					IslandsQueueFrame.Bg,
					IslandsQueueFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_GarrisonUI" then
				for i, v in pairs({ GarrisonCapacitiveDisplayFrame.NineSlice.TopEdge,
					GarrisonCapacitiveDisplayFrame.NineSlice.RightEdge,
					GarrisonCapacitiveDisplayFrame.NineSlice.BottomEdge,
					GarrisonCapacitiveDisplayFrame.NineSlice.LeftEdge,
					GarrisonCapacitiveDisplayFrame.NineSlice.TopRightCorner,
					GarrisonCapacitiveDisplayFrame.NineSlice.TopLeftCorner,
					GarrisonCapacitiveDisplayFrame.NineSlice.BottomLeftCorner,
					GarrisonCapacitiveDisplayFrame.NineSlice.BottomRightCorner,
					GarrisonCapacitiveDisplayFrameInset.NineSlice.BottomEdge, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					GarrisonCapacitiveDisplayFrame.Bg,
					GarrisonCapacitiveDisplayFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_Calendar" then
				for i, v in pairs({ CalendarFrameTopMiddleTexture,
					CalendarFrameRightTopTexture,
					CalendarFrameRightMiddleTexture,
					CalendarFrameRightBottomTexture,
					CalendarFrameBottomRightTexture,
					CalendarFrameBottomMiddleTexture,
					CalendarFrameBottomLeftTexture,
					CalendarFrameLeftMiddleTexture,
					CalendarFrameLeftTopTexture,
					CalendarFrameLeftBottomTexture,
					CalendarFrameTopLeftTexture,
					CalendarFrameTopRightTexture,
					CalendarCreateEventFrame.Border.TopEdge,
					CalendarCreateEventFrame.Border.RightEdge,
					CalendarCreateEventFrame.Border.BottomEdge,
					CalendarCreateEventFrame.Border.LeftEdge,
					CalendarCreateEventFrame.Border.TopRightCorner,
					CalendarCreateEventFrame.Border.TopLeftCorner,
					CalendarCreateEventFrame.Border.BottomLeftCorner,
					CalendarCreateEventFrame.Border.BottomRightCorner,
					CalendarViewHolidayFrame.Border.TopEdge,
					CalendarViewHolidayFrame.Border.RightEdge,
					CalendarViewHolidayFrame.Border.BottomEdge,
					CalendarViewHolidayFrame.Border.LeftEdge,
					CalendarViewHolidayFrame.Border.TopRightCorner,
					CalendarViewHolidayFrame.Border.TopLeftCorner,
					CalendarViewHolidayFrame.Border.BottomLeftCorner,
					CalendarViewHolidayFrame.Border.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_GameMenu" then
				print('test')
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_AzeriteRespecUI" then
				for i, v in pairs({ AzeriteRespecFrame.NineSlice.TopEdge,
					AzeriteRespecFrame.NineSlice.RightEdge,
					AzeriteRespecFrame.NineSlice.BottomEdge,
					AzeriteRespecFrame.NineSlice.LeftEdge,
					AzeriteRespecFrame.NineSlice.TopRightCorner,
					AzeriteRespecFrame.NineSlice.TopLeftCorner,
					AzeriteRespecFrame.NineSlice.BottomLeftCorner,
					AzeriteRespecFrame.NineSlice.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					AzeriteRespecFrame.Bg,
					AzeriteRespecFrame.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_ScrappingMachineUI" then
				for i, v in pairs({ ScrappingMachineFrame.NineSlice.TopEdge,
					ScrappingMachineFrame.NineSlice.RightEdge,
					ScrappingMachineFrame.NineSlice.BottomEdge,
					ScrappingMachineFrame.NineSlice.LeftEdge,
					ScrappingMachineFrame.NineSlice.TopRightCorner,
					ScrappingMachineFrame.NineSlice.TopLeftCorner,
					ScrappingMachineFrame.NineSlice.BottomLeftCorner,
					ScrappingMachineFrame.NineSlice.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_TimeManager" then
				for i, v in pairs({ TimeManagerFrame.NineSlice.TopEdge,
					TimeManagerFrame.NineSlice.RightEdge,
					TimeManagerFrame.NineSlice.BottomEdge,
					TimeManagerFrame.NineSlice.LeftEdge,
					TimeManagerFrame.NineSlice.TopRightCorner,
					TimeManagerFrame.NineSlice.TopLeftCorner,
					TimeManagerFrame.NineSlice.BottomLeftCorner,
					TimeManagerFrame.NineSlice.BottomRightCorner,
					TimeManagerFrameInset.NineSlice.TopEdge,
					TimeManagerFrameInset.NineSlice.RightEdge,
					TimeManagerFrameInset.NineSlice.BottomEdge,
					TimeManagerFrameInset.NineSlice.LeftEdge,
					TimeManagerFrameInset.NineSlice.TopRightCorner,
					TimeManagerFrameInset.NineSlice.TopLeftCorner,
					StopwatchFrameBackgroundLeft, }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_AzeriteEssenceUI" then
				for i, v in pairs({ AzeriteEssenceUI.NineSlice.TopEdge,
					AzeriteEssenceUI.NineSlice.RightEdge,
					AzeriteEssenceUI.NineSlice.BottomEdge,
					AzeriteEssenceUI.NineSlice.LeftEdge,
					AzeriteEssenceUI.NineSlice.TopRightCorner,
					AzeriteEssenceUI.NineSlice.TopLeftCorner,
					AzeriteEssenceUI.NineSlice.BottomLeftCorner,
					AzeriteEssenceUI.NineSlice.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					AzeriteEssenceUI.Bg,
					AzeriteEssenceUI.TitleBg }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({ 	
					AzeriteEssenceUI.LeftInset.NineSlice.TopEdge,
					AzeriteEssenceUI.LeftInset.NineSlice.TopRightCorner,
					AzeriteEssenceUI.LeftInset.NineSlice.RightEdge,
					AzeriteEssenceUI.LeftInset.NineSlice.BottomRightCorner,
					AzeriteEssenceUI.LeftInset.NineSlice.BottomEdge,
					AzeriteEssenceUI.LeftInset.NineSlice.BottomLeftCorner,
					AzeriteEssenceUI.LeftInset.NineSlice.LeftEdge,
					AzeriteEssenceUI.LeftInset.NineSlice.TopLeftCorner,
					AzeriteEssenceUI.RightInset.NineSlice.TopEdge,
					AzeriteEssenceUI.RightInset.NineSlice.TopRightCorner,
					AzeriteEssenceUI.RightInset.NineSlice.RightEdge,
					AzeriteEssenceUI.RightInset.NineSlice.BottomRightCorner,
					AzeriteEssenceUI.RightInset.NineSlice.BottomEdge,
					AzeriteEssenceUI.RightInset.NineSlice.BottomLeftCorner,
					AzeriteEssenceUI.RightInset.NineSlice.LeftEdge,
					AzeriteEssenceUI.RightInset.NineSlice.TopLeftCorner, }) do
					v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({ 	
					AzeriteEssenceUI.EssenceList.ScrollBar.ScrollBarBottom,
					AzeriteEssenceUI.EssenceList.ScrollBar.ScrollBarMiddle,
					AzeriteEssenceUI.EssenceList.ScrollBar.ScrollBarTop,
					AzeriteEssenceUI.EssenceList.ScrollBar.thumbTexture,
					AzeriteEssenceUI.EssenceList.ScrollBar.ScrollUpButton.Normal,
					AzeriteEssenceUI.EssenceList.ScrollBar.ScrollDownButton.Normal,
					AzeriteEssenceUI.EssenceList.ScrollBar.ScrollUpButton.Disabled,
					AzeriteEssenceUI.EssenceList.ScrollBar.ScrollDownButton.Disabled, }) do
					v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_PVPUI" then
				for i, v in pairs({
					HonorFrame.BonusFrame.WorldBattlesTexture,
					ConquestFrame.RatedBGTexture, }) do
						v:SetVertexColor(.35, .35, .35)
				end
				for i, v in pairs({
					PVPQueueFrame.HonorInset.NineSlice.TopEdge,
					PVPQueueFrame.HonorInset.NineSlice.TopRightCorner,
					PVPQueueFrame.HonorInset.NineSlice.RightEdge,
					PVPQueueFrame.HonorInset.NineSlice.BottomRightCorner,
					PVPQueueFrame.HonorInset.NineSlice.BottomEdge,
					PVPQueueFrame.HonorInset.NineSlice.BottomLeftCorner,
					PVPQueueFrame.HonorInset.NineSlice.LeftEdge,
					PVPQueueFrame.HonorInset.NineSlice.TopLeftCorner,
					HonorFrame.Inset.NineSlice.TopEdge,
					HonorFrame.Inset.NineSlice.TopRightCorner,
					HonorFrame.Inset.NineSlice.RightEdge,
					HonorFrame.Inset.NineSlice.BottomRightCorner,
					HonorFrame.Inset.NineSlice.BottomEdge,
					HonorFrame.Inset.NineSlice.BottomLeftCorner,
					HonorFrame.Inset.NineSlice.LeftEdge,
					HonorFrame.Inset.NineSlice.TopLeftCorner,
					ConquestFrame.Inset.NineSlice.TopEdge,
					ConquestFrame.Inset.NineSlice.TopRightCorner,
					ConquestFrame.Inset.NineSlice.RightEdge,
					ConquestFrame.Inset.NineSlice.BottomRightCorner,
					ConquestFrame.Inset.NineSlice.BottomEdge,
					ConquestFrame.Inset.NineSlice.BottomLeftCorner,
					ConquestFrame.Inset.NineSlice.LeftEdge,
					ConquestFrame.Inset.NineSlice.TopLeftCorner,
					ConquestFrame.ConquestBar.Border,
					HonorFrame.ConquestBar.Border,}) do
						v:SetVertexColor(.35, .35, .35)
				end
				PVPQueueFrame.HonorInset:Hide();
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_ChallengesUI" then
				for i, v in pairs({
					ChallengesFrameInset.NineSlice.TopEdge,
					ChallengesFrameInset.NineSlice.TopRightCorner,
					ChallengesFrameInset.NineSlice.RightEdge,
					ChallengesFrameInset.NineSlice.BottomRightCorner,
					ChallengesFrameInset.NineSlice.BottomEdge,
					ChallengesFrameInset.NineSlice.BottomLeftCorner,
					ChallengesFrameInset.NineSlice.LeftEdge,
					ChallengesFrameInset.NineSlice.TopLeftCorner,}) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

		local f = CreateFrame("Frame")
		f:RegisterEvent("ADDON_LOADED")
		f:SetScript("OnEvent", function(self, event, name)
			if name == "Blizzard_ArchaeologyUI" then
				for i, v in pairs({ ArchaeologyFrame.NineSlice.TopEdge,
					ArchaeologyFrame.NineSlice.RightEdge,
					ArchaeologyFrame.NineSlice.BottomEdge,
					ArchaeologyFrame.NineSlice.LeftEdge,
					ArchaeologyFrame.NineSlice.TopRightCorner,
					ArchaeologyFrame.NineSlice.TopLeftCorner,
					ArchaeologyFrame.NineSlice.BottomLeftCorner,
					ArchaeologyFrame.NineSlice.BottomRightCorner, }) do
						v:SetVertexColor(.35, .35, .35)
				end
			end
		end)

end)

DarkModeTooltip:SetScript("OnEvent", function(self, event)
            local function styleTooltip(self, style)
            if not self.SetBackdrop then Mixin(self, BackdropTemplateMixin) end
            backdrop = {
                bgFile = "Interface\\Buttons\\WHITE8x8",
                bgColor = {0.03,0.03,0.03, 0.9},
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                borderColor = {0.03,0.03,0.03, 0.9},
                itemBorderColorAlpha = 0.9,
                azeriteBorderColor = {1,0.3,0,0.9},
                tile = false,
                tileEdge = false,
                tileSize = 16,
                edgeSize = 16,
                insets = {left=3, right=3, top=3, bottom=3}
                }
            self:SetBackdrop(backdrop)
            self:SetBackdropColor(unpack(backdrop.bgColor))
            local _, itemLink = self:GetItem()
            if itemLink then
                local azerite = C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) or C_AzeriteItem.IsAzeriteItemByID(itemLink) or false
                local _, _, itemRarity = GetItemInfo(itemLink)
                local r,g,b = 1,1,1
                if itemRarity then r,g,b = GetItemQualityColor(itemRarity) end
                if azerite and backdrop.azeriteBorderColor then
                self:SetBackdropBorderColor(backdrop.borderColor)
                else
                self:SetBackdropBorderColor(backdrop.borderColor)
                end
            else
                self:SetBackdropBorderColor(backdrop.borderColor)
            end
            end
            hooksecurefunc("SharedTooltip_SetBackdropStyle", styleTooltip)
            local tooltips = { GameTooltip,ShoppingTooltip1,ShoppingTooltip2,ItemRefTooltip,ItemRefShoppingTooltip1,ItemRefShoppingTooltip2,WorldMapTooltip,
            WorldMapCompareTooltip1,WorldMapCompareTooltip2,SmallTextTooltip }
            for i, tooltip in next, tooltips do styleTooltip(tooltip) end

        if not TOOLTIP == true then return end

        FONT = STANDARD_TEXT_FONT
        local classColorHex, factionColorHex = {}, {}
        
        local cfg = {
            pos = {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 100},
            textColor = {0.4,0.4,0.4},
            bossColor = {1,0,0},
            eliteColor = {1,0,0.5},
            rareeliteColor = {1,0.5,0},
            rareColor = {1,0.5,0},
            levelColor = {0.8,0.8,0.5},
            deadColor = {0.5,0.5,0.5},
            targetColor = {1,0.5,0.5},
            guildColor = {0.8, 0.0, 0.6},
            afkColor = {0,1,1},
            scale = 0.95,
            fontFamily = STANDARD_TEXT_FONT,
        }
        
        local function GetHexColor(color)
          if color.r then
            return ("%.2x%.2x%.2x"):format(color.r*255, color.g*255, color.b*255)
          else
            local r,g,b,a = unpack(color)
            return ("%.2x%.2x%.2x"):format(r*255, g*255, b*255)
          end
        end
        
        local function GetTarget(unit)
          if UnitIsUnit(unit, "player") then
            return ("|cffff0000%s|r"):format("<YOU>")
          elseif UnitIsPlayer(unit, "player") then
            local _, class = UnitClass(unit)
            return ("|cff%s%s|r"):format(classColorHex[class], UnitName(unit))
          elseif UnitReaction(unit, "player") then
            return ("|cff%s%s|r"):format(factionColorHex[UnitReaction(unit, "player")], UnitName(unit))
          else
            return ("|cffffffff%s|r"):format(UnitName(unit))
          end
        end
        
        local function OnTooltipSetUnit(self)
          local unitName, unit = self:GetUnit()
          if not unit then return end
          for i = 2, GameTooltip:NumLines() do
            local line = _G["GameTooltipTextLeft"..i]
            if line then
                line:SetTextColor(unpack(cfg.textColor))
            end
          end
          local raidIconIndex = GetRaidTargetIndex(unit)
          if raidIconIndex then
            GameTooltipTextLeft1:SetText(("%s %s"):format(ICON_LIST[raidIconIndex].."14|t", unitName))
          end
          if not UnitIsPlayer(unit) then
            local reaction = UnitReaction(unit, "player")
            if reaction then
              local color = FACTION_BAR_COLORS[reaction]
              if color then
                cfg.barColor = color
                GameTooltipStatusBar:SetStatusBarColor(color.r,color.g,color.b)
                _G["GameTooltipTextLeft1"]:SetTextColor(color.r,color.g,color.b)
              end
            end
            local unitClassification = UnitClassification(unit)
            local levelLine
            if string.find(_G["GameTooltipTextLeft2"]:GetText() or "empty", "%a%s%d") then
              levelLine = _G["GameTooltipTextLeft2"]
            elseif string.find(_G["GameTooltipTextLeft3"]:GetText() or "empty", "%a%s%d") then
                _G["GameTooltipTextLeft2"]:SetTextColor(unpack(cfg.guildColor))
              levelLine = _G["GameTooltipTextLeft3"]
            end
            if levelLine then
              local l = UnitLevel(unit)
              local color = GetCreatureDifficultyColor((l > 0) and l or 999)
              levelLine:SetTextColor(color.r,color.g,color.b)
            end
            if unitClassification == "worldboss" or UnitLevel(unit) == -1 then
              self:AppendText(" |cffff0000{B}|r")
              _G["GameTooltipTextLeft2"]:SetTextColor(unpack(cfg.bossColor))
            elseif unitClassification == "rare" then
              self:AppendText(" |cffff9900{R}|r")
            elseif unitClassification == "rareelite" then
              self:AppendText(" |cffff0000{R+}|r")
            elseif unitClassification == "elite" then
              self:AppendText(" |cffff6666{E}|r")
            end
          else
            local _, unitClass = UnitClass(unit)
            local color = RAID_CLASS_COLORS[unitClass]
            cfg.barColor = color
            GameTooltipStatusBar:SetStatusBarColor(color.r,color.g,color.b)
            _G["GameTooltipTextLeft1"]:SetTextColor(color.r,color.g,color.b)
            local guildName, guildRank = GetGuildInfo(unit)
            if guildName then
                _G["GameTooltipTextLeft2"]:SetText("<"..guildName.."> ["..guildRank.."]")
                _G["GameTooltipTextLeft2"]:SetTextColor(unpack(cfg.guildColor))
            end
            local levelLine = guildName and _G["GameTooltipTextLeft3"] or _G["GameTooltipTextLeft2"]
            local l = UnitLevel(unit)
            local color = GetCreatureDifficultyColor((l > 0) and l or 999)
            levelLine:SetTextColor(color.r,color.g,color.b)
            if UnitIsAFK(unit) then
              self:AppendText((" |cff%s<AFK>|r"):format(cfg.afkColorHex))
            end
          end
          if UnitIsDeadOrGhost(unit) then
            _G["GameTooltipTextLeft1"]:SetTextColor(unpack(cfg.deadColor))
          end
          if (UnitExists(unit.."target")) then
            GameTooltip:AddDoubleLine(("|cff%s%s|r"):format(cfg.targetColorHex, "Target"),GetTarget(unit.."target") or "Unknown")
          end
        end

        local function SetStatusBarColor(self,r,g,b)
          if not cfg.barColor then return end
          if r == cfg.barColor.r and g == cfg.barColor.g and b == cfg.barColor.b then return end
          self:SetStatusBarColor(cfg.barColor.r,cfg.barColor.g,cfg.barColor.b)
        end
        
        hooksecurefunc("GameTooltip_SetDefaultAnchor", function(tooltip, parent)
                tooltip:SetOwner(parent, "ANCHOR_NONE")
                tooltip:ClearAllPoints()
                tooltip:SetPoint(unpack(cfg.pos))
        end)
        
        for class, color in next, RAID_CLASS_COLORS do
          classColorHex[class] = GetHexColor(color)
        end

        for i = 1, #FACTION_BAR_COLORS do
          factionColorHex[i] = GetHexColor(FACTION_BAR_COLORS[i])
        end
        
        cfg.targetColorHex = GetHexColor(cfg.targetColor)
        cfg.afkColorHex = GetHexColor(cfg.afkColor)
        
        GameTooltipHeaderText:SetFont(cfg.fontFamily, 14, "NONE")
        GameTooltipHeaderText:SetShadowOffset(1,-2)
        GameTooltipHeaderText:SetShadowColor(0,0,0,0.75)
        GameTooltipText:SetFont(cfg.fontFamily, 12, "NONE")
        GameTooltipText:SetShadowOffset(1,-2)
        GameTooltipText:SetShadowColor(0,0,0,0.75)
        Tooltip_Small:SetFont(cfg.fontFamily, 11, "NONE")
        Tooltip_Small:SetShadowOffset(1,-2)
        Tooltip_Small:SetShadowColor(0,0,0,0.75)

        GameTooltip:ClearAllPoints()
        GameTooltip:SetPoint("LEFT",50,0)
        GameTooltip:SetPoint("RIGHT",-5,0)
        GameTooltip:SetPoint("TOP",0,-0.5)

        GameTooltipStatusBar:Hide();
        GameTooltipStatusBar:SetScript("OnShow",function(self)
        self:Hide();
        end)
        local tooltips = { GameTooltip,ShoppingTooltip1,ShoppingTooltip2,ItemRefTooltip,ItemRefShoppingTooltip1,ItemRefShoppingTooltip2,WorldMapTooltip,
        WorldMapCompareTooltip1,WorldMapCompareTooltip2,SmallTextTooltip }
        for i, tooltip in next, tooltips do
          tooltip:SetScale(cfg.scale)
        end
        
        local menues = {
          DropDownList1MenuBackdrop,
          DropDownList2MenuBackdrop,
        }
        for i, menu in next, menues do
          menu:SetScale(cfg.scale)
        end
        
        local function TooltipAddSpellID(self,spellid)
          if not spellid then return end
          if type(spellid) == "table" and #spellid == 1 then spellid = spellid[1] end
          
          local frame, text
          for i = 1,15 do
              frame = _G[self:GetName() .. "TextLeft" .. i]
              if frame then text = frame:GetText() end
              if text and string.find(text, "|cff0099ffID|r") then return end
          end
          
          self:AddDoubleLine("|cff0099ffID|r",spellid)
          self:Show()
        end
        
        hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
          TooltipAddSpellID(self,select(10,UnitBuff(...)))
        end)
        
        hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
          TooltipAddSpellID(self,select(10,UnitDebuff(...)))
        end)
        
        hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
          TooltipAddSpellID(self,select(10,UnitAura(...)))
        end)
        
        hooksecurefunc("SetItemRef", function(link)
          local type, value = link:match("(%a+):(.+)")
          if type == "spell" then
            TooltipAddSpellID(ItemRefTooltip,value:match("([^:]+)"))
          end
        end)
        
        GameTooltip:HookScript("OnTooltipSetSpell", function(self)
          TooltipAddSpellID(self,select(2,self:GetSpell()))
        end)
end)

f=CreateFrame("FRAME")
f:RegisterEvent("PLAYER_TARGET_CHANGED")
f:RegisterEvent("PLAYER_FOCUS_CHANGED")
f:RegisterEvent("UNIT_FACTION")
f:RegisterEvent("GROUP_ROSTER_UPDATE")

function e(self,event,...)
	if UnitIsPlayer("target") then 
		c=RAID_CLASS_COLORS[select(2,UnitClass("target"))]
		TargetFrameNameBackground:SetVertexColor(c.r,c.g,c.b)
		
	end
	if UnitIsPlayer("focus") then
		c=RAID_CLASS_COLORS[select(2,UnitClass("focus"))]
		FocusFrameNameBackground:SetVertexColor(c.r,c.g,c.b)
		
	end
end
f:SetScript("OnEvent",e)

if PlayerFrame:IsShown() and not PlayerFrame.bg then
	c=RAID_CLASS_COLORS[select(2,UnitClass("player"))]
	bg=PlayerFrame:CreateTexture()
	bg:SetPoint("TOPLEFT",PlayerFrameBackground)
	bg:SetPoint("BOTTOMRIGHT",PlayerFrameBackground,0,22)
	bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
	bg:SetVertexColor(c.r,c.g,c.b)
 PlayerFrame.bg=true end

hooksecurefunc("PlayerFrame_UpdateStatus", function()
	if IsResting("player") then
		PlayerStatusTexture:Hide()
      		PlayerRestGlow:Hide()
      		PlayerStatusGlow:Hide()
   	end
end)


-- Some lazy frame scaling, and general UI Fixes that annoy me
local scaler = 0.75 -- frame scale
local LoadFrame = CreateFrame("Frame")
LoadFrame:RegisterEvent("PLAYER_LOGIN")
LoadFrame:SetScript("OnEvent", function(self,event,...)
	-- Loading addons so I can scale them on "login", dosen't seem to effect load time
	LoadAddOn("Blizzard_Communities") 
	LoadAddOn("Blizzard_AzeriteUI") 
	LoadAddOn("Blizzard_GarrisonUI")
	LoadAddOn("Blizzard_WarboardUI")
	LoadAddOn("Blizzard_AchievementUI")
	LoadAddOn("Blizzard_TalentUI")
	LoadAddOn("Blizzard_EncounterJournal")
	LoadAddOn("Blizzard_Collections")
	LoadAddOn("Blizzard_ItemSocketingUI")
	LoadAddOn("Blizzard_InspectUI")
	LoadAddOn("Blizzard_GuildUI") -- So I can use old Guild UI, and use Communities as a "Chat History"
	LoadAddOn("Blizzard_TradeSkillUI")
	LoadAddOn("Blizzard_MacroUI")
	
	-- Chat Shit Hiding (new 8.0 stuff) I should probs add this to bChat instead of dfs
	kysChat()
	ChatFrame1ThumbTexture:ClearAllPoints()
	ChatFrame1ThumbTexture:Hide()
	ChatFrame1.ScrollBar:ClearAllPoints()
	ChatFrame1.ScrollBar:Hide()
	
	-- Frame Scaling
	CharacterFrame:SetScale(scaler)
	AzeriteEmpoweredItemUI:SetScale(scaler) 
	ItemSocketingFrame:SetScale(scaler)
	InspectFrame:SetScale(scaler)
	CommunitiesFrame:SetScale(scaler) 
	GuildFrame:SetScale(scaler)
	FriendsFrame:SetScale(scaler)
	GossipFrame:SetScale(scaler)
	QuestFrame:SetScale(scaler)
	GarrisonLandingPage:SetScale(scaler)
	WarboardQuestChoiceFrame:SetScale(scaler) 
	CollectionsJournal:SetScale(scaler)
	EncounterJournal:SetScale(scaler)
	AchievementFrame:SetScale(scaler)
	SpellBookFrame:SetScale(scaler)
	PVEFrame:SetScale(scaler)
	PlayerTalentFrame:SetScale(scaler)
	MerchantFrame:SetScale(scaler)
	WardrobeFrame:SetScale(scaler)
	TradeSkillFrame:SetScale(scaler)
	MailFrame:SetScale(scaler)
	MacroFrame:SetScale(scaler)
	
	-- Dirty little hook on ToggleGuildFrame
	ToggleGuildFrame = function() 
		if CommunitiesFrame:IsVisible() or GuildFrame:IsVisible() then
			HideUIPanel(CommunitiesFrame)
			HideUIPanel(GuildFrame)
		else
			ShowUIPanel(CommunitiesFrame)
			ShowUIPanel(GuildFrame)
			showRosterHack()
		end
	end
end)

-- Island Expedition scaling
local IslandFrame = CreateFrame("Frame")
IslandFrame:RegisterEvent("ISLANDS_QUEUE_OPEN")
IslandFrame:SetScript("OnEvent",function(self,event,...)
	IslandsQueueFrame:SetScale(scaler) 
end)

-- Hiding Talking Heads, borrowed from another addon
local head = CreateFrame("Frame")
function head:OnEvent(event, addon)
	if addon == "Blizzard_TalkingHeadUI" then
		hooksecurefunc("TalkingHeadFrame_PlayCurrent", function()
				TalkingHeadFrame_CloseImmediately()
		end)
	self:UnregisterEvent(event)
	end
end
head:RegisterEvent("ADDON_LOADED")
head:SetScript("OnEvent", head.OnEvent)

-- If I ever actually use Blizz VChat
-- Activate
local VoiceActive = CreateFrame("Frame")
VoiceActive:RegisterEvent("VOICE_CHAT_CHANNEL_ACTIVATED")
VoiceActive:SetScript("OnEvent",function(self,event,...)
	kysChat()
end)

-- Deactivate
local VoiceDeactive = CreateFrame("Frame")
VoiceDeactive:RegisterEvent("VOICE_CHAT_CHANNEL_DEACTIVATED")
VoiceDeactive:SetScript("OnEvent",function(self,event,...)
	kysChat()
end)

-- Manually setting Guildframe to show roster on show
function showRosterHack()
	ButtonFrameTemplate_HideButtonBar(GuildFrame);
	GuildFrame_ShowPanel("GuildRosterFrame");
	GuildFrameInset:SetPoint("TOPLEFT", 4, -90);
	GuildFrameInset:SetPoint("BOTTOMRIGHT", -7, 26);
	GuildFrameBottomInset:Hide();
	GuildPointFrame:Hide();
	GuildFactionFrame:Hide();
	updateRosterCount = true;
	GuildFrameMembersCountLabel:Show();
	PanelTemplates_SetTab(GuildFrame, 2); 
end

-- Fucking some chat buttons off
function kysChat()
	ChatFrameToggleVoiceDeafenButton:ClearAllPoints()
	ChatFrameToggleVoiceDeafenButton:Hide() 
	ChatFrameToggleVoiceMuteButton:ClearAllPoints()
	ChatFrameToggleVoiceMuteButton:Hide()
	ChatFrameChannelButton:ClearAllPoints()
	ChatFrameChannelButton:Hide()
end
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
	LoadAddOn("Blizzard_InspectUI")
	LoadAddOn("Blizzard_GuildUI") -- So I can use old Guild UI, and use Communities as a "Chat History"
	LoadAddOn("Blizzard_TradeSkillUI")
	
	-- Chat Widget hiding
	ChatFrameToggleVoiceDeafenButton:ClearAllPoints()
	ChatFrameToggleVoiceDeafenButton:Hide() 
	ChatFrameToggleVoiceMuteButton:ClearAllPoints()
	ChatFrameToggleVoiceMuteButton:Hide()
	ChatFrameChannelButton:ClearAllPoints()
	ChatFrameChannelButton:Hide()
	
	-- Scaling Frames to non awful sizes
	AzeriteEmpoweredItemUI:SetScale(scaler) 
	CommunitiesFrame:SetScale(scaler) 
	WarboardQuestChoiceFrame:SetScale(scaler) 
	GarrisonLandingPage:SetScale(scaler)
	InspectFrame:SetScale(scaler)
	GossipFrame:SetScale(scaler)
	CollectionsJournal:SetScale(scaler)
	EncounterJournal:SetScale(scaler)
	AchievementFrame:SetScale(scaler)
	FriendsFrame:SetScale(scaler)
	CharacterFrame:SetScale(scaler)
	SpellBookFrame:SetScale(scaler)
	PVEFrame:SetScale(scaler)
	PlayerTalentFrame:SetScale(scaler)
	QuestFrame:SetScale(scaler)
	MerchantFrame:SetScale(scaler)
	WardrobeFrame:SetScale(scaler)
	TradeSkillFrame:SetScale(scaler)
	GuildFrame:SetScale(scaler)
	
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





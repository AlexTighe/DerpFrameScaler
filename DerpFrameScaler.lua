-- Lazy scaling of frames I want to do because I play at a stupid UIScale
local LoadFrame = CreateFrame("Frame")
LoadFrame:RegisterEvent("PLAYER_LOGIN")
local scaler = 0.75

LoadFrame:SetScript("OnEvent", function(self,event,...)
	LoadAddOn("Blizzard_Communities") -- for BfA
	LoadAddOn("Blizzard_AzeriteUI") -- for BfA
	LoadAddOn("Blizzard_GarrisonUI")
	LoadAddOn("Blizzard_WarboardUI")
	LoadAddOn("Blizzard_AchievementUI")
	LoadAddOn("Blizzard_TalentUI")
	LoadAddOn("Blizzard_EncounterJournal")
	LoadAddOn("Blizzard_Collections")
	LoadAddOn("Blizzard_InspectUI")
	--LoadAddOn("Blizzard_GuildUI") -- removed (void) in BfA
	LoadAddOn("Blizzard_TradeSkillUI")
	
	-- Chat Widget Hiding
	ChatFrameToggleVoiceDeafenButton:Hide() -- for BfA
	ChatFrameToggleVoiceMuteButton:Hide() -- for BfA
	
	-- Exclusive for BfA Beta
	Confused:GetParent():SetAlpha(0) -- for BfA Beta Feedback box
	Confused:GetParent():SetScale(0.1) -- for BfA Beta Feedback box
	
	AzeriteEmpoweredItemUI:SetScale(scaler) -- for BfA
	CommunitiesFrame:SetScale(scaler) -- for BfA
	WarboardQuestChoiceFrame:SetScale(scaler) -- for BfA
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
	--GuildFrame:SetScale(scaler) -- removed in BfA
end)

-- Island Expiditions UI scaling
local IslandFrame = CreateFrame("Frame")
IslandFrame:RegisterEvent("ISLANDS_QUEUE_OPEN")
IslandFrame:SetScript("OnEvent",function(self,event,...)
	IslandsQueueFrame:SetScale(scaler) 
end)


-- fuck off floating head
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


-- Lazy scaling of frames I want to do because I play at a stupid UIScale
-- This is BfA Version
local LoadFrame = CreateFrame("Frame")
LoadFrame:RegisterEvent("PLAYER_LOGIN")
local scaler = 0.75

LoadFrame:SetScript("OnEvent", function(self,event,...)
	LoadAddOn("Blizzard_Communities") -- for BfA
	LoadAddOn("Blizzard_AzeriteUI") -- for BfA
	LoadAddOn("Blizzard_AchievementUI")
	LoadAddOn("Blizzard_TalentUI")
	LoadAddOn("Blizzard_EncounterJournal")
	LoadAddOn("Blizzard_Collections")
	--LoadAddOn("Blizzard_GuildUI") -- removed in BfA
	
	

	AzeriteEmpoweredItemUI:SetScale(scaler) -- for BfA
	CommunitiesFrame:SetScale(scaler) -- for BfA
	CollectionsJournal:SetScale(scaler)
	EncounterJournal:SetScale(scaler)
	AchievementFrame:SetScale(scaler)
	FriendsFrame:SetScale(scaler)
	CharacterFrame:SetScale(scaler)
	SpellBookFrame:SetScale(scaler)
	PVEFrame:SetScale(scaler)
	PlayerTalentFrame:SetScale(scaler)
	QuestFrame:SetScale(scaler)
	--GuildFrame:SetScale(scaler) -- removed in BfA
end)

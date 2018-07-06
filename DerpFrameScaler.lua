-- Lazy scaling of frames I want to do because I play at a stupid UIScale
local LoadFrame = CreateFrame("Frame")
LoadFrame:RegisterEvent("PLAYER_LOGIN")
local scaler = 0.7

LoadFrame:SetScript("OnEvent", function(self,event,...)
	LoadAddOn("Blizzard_Communities")
	LoadAddOn("Blizzard_AchievementUI")
	LoadAddOn("Blizzard_TalentUI")
	LoadAddOn("Blizzard_EncounterJournal")
	LoadAddOn("Blizzard_Collections")
	
	
	CollectionsJournal:SetScale(scaler)
	EncounterJournal:SetScale(scaler)
	AchievementFrame:SetScale(scaler)
	FriendsFrame:SetScale(scaler)
	CommunitiesFrame:SetScale(scaler)
	CharacterFrame:SetScale(scaler)
	SpellBookFrame:SetScale(scaler)
	PVEFrame:SetScale(scaler)
	PlayerTalentFrame:SetScale(scaler)

end)

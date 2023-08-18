local blackjack_status, blackjack = pcall(require, "blackjack")
if not blackjack_status then
	return
end

blackjack.setup({
	card_style = "mini", -- Can be "mini" or "large".
	suit_style = "black", -- Can be "black" or "white".
	scores_path = "/Users/rodrigomunoz/blackjack_scores.json", -- Default location to store the scores.json file.
})

-- :BlackJackNewGame
-- :BlackJackQuit

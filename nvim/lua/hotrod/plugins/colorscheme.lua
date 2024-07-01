return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			-- Enable transparent background
			transparent = true,

			-- Enable italics comments
			italic_comments = false,

			-- Replace all fillchars with ' ' for the ultimate clean look
			hide_fillchars = false,

			-- Modern borderless telescope theme
			borderless_telescope = true,

			-- Set terminal colors used in `:terminal`
			terminal_colors = true,

			theme = {
				variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
				highlights = {
					-- Highlight groups to override, adding new groups is also possible
					-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

					-- Example:
					Comment = { fg = "#696969", bg = "NONE", italic = true },

					-- Complete list can be found in `lua/cyberdream/theme.lua`
				},

				-- Override a highlight group entirely using the color palette
				overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
					-- Example:
					return {
						Comment = { fg = colors.green, bg = "NONE", italic = true },
						["@property"] = { fg = colors.magenta, bold = true },
					}
				end,

				-- Override a color entirely
				colors = {
					-- For a list of colors see `lua/cyberdream/colours.lua`
					-- Example:
					bg = "#000000",
					green = "#00ff00",
					magenta = "#ff00ff",
				},
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
-- -- :help tokyonight.nvim.txt
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "night", -- storm, moon, or night
-- 			transparent = true, -- Enable this to disable setting the background color
-- 			light_style = "day", -- The theme is used when the background is set to light
-- 			styles = {
-- 				-- Style to be applied to different syntax groups
-- 				-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = {},
-- 				variables = {},
-- 				-- Background styles. Can be "dark", "transparent" or "normal"
-- 				sidebars = "transparent", -- style for sidebars, see below
-- 				floats = "transparent", -- style for floating windows
-- 			},
-- 			-- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
-- 			--- You can override specific color groups to use other groups or a hex color
-- 			--- function will be called with a ColorScheme table
-- 			---@param colors ColorScheme
-- 			on_colors = function(colors) end,
--
-- 			--- You can override specific highlights to use other groups or a hex color
-- 			--- function will be called with a Highlights and ColorScheme table
-- 			---@param highlights Highlights
-- 			---@param colors ColorScheme
-- 			on_highlights = function(highlights, colors)
-- 				highlights.NoiceVirtualText = {
-- 					fg = colors.warning,
-- 					-- bg = colors.bg_dark,
-- 				}
-- 			end,
-- 		})
-- 		vim.cmd([[colorscheme tokyonight]])
-- 	end,
-- }

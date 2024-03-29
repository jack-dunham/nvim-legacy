------------------
-- LOAD PLUGINS --
------------------
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_boostrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("impatient").enable_profile()
-- local use = require('packer').use

require("packer").startup({
	function(use)
		-- Packer manages itself
		use("wbthomason/packer.nvim")
		-- Plenary
		use("lewis6991/impatient.nvim")
		use("nvim-lua/plenary.nvim")
		use("stevearc/dressing.nvim")
		use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")
		use({
			"rcarriga/nvim-notify",
			-- config = function()
			-- 	vim.notify = require("notify")
			-- end,
		})
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		})
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup({})
			end,
		})
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})
		use({
			"folke/zen-mode.nvim",
			config = function()
				require("zen-mode").setup({})
			end,
		})
		use({
			"folke/twilight.nvim",
			config = function()
				require("twilight").setup({})
			end,
		})
		use({
			"folke/trouble.nvim",
			config = function()
				require("trouble").setup({})
			end,
		})
		use({
			"stevearc/aerial.nvim",
			config = function()
				require("plugins.aerial")
			end,
		})
		use({
			"nvim-telescope/telescope.nvim",
			cmd = { "Telescope" },
			requires = { { "plenary.nvim" } },
			config = function()
				require("plugins.telescope")
			end,
		})
		use({
			"nvim-telescope/telescope-project.nvim",
			requires = "nvim-telescope/telescope.nvim",
			-- cmd = "Telescope project",
			fn = { "require'telescope'.extensions.project.project{}" },
			config = function()
				require("telescope").load_extension("project")
			end,
			-- wants = "telescope.nvim",
		})
		use({
			"nvim-telescope/telescope-file-browser.nvim",
			requires = "nvim-telescope/telescope.nvim",
			fn = { "require('telescope').extensions.file_browser.file_browser{}" },
			config = function()
				require("telescope").load_extension("file_browser")
			end,
			-- wants = "telescope.nvim",
		})
		use({
			"nvim-telescope/telescope-bibtex.nvim",
			requires = "nvim-telescope/telescope.nvim",
			cmd = "Telescope bibtex",
			config = function()
				require("telescope").load_extension("bibtex")
			end,
			-- wants = "telescope.nvim",
		})
		--	requires = "nvim-telescope/telescope.nvim",
		--	after = "nvim-telescope/telescope.nvim",
		--	cmd = 'Telescope projects',
		--}
		-- Magit-like interface for git
		-- use("tpope/vim-fugitive")
		-- use({
		-- 	"TimUntersberger/neogit",
		-- 	cmd = { "Neogit", "Neogit commit" },
		-- 	requires = "nvim-lua/plenary.nvim",
		-- })
		use({
			"lewis6991/gitsigns.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})
		--
		use({
			"goolord/alpha-nvim",
			config = function()
				require("plugins.alpha")
			end,
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("lsp.null-ls")
			end,
		})
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("nvim-lspconfig")
			end,
		})
		use({
			"f3fora/nvim-texlabconfig",
			config = function()
				require("texlabconfig").setup({
					cache_activate = true,
					cache_filetypes = { "tex", "bib" },
					cache_root = vim.fn.stdpath("cache"),
					reverse_search_edit_cmd = "edit",
				})
			end,
			ft = { "tex", "bib" },
			cmd = { "TexlabInverseSearch" },
		})
		use("tpope/vim-surround")
		-- Block comments with 'gc'
		use("tpope/vim-commentary")
		-- Theme
		use({"Yazeed1s/oh-lucy.nvim"})
		use({
			"catppuccin/nvim",
			as = "catppuccin",
			config = function()
				require("plugins.catppuccin")
			end,
		})
		use({ "folke/tokyonight.nvim" })
		--
		-- Status line
		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				require("plugins.lualine")
			end,
		})
		-- use("lervag/vimtex")
		--
		-- Completion et al.
		use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })
		use({
			"L3MON4D3/LuaSnip",
			after = "friendly-snippets",
			config = function()
				require("plugins.luasnip")
			end,
		})
		use({
			"hrsh7th/nvim-cmp",
			after = "LuaSnip",
			config = function()
				require("plugins.nvim-cmp")
			end,
		})
		use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

		use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })

		use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })

		use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })

		use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
		-- use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "cmp-path" })
		-- use({
		-- 	"ray-x/lsp_signature.nvim",
		-- 	config = function()
		-- 		require("lsp_signature").setup({ hint_enable = false, hint_prefix = "" })
		-- 	end,
		-- })
		-- use({ "github/copilot.vim" })
		-- LSP
		use("williamboman/nvim-lsp-installer")
		-- use({
		-- 	"simrat39/symbols-outline.nvim",
		-- 	cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
		-- 	setup = require("plugins.symbols-outline").setup(),
		-- })
		--
		--treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			config = function()
				require("plugins.treesitter")
			end,
		})
		-- File tree
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = {
				"NvimTreeFindFile",
				"NvimTreeOpen",
				"NvimTreeToggle",
				"NvimTreeFocus",
				"NvimTreeClose",
				"SidebarNvimClose",
			},
			module = { "nvim-tree.view" },
			requires = "kyazdani42/nvim-web-devicons",
			-- commit = "d8bf1ad",
			config = function()
				require("plugins.nvim-tree")
			end,
		})
		use({
			"sidebar-nvim/sidebar.nvim",
			cmd = { "SidebarNvimClose", "SidebarNvimToggle", "SidebarNvimOpen" },
			module = { "sidebar-nvim" },
			config = function()
				require("plugins.sidebar")
			end,
		})
		use("mrjones2014/smart-splits.nvim")
		-- Keybinds
		use({
			"folke/which-key.nvim",
			config = function()
				require("keybinds")
			end,
		})
		use({ "ggandor/lightspeed.nvim", event = "BufRead" })
		use({
			"matbme/JABS.nvim",
			config = function()
				require("jabs").setup({})
			end,
		})
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("plugins.toggleterm")
			end,
		})
		-- use({
		-- 	"romgrk/barbar.nvim",
		-- 	requires = { "kyazdani42/nvim-web-devicons" },
		-- 	config = function()
		-- 		require("plugins.barbar")
		-- 	end,
		-- })
		-- use({
		-- 	"nvim-neorg/neorg",
		-- 	after = "nvim-treesitter",
		-- 	config = function()
		-- 		require("plugins.neorg")
		-- 	end,
		-- })
		-- use({
		-- 	"vimwiki/vimwiki",
		-- 	disable = false,
		-- 	config = function()
		-- 		vim.g.vimwiki_list = {
		-- 			{ path = "~/Projects/Personal/website/MyNotes", syntax = "markdown", ext = ".md" },
		-- 		}
		-- 	end,
		-- })
		-- use({
		-- 	"andreadev-it/Shade.nvim",
		-- 	config = function()
		-- 		require("shade").setup({
		-- 			overlay_opacity = 50,
		-- 			opacity_step = 1,
		-- 			keys = {
		-- 				brightness_up = "<C-Up>",
		-- 				brightness_down = "<C-Down>",
		-- 				toggle = "<Leader>s",
		-- 			},
		-- 			exclude_filetypes = { "NvimTree", "SidebarNvim", "aerial" }
		-- 		})
		-- 	end,
		-- })
		use({
			"jbyuki/venn.nvim",
		})
		use({
			"stevearc/stickybuf.nvim",
			config = function()
				require("stickybuf").setup({
					buftype = {
						terminal = "bufnr",
					},
				})
			end,
		})
		-- use({
		-- 	"nvim-orgmode/orgmode",
		-- 	config = function()
		-- 		require("plugins._orgmode")
		-- 	end
		-- })
		--Bootstrap packer
		if packer_boostrap then
			require("packer").sync()
		end
	end,
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
require("packer_compiled")
-------------
-- CONFIGS --
-------------

-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "toggleterm" }
-- vim.g.tokyonight_dark_sidebar = true
-- vim.cmd([[colorscheme catppuccin]]) -- Finally, a good fucking theme.

require("settings")

vim.cmd([[colorscheme oh-lucy]])

vim.g["markdown_fenced_languages"] = { "julia", "python", "lua", "tex" }

vim.g.maplocalleader = ","

-- vim.opt.winbar = "%{%v:lua.require'modules.winbar'.eval()%}"

-- vim.opt.cmdheight = 0

-- vim.cmd([[
-- augroup signcol
-- autocmd WinLeave * :set winhighlight=SignColumn:NormalNC
-- autocmd WinEnter * :set winhighlight=SignColumn:Normal
-- ]])

local colors = require("catppuccin.palettes").get_palette()


-- vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = colors.blue, bg = colors.crust })

vim.api.nvim_set_hl(0, "TermNormal", { bg = colors.crust })

-- vim.cmd([[
-- 	autocmd TermOpen * :set winhighlight=Normal:TermNormal,SignColumn:TermNormal,WinBar:TermNormal
-- ]])

vim.cmd([[
	autocmd BufWinEnter * :setlocal winhighlight=Normal:Normal,SignColumn:SignColumn
]])

vim.cmd([[
autocmd BufEnter *SidebarNvim* :set winhighlight=Normal:NvimTreeNormal,SignColumn:NvimTreeNormal | :hi link SidebarNvimNormal NvimTreeNormal
]])

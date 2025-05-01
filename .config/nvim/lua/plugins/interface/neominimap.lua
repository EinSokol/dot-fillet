return {
	"Isrothy/neominimap.nvim",
	version = "v3.x.x",

	lazy = false, -- NOTE: NO NEED to Lazy load
	-- Optional. You can alse set your own keybindings
	keys = {
		-- Global Minimap Controls
		{ "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
		{ "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
		{ "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
		{ "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

		-- Window-Specific Minimap Controls
		{ "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
		{ "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
		{ "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
		{ "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },

		-- Tab-Specific Minimap Controls
		{ "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
		{ "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
		{ "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
		{ "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },

		-- Buffer-Specific Minimap Controls
		{ "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
		{ "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
		{ "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
		{ "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },

		---Focus Controls
		{ "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
		{ "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
		{ "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
	},
	init = function()
		-- The following options are recommended when layout == "float"
		vim.opt.wrap = false
		vim.opt.sidescrolloff = 36 -- Set a large value

		--- Put your configuration here
		vim.g.neominimap = {
			auto_enable = true,

			-- Log level
			log_level = vim.log.levels.OFF,

			-- Notification level
			notification_level = vim.log.levels.INFO, 

			-- Path to the log file
			log_path = vim.fn.stdpath("data") .. "/neominimap.log", 

			-- Minimaps will not be created for buffers of these filetypes
			exclude_filetypes = {
				"help",
				"bigfile", -- For Snacks.nvim
			},

			-- Minimaps will not be created for buffers of these buftypes
			exclude_buftypes = {
				"nofile",
				"nowrite",
				"quickfix",
				"terminal",
				"prompt",
			},

			-- When this function returns false, the minimap will not be created for this buffer.
			buf_filter = function()
				return true
			end,

			-- When this function returns false, the minimap will not be created for this window.
			win_filter = function()
				return true
			end,

			-- When this function returns false, the minimap will not be created for this tab.
			tab_filter = function()
				return true
			end,

			-- How many columns a dot should span
			x_multiplier = 4,

			-- How many rows a dot should span
			y_multiplier = 1,

			buffer = {
				-- When true, the minimap will be recreated when you delete the buffer.
				-- When false, the minimap will be disabled for the current buffer when you delete the minimap buffer.
				persist = true,
			},

			--- Either `split` or `float`
			--- When layout is set to `float`, minimaps will be created in floating windows attached to all suitable windows.
			--- When layout is set to `split`, the minimap will be created in one split window per tab.
			layout = "split",

			--- Used when `layout` is set to `split`
			split = {
				minimap_width = 16,

				-- Always fix the width of the split window
				fix_width = false,

				direction = "right",

				--- Automatically close the split window when it is the last window.
				close_if_last_window = true, 

				--- When true, the split window will be recreated when you close it.
				--- When false, the minimap will be disabled for the current tab when you close the minimap window.
				persist = true,
			},

			--- Used when `layout` is set to `float`
			float = {
				minimap_width = 16, 

				--- If set to nil, there is no maximum height restriction
				--- @type integer
				max_minimap_height = nil,

				margin = {
					right = 0, 
					top = 0, 
					bottom = 0, 
				},
				z_index = 1, 

				--- Border style of the floating window.
				--- Accepts all usual border style options (e.g., "single", "double")
				--- @type string | string[] | [string, string][]
				window_border = vim.fn.has("nvim-0.11") == 1 and vim.opt.winborder:get() or "single",

				-- When true, the floating window will be recreated when you close it.
				-- When false, the minimap will be disabled for the current tab when you close the minimap window.
				persist = true, 
			},

			-- For performance, when text changes, the minimap is refreshed after a certain delay.
			-- Set the delay in milliseconds
			delay = 600, 

			-- Sync the cursor position with the minimap
			sync_cursor = true, 

			click = {
				-- Enable mouse click on the minimap
				enabled = true, 
				-- Automatically switch focus to the minimap when clicked
				auto_switch_focus = true, 
			},

			diagnostic = {
				enabled = true, 

				-- When enabled, diagnostics will be sourced directly from the DiagnosticChanged event,
				-- meaning they will follow the settings from vim.diagnostic.config.
				-- In this mode, the `severity` filter is ignored.
				use_event_diagnostics = false, 

				-- The `severity` option specifies which diagnostics to include based on their severity.
				-- Note: This option is ignored when `use_event_diagnostics` is enabled.
				--
				-- Allowed formats for the `severity` filter:
				-- 1. A single severity level:
				--      eg: severity = vim.diagnostic.severity.WARN
				-- 2. A table with a "min" and/or "max" key:
				--      eg: severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.ERROR }
				-- 3. A list-like table of severity values:
				--      eg: severity = { vim.diagnostic.severity.WARN, vim.diagnostic.severity.ERROR }
				severity = nil, 
				mode = "line", 
				priority = {
					ERROR = 100, 
					WARN = 90, 
					INFO = 80, 
					HINT = 70, 
				},
				icon = {
					ERROR = "󰅚 ", 
					WARN = "󰀪 ", 
					INFO = "󰌶 ", 
					HINT = " ", 
				},
			},

			git = {
				enabled = true, 
				mode = "sign", 
				priority = 6, 
				icon = {
					add = "+ ", 
					change = "~ ", 
					delete = "- ", 
				},
			},

			mini_diff = {
				enabled = false, 
				mode = "sign", 
				priority = 6, 
				icon = {
					add = "+ ", 
					change = "~ ", 
					delete = "- ", 
				},
			},

			search = {
				enabled = false, 
				mode = "line", 
				priority = 20, 
				icon = "󰱽 ", 
			},

			treesitter = {
				enabled = true, 
				priority = 200, 
			},

			mark = {
				enabled = false, 
				mode = "icon", 
				priority = 10, 
				key = "m", 
				show_builtins = false, 
			},

			fold = {
				-- Consider folds when rendering the minimap
				enabled = true,
			},

			--- Override the default window options
			winopt = function(opt, winid) end,

			--- Override the default buffer options
			bufopt = function(opt, bufnr) end,

			handlers = {},
		}
	end,
}

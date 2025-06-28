return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	version = "*",
	opts = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 100, window = { border = "rounded" } },
			menu = { border = "rounded" },
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" }, -- See the fuzzy documentation for more information
	},
	opts_extend = { "sources.default" },
}

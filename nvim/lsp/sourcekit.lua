return {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objc", "objcpp", "c", "cpp" },
	root_dir = function(filename, _)
		local util = require("lspconfig.util")
		return util.root_pattern("buildServer.json")(filename)
			or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
			or util.find_git_ancestor(filename)
			or util.root_pattern("Package.swift")(filename)
	end,
	capabilities = {
		textDocument = {
			diagnostic = {
				dynamicRegistration = true,
				relatedDocumentSupport = true,
			},
		},
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},
}

return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				typeCheckingMode = "basic",
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				inlayHints = {
					callArgumentNames = true,
					variableTypes = true,
					functionReturnTypes = true,
				},
			},
		},
	},
}

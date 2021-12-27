-- https://github.com/Pocco81/DAPInstall.nvim#configuration
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})


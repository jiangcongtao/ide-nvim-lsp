local dap = require('dap')
-- Note: every debugger has its own configurations.
-- Refer to
--  All Debugger: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
--
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/setup-vim/build-neonvim/vscode-node-debug2/out/src/nodeDebug.js'}
}

dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the ---inspec flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
    },
}

dap.configurations.typescript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${workspaceFolder}/index.ts',
        -- preLaunchTask = 'tsc .', -- node2 NO SUPPORT preLaunchTask
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
        outFiles = { "${workspaceFolder}/out/**/*.js"},
    },
}
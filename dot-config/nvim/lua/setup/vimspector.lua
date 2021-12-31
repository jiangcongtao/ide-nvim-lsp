function GotoWindow(id)
  vim.fn.win_gotoid(id)
  vim.cmd("MaximizerToggle")
end

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  -- call vim function from lua
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- call lua function from vim cmd
map("n", "<leader>m", '<cmd>MaximizerToggle<cr>')
map("n", "<leader>dd", '<cmd>call vimspector#Launch()<cr>')
map("n", "<leader>dc", '<cmd>lua GotoWindow(vim.g.vimspector_session_windows.code)<cr>')
map("n", "<leader>dt", '<cmd>lua GotoWindow(vim.g.vimspector_session_windows.tagpage)<cr>')
map("n", "<leader>dv", '<cmd>lua GotoWindow(vim.g.vimspector_session_windows.variables)<cr>')
map("n", "<leader>dw", '<cmd>lua GotoWindow(vim.g.vimspector_session_windows.watches)<cr>')
map("n", "<leader>ds", '<cmd>lua GotoWindow(vim.g.vimspector_session_windows.stack_traces)<cr>')
map("n", "<leader>do", '<cmd>lua GotoWindow(vim.g.vimspector_session_windows.output)<cr>')
map("n", "<leader>de", '<cmd>call vimspector#Reset()<cr>')

map("n", "<leader>dtcb", '<cmd>call vimspector#CleanLineBreakpoint()<cr>')
map("n", "<leader>dl", '<cmd>call vimspector#StepInto()<cr>')
map("n", "<leader>dj", '<cmd>call vimspector#StepOver()<cr>')
map("n", "<leader>dk", '<cmd>call vimspector#StepOut()<cr>')
map("n", "<leader>d_", '<cmd>call vimspector#Restart()<cr>')
map("n", "<leader>d<space>", '<cmd>call vimspector#Continue()<cr>')
map("n", "<leader>drc", '<cmd>call vimspector#RunToCursor()<cr>')
map("n", "<leader>dbp", '<cmd>call vimspector#ToggleBreakpoint()<cr>')
map("n", "<leader>dcbp", '<cmd>call vimspector#ToggleAdvancedBreakpoint()<cr>')

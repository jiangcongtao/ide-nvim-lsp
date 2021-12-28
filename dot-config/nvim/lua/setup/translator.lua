-- 按键映射前缀: <leader>t。
vim.g.translator_window_type = 'popup'                     -- 弹出窗口中显示。
vim.g.translator_target_lang = 'zh'                        -- 目标语言为中文。
vim.g.translator_source_lang = 'auto'                      -- 源语言自动识别。

vim.g.translator_default_engines = {'bing', 'google', 'haici', 'youdao'}

-- Mappings
-- 普通模式下翻译光标下英文字符串，在命令行显示翻译结果。
vim.cmd("nmap <silent> <Leader>tt <Plug>Translate")

-- 可视模式下翻译选中英文字符串，在命令行显示翻译结果。
vim.cmd("vmap <silent> <Leader>tt <Plug>TranslateV")

-- 普通模式下翻译光标下英文字符串，在窗口显示翻译结果。
vim.cmd("nmap <silent> <Leader>tw <Plug>TranslateW")

-- 可视模式下翻译光标下英文字符串，在窗口显示翻译结果。
vim.cmd("vmap <silent> <Leader>tw <Plug>TranslateWV")
local nvim_command = vim.api.nvim_command

local on_attach_proxy= function()
  require'completion'.on_attach()
  -- nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostics.show_line_diagnostics()')
end

require'lspconfig'.ccls.setup{
    on_attach=on_attach_proxy
  }

require'lspconfig'.pyls.setup{
    on_attach=on_attach_proxy
  }

require'lspconfig'.cmake.setup{
    on_attach=on_attach_proxy
  }

require'lspconfig'.sumneko_lua.setup{
  cmd = { "/home/alex/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/alex/.cache/nvim/lspconfig/sumneko_lua/lua-language-server/main.lua" },
}

local nvim_command = vim.api.nvim_command

local on_attach_proxy= function()
  require'completion'.on_attach()
  -- nvim_command('autocmd CursorHold <buffer> lua vim.lsp.diagnostics.show_line_diagnostics()')
end

require'lspconfig'.clangd.setup{
    on_attach=on_attach_proxy
  }

require'lspconfig'.pyls.setup{
    on_attach=on_attach_proxy
  }

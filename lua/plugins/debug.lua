return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        dependencies = {
          'nvim-neotest/nvim-nio',
        }
      },
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      {
        'Joakker/lua-json5',
        -- -- if you're on windows
        -- build = 'powershell ./install.ps1'
        build = './install.sh'
      },
      { 'theHamsta/nvim-dap-virtual-text', opts = {} },
    },
    config = function()
      require 'mason-nvim-dap'.setup {
        automatic_setup = true,
        handlers = {},
        ensure_installed = {
          'codelldb'
        }
      }

      local dapui = require 'dapui'
      dapui.setup()
      local dap = require 'dap'
      dap.adapters.rust = dap.adapters.codelldb

      -- require('dap.ext.vscode').json_decode = require 'json5'.parse
      require('dap.ext.vscode').load_launchjs()

      vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Dap continue' })
      vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Dap step over' })
      vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Dap step into' })
      vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = 'Dap step out' })
      vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end, { desc = 'Toggle [b]reakpoint' })
      vim.keymap.set('n', '<Leader>dB', function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
        { desc = 'Set conditional [B]reakpoint' })
      vim.keymap.set('n', '<Leader>lp',
        function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
        { desc = 'Set [l]ogpoint' })
      vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = 'Open [r]epl' })
      vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = 'run [l]ast' })
      vim.keymap.set('n', '<Leader>dc', function() dap.run_to_cursor() end, { desc = 'Run to [c]ursor' })
      vim.keymap.set('n', "<leader>dd", require("dap").down, { desc = "Go one frame [d]own" })
      vim.keymap.set('n', "<leader>du", require("dap").up, { desc = "Go one frame [u]p" })
      vim.keymap.set('n', "<leader>di", require("dapui").eval, { desc = "Eval cursor location" })
      vim.keymap.set('n', "<leader>dt", require("dapui").toggle, { desc = "Toggle UI" })
      vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        dap.ui.widgets.hover()
      end, { desc = '[d]ap [h]over' })
      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        dap.ui.widgets.preview()
      end, { desc = '[p]review' })
      vim.keymap.set('n', '<Leader>df', function()
        dap.ui.widgets.centered_float(dap.uiwidgets.frames)
      end, { desc = '[f]rames' })
      vim.keymap.set('n', '<Leader>ds', function()
        dap.ui.widgets.centered_float(dap.ui.widgets.scopes)
      end, { desc = '[s]copes' })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#f01000" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#777777" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#1000f0" })

      vim.fn.sign_define('DapBreakpoint',
        { text = '●', texthl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition',
        { text = '■', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected',
        { text = '', texthl = 'DapBreakpoint', numhl = 'DapBreakpointRejected' })
      vim.fn.sign_define('DapLogPoint', { text = '◆', numhl = 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text = '➤', texthl = 'DapStopped', numhl = 'DapStopped' })
    end,

  },
}

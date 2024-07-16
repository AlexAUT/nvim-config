return {
  {
    "stevearc/overseer.nvim",
    event = "BufEnter",
    config = function()
      local overseer = require 'overseer'
      overseer.setup {
        component_aliases = {
          -- Most tasks are initialized with the default components
          default = {
            { "display_duration", detail_level = 2 },
            "on_result_diagnostics_quickfix",
            "on_output_summarize",
            "on_exit_set_status",
            "on_complete_notify",
            "on_complete_dispose",
            {
              "on_output_quickfix",
              items_only = true,
              open_on_match = true,
            },
            "on_result_diagnostics",
            "on_result_diagnostics_quickfix",
          },
          -- Tasks from tasks.json use these components
          default_vscode = {
            "default",
            {
              "on_output_quickfix",
              items_only = true,
              open_on_match = true,
            },
            "on_result_diagnostics",
            "on_result_diagnostics_quickfix",
          },
        },
      }
      vim.keymap.set('n', '<leader>ot', overseer.toggle, { desc = '[O]verseer [T]oggle task pane' })
      vim.keymap.set('n', '<leader>or', overseer.run_template, { desc = '[O]verseer [R]run task' })
      vim.keymap.set('n', '<leader>of', "<CMD>OverseerQuickAction open float<CR>",
        { desc = '[O]verseer open task output in [F]loat window' })
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  {
    'Civitasv/cmake-tools.nvim',
    opts = {
      cmake_executor = {
        name = "overseer",
      },
      cmake_runner = {
        name = "overseer",
      }
    }
  },
}

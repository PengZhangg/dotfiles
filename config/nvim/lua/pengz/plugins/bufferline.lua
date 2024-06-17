return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },
  config = function()
    vim.cmd([[
      augroup MyColors
      autocmd!
      autocmd ColorScheme * highlight BufferLineFill guibg=#2E3440
      autocmd ColorScheme * highlight BufferLineSeparator guifg=#2E3440
      autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=#2E3440
      augroup END
    ]])
    require('bufferline').setup {
      options = {
        mode = "tabs",
        separator_style = "thin",
      },
      highlights = require("nord.plugins.bufferline").akinsho(),
    }
  end
}


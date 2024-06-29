-- ~/.config/nvim/lua/plugins/nvim-notify.lua

return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            max_width = 50,  -- Set the maximum width of notifications
        })
        vim.notify = require("notify")
    end,
}

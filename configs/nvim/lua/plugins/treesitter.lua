return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "c",
                "cpp",
                "java",
                "javascript",
                "lua",
                "markdown",
                "markdown_inline",
                "rust",
                "vim",
                "vimdoc"},
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

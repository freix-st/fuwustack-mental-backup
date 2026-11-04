
return {
    "shrynx/line-numbers.nvim",
    config = function()
        -- mode = "both",
        require("line-numbers").setup({
            format = "rel_abs"
        })
    end
}

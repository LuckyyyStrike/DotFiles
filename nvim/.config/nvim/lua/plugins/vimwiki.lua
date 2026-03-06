return {
    "vimwiki/vimwiki",
    init = function()
        -- Configuration goes in init (before plugin loads), not config
        vim.g.vimwiki_list = {
            {
                path = "~/vimwiki/",
                syntax = "markdown",
                ext = ".md",
            },
        }
        -- Optional: prevent vimwiki from hijacking markdown filetype globally
        vim.g.vimwiki_global_ext = 0
    end,
    keys = {
        { "<leader>ww",         desc = "VimWiki Index" },
        { "<leader>wi",         desc = "VimWiki Diary Index" },
        { "<leader>w<leader>w", desc = "VimWiki Today's Diary" },
    },
}

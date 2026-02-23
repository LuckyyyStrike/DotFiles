return {
  {
    "lervag/vimtex",
    lazy = false, -- Sehr wichtig, VimTeX sollte nicht lazy geladen werden
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      -- Automatisches Öffnen des PDF-Viewers nach dem Kompilieren
      vim.g.vimtex_quickfix_mode = 0
    end,
    init = function()
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-xelatex"
      }
    end
  },
}

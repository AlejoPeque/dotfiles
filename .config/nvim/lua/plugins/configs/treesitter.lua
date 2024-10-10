local options = {
  ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python", "html", "css", "bash" },  -- Añade los lenguajes que necesites

  highlight = {
    enable = true,                        -- Habilita el resaltado de sintaxis
    use_languagetree = true,              -- Usa el árbol de lenguaje para resaltado
    additional_vim_regex_highlighting = true,  -- Habilita el resaltado adicional de Vim
  },

  indent = { enable = true },            -- Habilita la indentación automática

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
    },
  },
}

return options

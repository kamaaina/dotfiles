require 'nvim-treesitter.configs'.setup {
  -- a list of parser names, or "all"
  ensure_installed = {"c", "cpp", "lua", "rust", "ruby", "vim"},

  -- install parser synchronoulsy (only applies to 'ensure_installed')
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

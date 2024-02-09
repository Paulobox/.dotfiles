return{
"lukas-reineke/indent-blankline.nvim",
  lazy = false,
  opts = {
    indent = {
      -- char = "│", --optional
      char = "▏",
      tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        -- "NvimTree", --disabling indent visuals for nvim-tree
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  main = "ibl",
}

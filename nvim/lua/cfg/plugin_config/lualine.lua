require("lualine").setup {
   options = {
      icon_enabled = true,
   },
   sections = {
      lualine_a = {
         {
            'filename',
            path = 1,
         }
      }
   }
}

return {
  {
    "shortcuts-ui", -- Virtual name
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      { 
        "<leader>?", 
        function() 
          require("config.shortcuts_ui").toggle() 
        end, 
        desc = "Shortcuts Cheatsheet" 
      }
    }
  }
}

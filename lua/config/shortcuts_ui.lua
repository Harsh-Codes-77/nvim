local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local M = {}

local popup = nil

-- Define the content of the cheatsheet
local content = {
  "                                                                ",
  "   ██╗  ██╗███████╗██╗   ██╗███████╗                           ",
  "   ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝                           ",
  "   █████╔╝ █████╗   ╚████╔╝ ███████╗                           ",
  "   ██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║                           ",
  "   ██║  ██╗███████╗   ██║   ███████║                           ",
  "   ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝                           ",
  "                                                                ",
  "   [ CORE ]                                                     ",
  "   <Space>       Leader Key                                     ",
  "   <Space>w      Save File                                      ",
  "   <Space>q      Quit                                           ",
  "   jk            Exit Insert Mode                               ",
  "   <Space>nh     Clear Highlights                               ",
  "                                                                ",
  "   [ WINDOWS ]                                                  ",
  "   <Space>sv     Split Vertical                                 ",
  "   <Space>sh     Split Horizontal                               ",
  "   <Space>se     Equalize Splits                                ",
  "   <Space>sx     Close Split                                    ",
  "   Ctrl + Arrows Resize Window                                  ",
  "                                                                ",
  "   [ NAVIGATION ]                                               ",
  "   <Space>e      Toggle File Explorer (Neo-tree)                ",
  "   <Space>ff     Find Files (Telescope)                         ",
  "   <Space>fg     Live Grep (Text)                               ",
  "   <Space>fb     Find Buffers                                   ",
  "                                                                ",
  "   [ CODING ]                                                   ",
  "   K             Hover Documentation                            ",
  "   gd            Go to Definition                               ",
  "   <Space>cm     Mason (Installer)                              ",
  "                                                                ",
  "   [ TABS ]                                                     ",
  "   <Space>to     New Tab                                        ",
  "   <Space>tx     Close Tab                                      ",
  "   <Space>tn     Next Tab                                       ",
  "   <Space>tp     Prev Tab                                       ",
  "                                                                ",
  "   [ UTILS ]                                                    ",
  "   <Space>.      Scratch Buffer                                 ",
  "   <Space>gg     LazyGit                                        ",
  "   <Space>?      Toggle This Cheatsheet                         ",
  "                                                                ",
  "   [ Press 'q' or '<Esc>' to close ]                            ",
}

function M.toggle()
  if popup then
    popup:unmount()
    popup = nil
    return
  end

  popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
      text = {
        top = " CHEATSHEET ",
        top_align = "center",
      },
    },
    position = "50%",
    size = {
      width = 70,
      height = "60%",
    },
    buf_options = {
      modifiables = true,
      readonly = false,
    },
  })

  -- Mount the popup
  popup:mount()

  -- Set Keymap to close
  popup:map("n", "q", function()
    M.toggle()
  end, { noremap = true })
  
  popup:map("n", "<Esc>", function()
    M.toggle()
  end, { noremap = true })

  -- Set content
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, 80, false, content)

  -- Apply syntax highlighting (simple approach)
  -- Highlight keys in blue, descriptions in white, headers in purple
  -- We'll just set the filetype to markdown for basic coloring for now, 
  -- or creating a custom syntax match would be better but markdown is "good enough" for "stylish".
  -- Actually, let's try a custom simple highlights.
  
  vim.api.nvim_buf_set_option(popup.bufnr, "filetype", "markdown")
  
  -- Force unmount on cursor leave if desired (optional)
  popup:on(event.BufLeave, function()
    M.toggle()
  end)
end

return M

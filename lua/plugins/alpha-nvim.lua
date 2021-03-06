--
--         ▀▀█           █                                    ▀
--   ▄▄▄     █    ▄▄▄▄   █ ▄▄    ▄▄▄          ▄ ▄▄   ▄   ▄  ▄▄▄    ▄▄▄▄▄
--  ▀   █    █    █▀ ▀█  █▀  █  ▀   █         █▀  █  ▀▄ ▄▀    █    █ █ █
--  ▄▀▀▀█    █    █   █  █   █  ▄▀▀▀█   ▀▀▀   █   █   █▄█     █    █ █ █
--  ▀▄▄▀█    ▀▄▄  ██▄█▀  █   █  ▀▄▄▀█         █   █    █    ▄▄█▄▄  █ █ █
--                █
--                ▀
--  => lua/plugins/alpha-nvim.lua


-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------


-- local alpha = require 'alpha'

local status_ok, alpha_config = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require 'alpha.themes.dashboard'

-- setup footer
local function footer()
  local datetime = os.date('%Y/%m/%d %H:%M:%S')
  return 'こんいちは ' .. datetime
end


dashboard.section.header.val = {
 "                       ▄                                       ",
 " ▄ ▄▄   ▄▄▄   ▄   ▄  ▄▄█▄▄   ▄ ▄▄   ▄▄▄    ▄▄▄    ▄▄▄    ▄ ▄▄  ",
 " █▀  ▀ ▀   █  ▀▄ ▄▀    █     █▀  ▀ ▀   █  █▀  ▀  █▀  █   █▀  ▀ ",
 " █     ▄▀▀▀█   █▄█     █     █     ▄▀▀▀█  █      █▀▀▀▀   █     ",
 " █     ▀▄▄▀█   ▀█      ▀▄▄   █     ▀▄▄▀█  ▀█▄▄▀  ▀█▄▄▀   █     ",
 "               ▄▀                                              ",
 "              ▀▀                                               ",
 "                        レイトレーサー                         "
}

-- menu
dashboard.section.buttons.val = {
  dashboard.button('e', ' New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('f', ' Find file', ':NvimTreeOpen<CR>'),
  dashboard.button('s', ' Settings', ':e $MYVIMRC<CR>'),
  dashboard.button('u', ' Update plugins', ':PackerUpdate<CR>'),
  dashboard.button('q', ' Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha_config.setup { dashboard.opts }


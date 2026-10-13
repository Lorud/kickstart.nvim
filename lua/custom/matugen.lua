 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#000000', -- Default Background
     base01 = '#1a1206', -- Lighter Background (status bars)
     base02 = '#251c0f', -- Selection Background
     base03 = '#a48d6e', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#dcc3a1', -- Dark Foreground (status bars)
     base05 = '#f2e0ca', -- Default Foreground
     base06 = '#f2e0ca', -- Light Foreground
     base07 = '#f2e0ca', -- Lightest Foreground
     -- Accent colors
     base08 = '#ffb4ab', -- Variables, XML Tags, Errors
     base09 = '#f2bd6e', -- Integers, Constants
     base0A = '#ffb4a9', -- Classes, Search Background
     base0B = '#ffb4a9', -- Strings, Diff Inserted
     base0C = '#f2bd6e', -- Regex, Escape Chars
     base0D = '#ffb4a9', -- Functions, Methods
     base0E = '#ffb4a9', -- Keywords, Storage
     base0F = '#93000a', -- Deprecated, Embedded Tags
   }
 end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['custom.matugen'] = nil
     require('custom.matugen').setup()
   end)
 )

 return M

 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#000000', -- Default Background
     base01 = '#181115', -- Lighter Background (status bars)
     base02 = '#231c1f', -- Selection Background
     base03 = '#a08b93', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#d7c1c8', -- Dark Foreground (status bars)
     base05 = '#eedfe3', -- Default Foreground
     base06 = '#eedfe3', -- Light Foreground
     base07 = '#eedfe3', -- Lightest Foreground
     -- Accent colors
     base08 = '#ffb4ab', -- Variables, XML Tags, Errors
     base09 = '#ffb59a', -- Integers, Constants
     base0A = '#edb8ce', -- Classes, Search Background
     base0B = '#ffafd4', -- Strings, Diff Inserted
     base0C = '#ffb59a', -- Regex, Escape Chars
     base0D = '#ffafd4', -- Functions, Methods
     base0E = '#edb8ce', -- Keywords, Storage
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

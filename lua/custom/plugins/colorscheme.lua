-- Thème par défaut (fallback si Noctalia indisponible)
local function set_default_theme()
  ---@diagnostic disable-next-line: missing-fields
  require('tokyonight').setup {
    styles = { comments = { italic = false } },
  }
  vim.cmd.colorscheme 'tokyonight-night'
end

-- Cas nominal : Linux + Noctalia → thème système via base16
-- (has('unix') est vrai aussi sous macOS, d'où l'exclusion de mac)
local is_linux = vim.fn.has('unix') == 1 and vim.fn.has('mac') ~= 1

if is_linux then
  vim.pack.add { 'https://github.com/RRethy/base16-nvim' }

  local ok, err = pcall(function() require('custom.matugen').setup() end)
  if not ok then
    vim.notify(
      'Thème Noctalia indisponible (' .. tostring(err) .. ') — thème par défaut appliqué.',
      vim.log.levels.WARN
    )
    set_default_theme()
  end
else
  set_default_theme()
end

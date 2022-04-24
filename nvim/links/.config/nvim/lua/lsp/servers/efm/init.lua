local lsp_installer = require('nvim-lsp-installer')

local name = 'efm'
local server_is_found, server = lsp_installer.get_server(name)
if server_is_found and not server:is_installed() then
  print('Installing ' .. name)
  server:install()
end

return function(opts)
  opts.filetypes = {
    'lua',
    'sh',
    'markdown',
    'javascript',
    'typescriptreact',
  }
  opts.init_options = { documentFormatting = true }
  opts.settings = {
    languages = {
      lua = {
        {
          formatCommand = 'stylua -s -',
          formatStdin = true,
        },
      },
      sh = {
        {
          formatCommand = 'shfmt',
          formatStdin = true,
        },
      },
      markdown = {
        {
          formatCommand = 'prettier --stdin-filepath ${INPUT}',
          formatStdin = true,
        },
      },
      javascript = {
        {
          formatCommand = 'prettier --stdin-filepath ${INPUT}',
          formatStdin = true,
        },
      },
      typescriptreact = {
        {
          formatCommand = 'prettier --stdin-filepath ${INPUT}',
          formatStdin = true,
        },
      },
    },
  }
end
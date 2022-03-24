local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  highlight = {
    enable = true
  },
  ensure_installed = {'vim', 'lua', 'c', 'cpp', 'javascript', 'typescript', 'html', 'css', 'scss', 'vue'}
})

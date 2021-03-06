local present, bufferline = pcall(require, 'bufferline')

if not present then
  return
end

vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true })

bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
})

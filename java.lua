local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.git', 'pom.xml'}, {upward = true})[1]),
}
require('jdtls').start_or_attach(config)

vim.api.nvim_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})
vim.api.nvim_command('autocmd BufWritePre *.java lua vim.lsp.buf.format({async = false})')
vim.api.nvim_command('autocmd BufWritePost *.java lua require"jdtls".organize_imports()')

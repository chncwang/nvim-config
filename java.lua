local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.git', 'pom.xml'}, {upward = true})[1]),
}
require('jdtls').start_or_attach(config)

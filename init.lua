local config_path = vim.fn.expand("<sfile>:p:h")
vim.o.runtimepath = vim.o.runtimepath .. "," .. config_path

require("alsi.core")
require("alsi.lazy")

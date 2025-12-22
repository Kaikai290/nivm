return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      --local capabilities = require('blink.cmp').get_lsp_capabilities()


      vim.lsp.config("lua_ls", {
        capabilities = capabilities
      })

      vim.lsp.enable("lua_ls")

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        filetypes = { "cpp", "h" },


--        cmd =  {"clangd query-driver=C:/msys64/ucrt64/bin/g++.exe"}

      })
      vim.lsp.enable("clangd")

      vim.diagnostic.config({
        virtual_text = true
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

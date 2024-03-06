return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- LSP Support
      "neovim/nvim-lspconfig",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "ray-x/lsp_signature.nvim",

      -- Lsp Lines
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

      -- folke dev plugin
      "folke/neodev.nvim",

      -- linter
      "mfussenegger/nvim-lint",

      -- formatter
      "stevearc/conform.nvim",
    },
    config = function()
      -- neodev must be before lsp config
      require("neodev").setup({
        library = {
          enabled = true,
        },
      })

      local lspconfig = require("lspconfig")

      local function on_attach(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>ws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>ca", function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>rr", function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>rn", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("n", "<leader>lr", function()
          vim.diagnostic.reset()
        end, opts)

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
          local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
          local formatters = {}

          for _, c in pairs(clients) do
            if c.server_capabilities.documentFormattingProvider then
              table.insert(formatters, c.name)
            end
          end

          if #formatters > 1 then
            vim.ui.select(formatters, { prompt = "Select a formatter" }, function(_, choice)
              if not choice then
                print("No formatter selected")
                return
              end

              local formatter = formatters[choice]
              vim.lsp.buf.format({ async = true, name = formatter })
            end)
          else
            vim.lsp.buf.format({ async = true, name = formatters[1] })
          end
        end, opts)
      end

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "tsserver", "rust_analyzer", "lua_ls", "clangd" },
        automatic_installation = true,
      })

      local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
      lsp_capabilities = vim.tbl_deep_extend('force', lsp_capabilities, require("cmp_nvim_lsp").default_capabilities())

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = lsp_capabilities,
          })
        end,
        ["lua_ls"] = function()
          local runtime_path = vim.split(package.path, ";")
          table.insert(runtime_path, "lua/?.lua")
          table.insert(runtime_path, "lua/?/init.lua")
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                telemetry = { enable = false },
                runtime = {
                  version = "LuaJIT",
                  path = runtime_path,
                },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.stdpath("config") .. "/lua",
                  },
                },
              },
            },
            on_attach = on_attach,
            lsp_capabilities = lsp_capabilities,
          })
        end,
        ["clangd"] = function()
          lspconfig.clangd.setup({
            cmd = {
              "clangd",
              "--offset-encoding=utf-16",
            },
            on_attach = on_attach,
            capabilities = lsp_capabilities,
          })
        end,
      })

      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Insert }

      cmp.setup({
        sources = {
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip", keyword_length = 2 },
          { name = "buffer", keyword_length = 3 },
        },
        formatting = {
          fields = { "abbr", "menu", "kind" },
          format = function(entry, item)
            local n = entry.source.name
            if n == "nvim_lsp" then
              item.menu = "[LSP]"
            elseif n == "nvim_lua" then
              item.menu = "[nvim]"
            else
              item.menu = string.format("[%s]", n)
            end
            return item
          end,
          expandable_indicator = false,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = function()
            if cmp.visible() then
              cmp.close()
            else
              cmp.complete()
            end
          end,
        }),
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }, {
          { name = "buffer" },
        }),
      })

      require("lsp_lines").setup()
      require("lsp_lines").toggle()
      vim.keymap.set("n", "<leader>ll", require("lsp_lines").toggle)

      require("lsp_signature").setup({
        hint_enable = false,
      })

      require("lint").linters_by_ft = {
        -- markdown = { "markdownlint", "codespell" },
        -- text = { "codespell" },
        -- yaml = { "yamllint" },
        -- sh = { "shellcheck" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          javascript = { { "prettierd", "prettier" }, "rustywind" },
          typescript = { { "prettierd", "prettier" }, "rustywind" },
          bash = { "beautysh" },
          go = { "gofmt", "goimports" },
          rust = { "rustfmt" },
          html = { { "prettierd", "prettier" }, "rustywind" },
          c = { "clang-format" },
          cpp = { "clang-format" },
          json = { "jq" },
          yaml = { { "prettierd", "prettier" } },
          toml = { "taplo" },
          markdown = { "mdformat" },
          css = { { "prettierd", "prettier" }, "rustywind" },
        },
      })

      vim.lsp.buf.format = require("conform").format
    end,
  },
}

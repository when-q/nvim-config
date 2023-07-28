local M = {}
function M.haskell_setup()
  -- defaults
  return require('haskell-tools').start_or_attach {
    tools = {
      -- haskell-tools options
      codeLens = {
        autoRefresh = true,
      },
      hoogle = {
        mode = 'auto',
      },
      hover = {
        stylize_markdown = true,
      },
    },
    hls = {
      on_attach = Lsp_keymap.on_attach,
      capatibilites = Coq.lsp_ensure_capabilities(),
    }
  }
end

function M.lean_setup()
  require('lean').setup
  {
    abbreviations = { builtin = true },
    lsp =
    {
      on_attach = Lsp_keymap.on_attach,
      handlers = Handlers
    },
    infoview = { width = 30 },
    mappings = true,
  }
  vim.api.nvim_create_autocmd('VimResized', { callback = require('lean.infoview').reposition })
end

function M.tex_setup()
  require('texmagic').setup
  {
    engines = {
      lualatex = {
        -- This is *not* one of the defaults, but it can be
        -- called via magic comment if defined here
        executable = "latexmk",
        args = {
          "-pdflua",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-pv",
          "%f"
        },
        isContinuous = true
      }
    }
  }
end

function M.clangd_setup()
  local clangd_defaults = require "lspconfig.server_configurations.clangd"
  local clangd_configs = vim.tbl_deep_extend("force", clangd_defaults["default_config"], {
    -- on_attach = on_attach_16,
    -- on_attach = on_attach,
    cmd = {
      "clangd",
      "-j=4",
      "--background-index",
      "--clang-tidy",
      "--fallback-style=llvm",
      "--all-scopes-completion",
      "--completion-style=detailed",
      "--header-insertion=iwyu",
      "--header-insertion-decorators",
      "--pch-storage=memory",
    },
  })
  require("clangd_extensions").setup {
    server = clangd_configs,
    extensions = {
      -- defaults:
      -- Automatically set inlay hints (type hints)
      autoSetHints = true,
      -- These apply to the default ClangdSetInlayHints command
      inlay_hints = {
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refersh of the inlay hints.
        -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = "CursorHold",
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100,
      },
      ast = {
        -- These are unicode, should be available in any font
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
        highlights = {
          detail = "Comment",
        },
      },
      memory_usage = {
        border = "none",
      },
      symbol_info = {
        border = "none",
      },
    },
  }
end

return M

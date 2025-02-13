-- Load Mason and Mason-LSPConfig
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "clangd", "pyright" } -- Install clangd for C/C++
}

-- Load LSPConfig
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server_name)  -- Auto-setup for all installed LSPs
        lspconfig[server_name].setup({})
    end,
})

local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Jump to the next snippet placeholder
    ['<C-f>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')
      if luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),
    -- Jump to the previous snippet placeholder
    ['<C-b>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
  }),
})
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }),
})

local cmp = require('cmp')

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})


local cmp = require('cmp')

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

local cmp = require('cmp')

cmp.setup({
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = {'menu', 'abbr', 'kind'},

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Super tab
    ['<Tab>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item({behavior = 'select'})
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    -- Super shift tab
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      local luasnip = require('luasnip')

      if cmp.visible() then
        cmp.select_prev_item({behavior = 'select'})
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
  }),
})



local M = {}
function M.lean_setup()
  require('lean').setup
  {
    abbreviations = { builtin = true },
    lsp =
    {
      on_attach = Lsp_keymap.on_attach,
      handlers = Handlers
    },
    infoview = {width = 30},
    mappings = true,
  }
end


function M.tex_setup()
	require('texmagic').setup
	{
		engines = {
		 lualatex = {    -- This is *not* one of the defaults, but it can be
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
return M

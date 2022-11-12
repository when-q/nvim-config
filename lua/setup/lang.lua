local M = {}

-- Some language plugins has its own setup
-- they all go to this file
--[[
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
--]]
return M

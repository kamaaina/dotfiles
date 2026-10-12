-- ==========================================================================
-- Workaround for Neovim 0.12+ Inlay Hint 'col out of range' crash
-- ==========================================================================
local original_set_extmark = vim.api.nvim_buf_set_extmark
vim.api.nvim_buf_set_extmark = function(bufnr, ns_id, line, col, opts)
	local ns_name = vim.api.nvim_get_namespaces()[ns_id]
	if ns_name == "nvim.lsp.inlayhint" or ns_name == "vim.lsp.inlay_hint" then
		local line_count = vim.api.nvim_buf_line_count(bufnr)
		if line >= line_count then
			return nil
		end

		local line_text = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, false)[1]
		if line_text and col > #line_text then
			col = #line_text
		end
	end

	local status, result = pcall(original_set_extmark, bufnr, ns_id, line, col, opts)
	if status then
		return result
	else
		return nil
	end
end
-- ==========================================================================

require("kamaaina.core.keymaps")
require("kamaaina.core.options")

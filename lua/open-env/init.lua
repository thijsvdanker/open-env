local M = {}

function M.setup(opts)
	opts = opts or {}
	print("setup called")
end

function M.open_env()
	-- Use Neovim's built-in command to find the git root
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse --show-toplevel")[1]

	-- Check if the command was successful
	if vim.v.shell_error == 0 then
		-- Determine which file to open based on the git root
		if string.find(git_root, "regiweb") then
			vim.cmd("edit .env.dev.regiweb.haven")
		elseif string.find(git_root, "extranet") then
			vim.cmd("edit .env.dev.extranet.haven")
		else
			vim.cmd("edit .env")
			print("Unknown git root: " .. git_root)
		end
	end
end

return M

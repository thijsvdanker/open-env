vim.api.nvim_create_user_command("OpenEnv", function()
	require("open-env").open_env()
end, {})

-- Bind <leader>oe to the command
vim.api.nvim_set_keymap("n", "<leader>oe", ":OpenEnv<CR>", { noremap = true, silent = true, desc = "Open .env file" })

local M = {}

function M.toggle_window(token_address)
  -- local buf = vim.api.nvim_create_buf(false, true)
  -- local win = vim.api.nvim_open_win(buf, true, {
  --   relative = "editor",
  --   width = 40,
  --   height = 10,
  --   row = 10,
  --   col = 10,
  --   style = "minimal",
  -- })

  -- local lines = {
  --     "Token Address:",
  --       token_address,
  -- }

  -- vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  print("Token Address: " .. token_address)
end

return M

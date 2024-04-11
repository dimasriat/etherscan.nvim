local Ui = require("evm.ui")

local function key(k)
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes(k, true, false, true),
        "x",
        true
    )
end

describe("Ui", function()
    describe("toggle_ui", function()
        it("should toggle the window and buffer", function()
            local ui = Ui.new()

            ui:toggle_ui({})

            local window_id = ui:get_window_id()
            local buffer_id = ui:get_buffer_id()

            assert.are.same(vim.api.nvim_win_is_valid(window_id), true)
            assert.are.same(vim.api.nvim_buf_is_valid(buffer_id), true)
            assert.are.same(ui:get_is_window_open(), true)

            ui:toggle_ui({})

            assert.are.same(vim.api.nvim_win_is_valid(window_id), false)
            assert.are.same(vim.api.nvim_buf_is_valid(buffer_id), false)
            assert.are.same(ui:get_is_window_open(), false)
        end)

        it("should close when key pressed `q`", function()
            local ui = Ui.new()

            ui:toggle_ui({})

            local window_id = ui:get_window_id()
            local buffer_id = ui:get_buffer_id()

            assert.are.same(vim.api.nvim_win_is_valid(window_id), true)
            assert.are.same(vim.api.nvim_buf_is_valid(buffer_id), true)
            assert.are.same(ui:get_is_window_open(), true)

            -- press q
            key("q")

            assert.are.same(vim.api.nvim_win_is_valid(window_id), false)
            assert.are.same(vim.api.nvim_buf_is_valid(buffer_id), false)
            assert.are.same(ui:get_is_window_open(), false)
        end)

        it("should close when key pressed `esc`", function()
            local ui = Ui.new()

            ui:toggle_ui({})

            local window_id = ui:get_window_id()
            local buffer_id = ui:get_buffer_id()

            assert.are.same(vim.api.nvim_win_is_valid(window_id), true)
            assert.are.same(vim.api.nvim_buf_is_valid(buffer_id), true)
            assert.are.same(ui:get_is_window_open(), true)

            -- press esc
            key("<esc>")

            assert.are.same(vim.api.nvim_win_is_valid(window_id), false)
            assert.are.same(vim.api.nvim_buf_is_valid(buffer_id), false)
            assert.are.same(ui:get_is_window_open(), false)
        end)

        it("should close when type :q", function()
            local ui = Ui.new()

            ui:toggle_ui({})

            local window_id = ui:get_window_id()
            local buffer_id = ui:get_buffer_id()

            assert.are.same(vim.api.nvim_win_is_valid(window_id), true)
            assert.are.same(vim.api.nvim_buf_is_valid(buffer_id), true)
            assert.are.same(ui:get_is_window_open(), true)

            -- type :q
            -- simulate autocmd ExitPre
            vim.api.nvim_command("doautocmd ExitPre")

            assert.are.same(vim.api.nvim_win_is_valid(window_id), false)
            assert.are.same(vim.api.nvim_buf_is_valid(buffer_id), false)
            assert.are.same(ui:get_is_window_open(), false)
        end)
    end)
end)


local Ui = require('evm.ui')

local Evm = {}
Evm.__index = Evm

function Evm:new()
    local ui = Ui.new()
    local opts = {
        title = "Arbitrum",
    }
    local props = {
        ui = ui,
        opts = opts
    }
    local evm = setmetatable(props, self)
    return evm
end

function Evm:toggle_ui(line)
    local lines = {
        line,
        "",
    }

    self.ui:toggle_ui({
        title = self.opts.title,
        lines = lines,
        height = #lines,
    })

    -- move cursor to the next line
    vim.cmd('norm! G')
end

function Evm:setup(opts)
    self.opts = vim.tbl_deep_extend("force", self.opts, opts)
end

local evm  = Evm:new()

return evm

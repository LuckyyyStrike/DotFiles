local dap_python = require("dap-python")
dap_python.setup("python")   -- path to your python executable
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Debug Current File",
        program = "${file}",           -- current file
        console = "externalTerminal" -- output goes to a terminal split
    },

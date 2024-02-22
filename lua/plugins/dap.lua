return {
    'mfussenegger/nvim-dap',
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { 'williamboman/mason.nvim', 'mfussenegger/nvim-dap' },
        opts = {
            ensure_installed = { 'cppdbg' },
            handlers = {
                function(config)
                    require('mason-nvim-dap').default_setup(config)
                end,
                cppdbg = function(config)
                    config.configurations = {
                        {
                            name = "Debug tests",
                            type = "cppdbg",
                            request = "launch",
                            program = function()
                                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                            end,
                            cwd = '${workspaceFolder}',
                            MIMode = 'lldb',
                            args = { '--gtest_filter=B5_600_300*' },
                            stopAtEntry = true,
                        },
                    }
                    require('mason-nvim-dap').default_setup(config)
                end
            }
        }
    },
    {
        'rcarriga/nvim-dap-ui',
        main = 'dapui',
        dependencies = { 'mfussenegger/nvim-dap' },
        opts = {}
    }
}

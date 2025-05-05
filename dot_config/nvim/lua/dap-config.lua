local dap   = require('dap')
local dapui = require('dapui')

-- Adapter för .NET
dap.adapters.coreclr = {
  type    = 'executable',
  command = 'netcoredbg',   -- se till att netcoredbg är i PATH
  args    = { '--interpreter=vscode' },
}

-- Launch-konfiguration för console eller web-api
dap.configurations.cs = {
  {
    type        = 'coreclr',
    name        = 'Launch .NET 9',
    request     = 'launch',
    program     = function()
      local cwd     = vim.fn.getcwd()
      -- Anpassa "MyApp.dll" till ditt projektnamn, eller navigera fritt
      local default = cwd .. '/bin/Debug/net9.0/'
      return vim.fn.input('Path to DLL: ', default, 'file')
    end,
    cwd         = vim.fn.getcwd(),
    stopAtEntry = false,
    args        = {},  -- CLI-args om du vill
  },
  {
    -- Attach-konfiguration
    type      = 'coreclr',
    name      = 'Attach to .NET Process',
    request   = 'attach',
    processId = require('dap.utils').pick_process,
    cwd       = vim.fn.getcwd(),
  },
}

-- DAP-UI: öppna/stäng automatiskt
dapui.setup()
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated ['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited     ['dapui_config'] = function() dapui.close() end


return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local x = opts.sections.lualine_x

    -- Add mini.diff custom source
    for _, comp in ipairs(x) do
      if comp[1] == "diff" then
        comp.source = function()
          local summary = vim.b.minidiff_summary
          return summary
            and {
              added = summary.add,
              modified = summary.change,
              removed = summary.delete,
            }
        end
        break
      end
    end

    -- Add Python virtualenv display
    local actived_venv = function()
      local venv_name = require("venv-selector").get_active_venv()
      if venv_name ~= nil then
        return vim.fn.fnamemodify(venv_name, ":t") -- string.gsub(venv_name, ".*/.*conda3/envs/", "(conda) ")
      else
        return ""
      end
    end
    table.insert(x, {
      function()
        local venv = actived_venv() -- vim.env.VIRTUAL_ENV
        if not venv then
          return ""
        end
        return "   " .. venv -- vim.fn.fnamemodify(venv, ":t") -- shows basename
      end,
      cond = function()
        return vim.bo.filetype == "python"
      end,
      color = { fg = "#98c379" }, -- green color
    })
  end,
}

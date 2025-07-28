return {
  -- Bluloco Light 主题配置
  {
    "uloco/bluloco.nvim",
    lazy = false, -- 确保启动时就加载主题
    priority = 1000, -- 高优先级，确保在其他插件之前设置颜色
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      -- ****** 这是关键部分 ******
      -- 将主题风格设置为 'light'
      require("bluloco").setup({
        style = "light", -- "auto" | "dark" | "light"
        transparent = false,
        italics = false,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
        rainbow_headings = false, -- if you want different colored headings for each heading level
      })

      vim.opt.termguicolors = true
      vim.cmd("colorscheme bluloco")
      -- 应用主题
    end,
  },
}

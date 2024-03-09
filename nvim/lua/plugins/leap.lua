return {
  'ggandor/leap.nvim',
  config = function()
    local leap = require('leap')

    -- add_default_mappings (but with f/F instead of s/S)
    for _, _1_ in ipairs({ { { "n", "x", "o" }, "f", "<Plug>(leap-forward-to)", "Leap forward to" }, { { "n", "x", "o" },
      "F", "<Plug>(leap-backward-to)", "Leap backward to" }, { { "x", "o" }, "x", "<Plug>(leap-forward-till)",
      "Leap forward till" }, { { "x", "o" }, "X", "<Plug>(leap-backward-till)", "Leap backward till" }, { { "n", "x", "o" },
      "gs", "<Plug>(leap-from-window)", "Leap from window" }, { { "n", "x", "o" }, "gs", "<Plug>(leap-cross-window)",
      "Leap from window" } }) do
      local _each_2_ = _1_
      local modes = _each_2_[1]
      local lhs = _each_2_[2]
      local rhs = _each_2_[3]
      local desc = _each_2_[4]
      for _0, mode in ipairs(modes) do
        if ((vim.fn.mapcheck(lhs, mode) == "") and (vim.fn.hasmapto(rhs, mode) == 0)) then
          vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
        end
      end
    end
  end
}

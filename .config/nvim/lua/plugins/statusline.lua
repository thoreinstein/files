local gl = require("galaxyline")
local gls = gl.section
local icons = require("nvim-web-devicons")
local condition = require("galaxyline.condition")
local colors = {
  gray = "#4b5263",
  red = "#FF0000",
  yellow = "#FFCC00",
  green = "#00FF00",
}

gl.short_line_list = {'NvimTree'}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[1] = {
  ViMode = {
    provider = function()
      local mode = {
        n = {color = "String", icon = "N"},
        i = {color = "Function", icon = "I"},
        v = {color = "Conditional", icon = "V"},
        V = {color = "Conditional", icon = "V"},
        [""] = {color = "Conditional", icon = "V"},
        c = {color = "Keyword", icon = "C"},
        ['!'] = {color = "Keyword", icon = "c"},
        R = {color = "Keyword", icon = "R"},
        r = {color = "Keyword", icon = "R"},
      }
      vim.api.nvim_command("hi link GalaxyViMode " .. mode[vim.fn.mode()].color)
      if mode[vim.fn.mode()].icon ~= nil then
        return "    " .. mode[vim.fn.mode()].icon
      end
    end,
    separator = "  ",
    condition = condition.hide_in_width
  }
}
gls.left[2] = {
  FileName = {
    provider = function()
      local fname = require("galaxyline.provider_fileinfo").get_current_file_name("*", "")

      if (require("galaxyline.condition").check_git_workspace()) then
        local git_dir = require("galaxyline.provider_vcs").get_git_dir(vim.fn.expand("%:p"))
        local current_dir = vim.fn.expand("%:p:h")
        if git_dir == current_dir .. "/.git" or git_dir == nil then
          return fname
        end
        local get_path_from_git_root = current_dir:sub(#git_dir - 3)
        return get_path_from_git_root .. "/" .. fname
      end
      return fname
    end,
    condition = condition.hide_in_width or condition.buffer_not_empty
  }
}
gls.left[3] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return " " .. dir_name .. " "
        end,
    }
}
gls.left[4] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "",
        highlight = {colors.red},
    }
}
gls.left[5] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow}
    }
}
gls.right[1] = {
lsp_status = {
    provider = function()
        local clients = vim.lsp.get_active_clients()
          if next(clients) ~= nil then
              return " " .. "  " .. " LSP "
          else
              return ""
          end
      end,
  }
}
gls.right[2] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.hide_in_width or condition.buffer_not_empty,
    separator = " ",
  }
}
gls.right[3] = {
  FileTypeName = {
    provider = function()
      return vim.bo.filetype
    end,
    condition = condition.hide_in_width or condition.buffer_not_empty,
  }
}
gls.right[4] = {
  GitBranch = {
    provider = "GitBranch",
    icon = "",
    separator = "  ",
    condition = require("galaxyline.condition").check_git_workspace and condition.hide_in_width,
  }
}
gls.right[5] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
}
gls.right[6] = {
  EndGap = {
    provider = function()
      return ''
    end,
    condition = condition.hide_in_width,
    separator = ' ',
  }
}

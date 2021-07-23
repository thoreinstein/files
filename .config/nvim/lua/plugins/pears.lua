require "pears".setup(function (conf)
    conf.on_enter(function (pears_handle)
        if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= 1 then
            return vim.fn["completion_confirm_completion"]("<CR>")
        else
            pears_handle()
        end
    end)
end)


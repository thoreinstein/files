require 'options'

local janders223_modules = {
    'pluginlist',
    'theme',
    'mappings'
}

local async
async =
    vim.loop.new_async(
    vim.schedule_wrap(
        function()
            for i = 1, #janders223_modules, 1 do
                local ok, res = xpcall(require, debug.traceback, janders223_modules[i])
                if not (ok) then
                    print("Error loading module : " .. janders223_modules[i])
                    print(res)
                end
            end
            async:close()
        end
    )
)
async:send()


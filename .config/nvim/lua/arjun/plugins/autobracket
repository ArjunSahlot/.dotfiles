return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            local autopairs = require 'nvim-autopairs'
            local Rule = require 'nvim-autopairs.rule'
            local cond = require 'nvim-autopairs.conds'

            autopairs.setup({ fast_wrap = {} })


            local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }

            -- RULE --
            -- add spaces between brackets
            -- (|) -> ' ' -> ( | )
            -- ( | ) -> ) -> (  )|
            -- autopairs.add_rule(
            --     Rule(' ', ' ')
            --         :with_pair(function(opts)
            --             local pair = opts.line:sub(opts.col - 1, opts.col)
            --             return vim.tbl_contains({
            --                 brackets[1][1] .. brackets[1][2],
            --                 brackets[2][1] .. brackets[2][2],
            --                 brackets[3][1] .. brackets[3][2]
            --             }, pair)
            --         end)
            --         :with_move(cond.none())
            --         :with_cr(cond.none())
            --         :with_del(function(opts)
            --             local col = vim.api.nvim_win_get_cursor(0)[2]
            --             local context = opts.line:sub(col - 1, col + 2)
            --             return vim.tbl_contains({
            --                 brackets[1][1] .. '  ' .. brackets[1][2],
            --                 brackets[2][1] .. '  ' .. brackets[2][2],
            --                 brackets[3][1] .. '  ' .. brackets[3][2]
            --             }, context)
            --         end)
            -- )
            -- for _, bracket in pairs(brackets) do
            --     autopairs.add_rule(
            --         Rule(bracket[1] .. ' ', ' ' .. bracket[2])
            --             :with_pair(cond.none())
            --             :with_move(function(opts) return opts.char == bracket[2] end)
            --             :with_del(cond.none())
            --             :use_key(bracket[2])
            --             :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
            --     )
            -- end

            -- RULE --
            -- move past commas/semicolons
            -- (|,) -> , -> (,|)
            -- (|;) -> ; -> (;|)
            for _, punct in pairs { ",", ";" } do
                autopairs.add_rule(
                   Rule("", punct)
                        :with_move(function(opts) return opts.char == punct end)
                        :with_pair(function() return false end)
                        :with_del(function() return false end)
                        :with_cr(function() return false end)
                        :use_key(punct)
                )
            end

            -- RULE --
            -- add ending bracket for all open brackets
            -- before:
            -- (function () { <ENTER>
            -- after:
            -- (function () {
            --     |
            -- })
            local get_closing_for_line = function(line)
                local i = -1 or nil
                local clo = ''

                while true do
                    i, _ = string.find(line, "[%(%)%{%}%[%]]", i + 1)
                    if i == nil then break end
                    local ch = string.sub(line, i, i)
                    local st = string.sub(clo, 1, 1)

                    if ch == '{' then
                        clo = '}' .. clo
                    elseif ch == '}' then
                        if st ~= '}' then return '' end
                        clo = string.sub(clo, 2)
                    elseif ch == '(' then
                        clo = ')' .. clo
                    elseif ch == ')' then
                        if st ~= ')' then return '' end
                        clo = string.sub(clo, 2)
                    elseif ch == '[' then
                        clo = ']' .. clo
                    elseif ch == ']' then
                        if st ~= ']' then return '' end
                        clo = string.sub(clo, 2)
                    end
                end

                return clo
            end

            autopairs.remove_rule('(')
            autopairs.remove_rule('{')
            autopairs.remove_rule('[')

            autopairs.add_rule(
                Rule("[%(%{%[]", "")
                    :use_regex(true)
                    :replace_endpair(function(opts)
                        return get_closing_for_line(opts.line)
                    end)
                    :end_wise(function(opts)
                        return get_closing_for_line(opts.line) ~= ""
                    end)
            )
        end
    }
}

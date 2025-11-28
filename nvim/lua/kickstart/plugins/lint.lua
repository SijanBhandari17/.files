return {

  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    config = function()
      local lint = require 'lint'

      -- Configure eslint_d for better error handling
      lint.linters.eslint_d = {
        cmd = 'eslint_d',
        stdin = true,
        args = {
          '--format',
          'json',
          '--stdin',
          '--stdin-filename',
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
        ignore_exitcode = true,
        parser = function(output, bufnr)
          if not output or output == '' then
            return {}
          end

          local diagnostics = {}
          local ok, decoded = pcall(vim.json.decode, output)
          if not ok then
            -- If we can't parse JSON, check if it's the "config not found" error
            if output:match 'Could not find config file' then
              vim.notify('ESLint: No configuration file found. Using default linting.', vim.log.levels.WARN)
              return {}
            end
            -- Other parsing error
            vim.notify('ESLint parsing error: ' .. output, vim.log.levels.ERROR)
            return {}
          end

          -- Process normal ESLint JSON output
          if decoded and decoded[1] and decoded[1].messages then
            for _, message in ipairs(decoded[1].messages) do
              table.insert(diagnostics, {
                lnum = message.line - 1,
                col = message.column - 1,
                end_lnum = message.endLine and (message.endLine - 1) or nil,
                end_col = message.endColumn and (message.endColumn - 1) or nil,
                severity = message.severity == 1 and vim.diagnostic.severity.WARN or vim.diagnostic.severity.ERROR,
                message = message.message,
                code = message.ruleId,
                source = 'eslint',
              })
            end
          end

          return diagnostics
        end,
      }

      lint.linters_by_ft = {
        -- javascript = { 'eslint_d' },
        -- typescript = { 'eslint_d' },
        -- javascriptreact = { 'eslint_d' },
        -- typescriptreact = { 'eslint_d' },
      }

      -- Function to handle linting with better error handling
      local function try_lint()
        local ft = vim.bo.filetype
        -- Only try to lint if we have a linter for this filetype
        if lint.linters_by_ft[ft] then
          lint.try_lint()
        end
      end

      -- Setup autocommands for running the linter
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('NvimLint', { clear = true }),
        callback = function()
          try_lint()
        end,
      })
    end,
  },
}

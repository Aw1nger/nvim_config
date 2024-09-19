require "nvchad.mappings"

-- Добавляем свои маппинги
local map = vim.keymap.set

-- Маппинг для перехода в командный режим
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "qq", function()
  local buf_count = #vim.fn.getbufinfo { buflisted = 1 } -- Считаем количество открытых буферов

  if buf_count > 1 then
    vim.cmd "w" -- Сохраняем файл
    vim.cmd "bnext" -- Переключаемся на следующий буфер
    vim.cmd "bd#" -- Закрываем текущий буфер
  else
    vim.cmd "w" -- Сохраняем файл
    vim.cmd "bd" -- Закрываем последний буфер
  end
end, { noremap = true, silent = true, desc = "Save and close current buffer" })

-- Быстрый выход из режима вставки через jk
map("i", "jk", "<ESC>")

-- Форматирование по Ctrl+Alt+L
map("n", "<C-A-l>", function()
  vim.lsp.buf.format { async = true }
end, { noremap = true, silent = true, desc = "Format code" })

-- Code actions по leader+qf
map("n", "<A-Enter>", function()
  vim.lsp.buf.code_action()
end, { noremap = true, silent = true, desc = "Quickfix" })

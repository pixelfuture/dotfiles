local keymap = vim.keymap
keymap.set("n", "[d", function() vim.cmd("Lspsaga diagnostic_jump_prev") end, { desc = "Go to previous diagnostic message" })
keymap.set("n", "]d", function() vim.cmd("Lspsaga diagnostic_jump_next") end, { desc = "Go to next diagnostic message" })
keymap.set("n", "<Leader>t", function() vim.cmd("Lspsaga term_toggle") end, { desc = "[T]erminal Toggle" })
keymap.set("n", "gr", function () vim.cmd("Lspsaga finder") end, { desc = "[G]oto [R]eferences" })
keymap.set("n", "<Leader>ca", function () vim.cmd("Lspsaga code_action") end, { desc =  "[C]ode [A]ction" })

-- keymap.set("n", "<Leader>d", function () vim.cmd("Lspsaga code_action") end, { desc = "Open floating [d]iagnostic message" })

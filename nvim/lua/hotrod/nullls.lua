local nullls_status, nullls = pcall(require, "null-ls")
if not nullls_status then
  return
end

nullls.setup({
    sources = {
        nullls.builtins.formatting.prettier,
        nullls.builtins.formatting.stylua,
        nullls.builtins.diagnostics.eslint,
        nullls.builtins.completion.spell,
    },
})

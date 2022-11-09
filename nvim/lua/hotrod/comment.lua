local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end
comment.setup({
  -- adds support for jsx comments
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

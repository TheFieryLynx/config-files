return {
  'numToStr/Comment.nvim',
  config = function()
    local comment = require("Comment")
    comment.setup( {
        options = {
          padding = true,
        }
      }
    )
  end
}

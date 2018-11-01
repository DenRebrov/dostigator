module CommentsHelper
  def resize_tree(level)
    if level > 6
      margin = 240
    else
      margin = 40 * level
    end

    margin
  end
end

class PolyTreeNode
  attr_reader :parent, :children, :value


def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(other_node)
    previous_parent = @parent
    @parent = other_node

    previous_parent.children.delete(self) if previous_parent

    return if other_node.nil?
    other_node.children << self unless other_node.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if children.include?(child_node)
      child_node.parent = nil
    else
      raise "that's not your child!"
    end
  end

  def dfs(target)
    return self if value == target

    children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      first_node = queue.shift
      return first_node if first_node.value == target
      queue.concat(first_node.children)
    end
    nil
  end

end

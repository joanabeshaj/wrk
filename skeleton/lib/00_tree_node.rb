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

    unless previous_parent.nil?
      previous_parent.children.delete(self)
    end

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

end

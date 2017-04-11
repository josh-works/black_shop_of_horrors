class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def items
    contents.keys.map do |id|
      Item.find(id)
    end
  end

  def delete(key)
    if contents[key.to_s] > 1
      contents[key.to_s] = (contents[key.to_s] - 1)
    else
      contents.delete(key.to_s)
    end
  end
end

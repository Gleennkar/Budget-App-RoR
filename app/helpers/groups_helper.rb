module GroupsHelper
  def group_total(group)
    group.contracts.sum(:amount)
  end
end

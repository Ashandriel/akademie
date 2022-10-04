module OwnerHelper
  def owner?(object)
    current_user == object.author
  end
end

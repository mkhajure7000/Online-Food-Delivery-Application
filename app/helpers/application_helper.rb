module ApplicationHelper

  def get_address
    all_address = []
    current_user.addresses.each do |address|
      add = address.area + ", " +  address.city + ", " + address.state + ",   Pin.- " +  address.pincode
      all_address << add
    end
    return all_address
  end

end

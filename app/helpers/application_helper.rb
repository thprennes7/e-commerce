module ApplicationHelper

	def check_access_authorization(user)
		unless is_current_user?(user)
			redirect_to root_path
			flash[:danger] = "Accès non-autorisé"
		end
	end

	def is_current_user?(user)
		current_user == user
	end

	def is_admin?(user)
		if user_signed_in?
			user.admin == true
		end
	end

	def total_price(items)
		i = 0.0
		items.each do |item|
			i += item.item.price
		end
		i
	end

	def items_array(items)
		cart_array = Array.new
		items.each do |cart_item|
      id = cart_item.item.id
      
      if cart_array.any?
        # some condition and iterations to check if we have already the item in ur array to have quantity, x is an iterrator, and y will refer to the index
        x = 0
        y = 0
        cart_array.each_with_index do |item, index|
          if item[:id] == id
            x = 1
            y = index
          end
        end
        if x == 1
          cart_array[y][:qty] += 1
        else
          cart_array << {id: id, title: cart_item.item.title, price: cart_item.item.price, qty: 1}  
        end
      else
        cart_array << {id: id, title: cart_item.item.title, price: cart_item.item.price, qty: 1}
      end
    end
    cart_array
	end

	def class_for_flash(type)
  	case type
    	when 'notice' then "info"
    	when 'success' then "success"
    	when 'danger' then "danger"
    	when 'alert' then "warning"
  	end
	end
end

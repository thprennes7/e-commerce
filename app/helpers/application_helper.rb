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
		user.admin == true
	end

	def total_price(items)
		i = 0.0
		items.each do |item|
			i += item.price * item.quantity
		end
		i * 100
	end
end

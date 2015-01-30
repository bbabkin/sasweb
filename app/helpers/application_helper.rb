module ApplicationHelper
		def is_admin?
		return_current_user.try(:admin?)
		end
end


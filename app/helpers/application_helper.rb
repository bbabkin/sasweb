
module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages',
      :locals => {:object => object})
  end

	def is_admin?
		return_current_user.try(:admin?)
	end

end

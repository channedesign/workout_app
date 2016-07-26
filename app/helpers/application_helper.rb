module ApplicationHelper

	def bootstrap_flash_for(type)
		if type == 'notice'
			'success'
		else
			'danger'
		end
	end

end

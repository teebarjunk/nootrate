class Subject < ActiveRecord::Base
	delegate :url_helpers, to: 'Rails.application.routes'
	has_many :rating
	
	def link
		"<a class='subject' href='#{url_helpers.subject_path(self)}' title='subject'>#{self.name}</a>".html_safe
	end

	def date
		created_at.strftime("%B %d, %Y")
	end
	
	def to_param
		safe_name
	end
end

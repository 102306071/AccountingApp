class Account < ActiveRecord::Base

	def self.dashboard
		data=Account.select("title,sum(expense) as total").group("title")
		data.map{|d|[d.title,d.total]}
	end
end

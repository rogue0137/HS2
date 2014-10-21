class PagesController < ApplicationController
  
  def home
  end

  def dashboard
	end 

	def resource_name
		:user
	end

	def createuser
	end

	def manageuser
	end

def resource
@resource ||= User.new
end

def devise_mapping
@devise_mapping ||= Devise.mappings[:user]
end
end


class Lecture < ActiveResource::Base
  self.site = ENV["AR_SITE_LECTURE"]
  self.user = ENV["AR_USER_LOGIN"]
  self.password = ENV["AR_USER_PASSWORD"]
end
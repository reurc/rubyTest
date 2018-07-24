require 'date'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    currentTime = Time.now.utc
    render html: "hello, Jeannine! the time is now #{currentTime.hour}:#{currentTime.min} "
  end
end

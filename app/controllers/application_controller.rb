class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #sessionヘルパーを全体で使用できるように読み込む
  include SessionsHelper
end

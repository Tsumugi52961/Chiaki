require 'rufus-scheduler'
require "#{Rails.root}/lib/bgm_noti.rb"

s = Rufus::Scheduler.singleton

s.every '30m' do
  GetBangumis.call
end

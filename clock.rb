require './config/boot'
require './config/environment'
require 'clockwork'
require 'active_support/time'

#This is the scheduler for data fetching from AWS API which would run every day at 11:00 pm
Clockwork.every(1.day, 'AwsFetchData.Schedule', at: '23:00') do
  AwsDataFetchWorker.perform_async
end

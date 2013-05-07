# *******************************************
# This is a demo file to show usage.
#
# @package FellowshipOneAPI
# @authors Wes Hays <weshays@gbdev.com>
# ******************************************* 

require 'debugger'

require File.dirname(__FILE__) + '/../lib/fellowship_one.rb'

require File.dirname(__FILE__) + '/f1_keys.rb'

FellowshipOne::Api.connect(F1Keys::CHURCH_CODE, 
                           F1Keys::CONSUMER_KEY, 
                           F1Keys::CONSUMER_SECRET, 
                           F1Keys::OAUTH_TOKEN, 
                           F1Keys::OAUTH_SECRET, 
                           F1Keys::IS_PRODUCTION)

start_date = "2013-04-01"
end_date = "2013-04-21"
contribution_list = FellowshipOne::Search.search_for_contributions_by_date(start_date, end_date)

contribution_list.each do |contribution|
  # Info to use
  # contribution.household_id
  # contribution.amount_cents
  # contribution.received_date
  # contribution.fund['name']

  household_info = FellowshipOne::Household.load_by_id( contribution.household_id )

  people_list = FellowshipOne::Search.search_for_person_by_name( household_info.household_sort_name)
  
  people_in_household = people_list.collect { |person| household_info.id == person.household_id ? person : nil }.compact

  person = people_in_household[0]
 
  # Info to use
  # person.id 
  # person.household_id
  # person.first_name
  # person.last_name
  # person.gender
  # person.date_of_birth
  # person.marital_status
  # person.addresses
  # person.communications #phone numbers

end

# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    when /^the LumsScheduler home page/
      '/login'
    when /^the main user page for "(.*)"$/i
      id = User.find_by_name($1).id
      '/users/#{id}/displayUsers'
    when /^the user home page for "(.*)"$/i
      user_path User.find_by_name($1).id
    when /^the Add new Events page/
      '/users/1/events/new'
    when /^the Event details  page/
      'users/1/events/2'
    when /^the display users page/
      '/users/1/displayUsers'
    when /^the find free slots page/
      '/users/1/showFriend/Irtaza%20Safi'
       #'/users/3/showFriend/Usman%20Nadeem'
    when /^the view free slots page/
      '/users/1/setMeeting/Irtaza%20Safi'
      #'/users/3/setMeeting/Usman%20Nadeem'
    when /^the user details page/
      '/users/3/view'
      
      
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

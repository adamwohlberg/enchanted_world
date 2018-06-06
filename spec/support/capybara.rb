# Capybara.asset_host = 'http://localhost:3000'
# Capybara.register_driver :selenium_chrome do |app|
#   prefs = {"profile.managed_default_content_settings.notifications" => 2,}
#   caps = Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: { prefs: prefs })
#
#   Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
# end
Capybara.javascript_driver = :selenium_chrome
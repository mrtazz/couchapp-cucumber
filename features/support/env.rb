require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'yaml'
require 'features/support/couchdb_helpers'

env = File.open('features/support/database.yml') { |yf| YAML::load yf  }["test"]

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

Capybara.default_driver = :selenium
Capybara.app_host = "http://#{env['host']}:#{env['port']}/#{env['database']}/_design/couchapp/_rewrite"
World(Capybara)

# change auth db before testing
Before do
  helper = CouchDBHelper.new(env["host"], env["port"], env["admin"], env["password"])
  helper.change_auth_db(env["authdb"])
end

After do
  helper = CouchDBHelper.new(env["host"], env["port"], env["admin"], env["password"])
  helper.change_auth_db
  helper.delete_db(env["authdb"])
end
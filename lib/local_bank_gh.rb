require "local_bank_gh/version"
require "active_record"
require "application_record"
require "active_support/all"
require "devise"
require 'devise/orm/active_record'
require "devise_security_extension"
require "cancan"

module LocalBankGh
  autoload :User, 'local_bank_gh/user'
  autoload :Role, 'local_bank_gh/role'
  autoload :Account, 'local_bank_gh/role'

end

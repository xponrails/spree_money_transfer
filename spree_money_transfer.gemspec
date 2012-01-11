# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spree_money_transfer/version"

Gem::Specification.new do |s|
  s.name        = "spree_money_transfer"
  s.version     = SpreeMoneyTransfer::VERSION
  s.authors     = ["Stefano Mancini"]
  s.email       = ["stefano.mancini@devinterface.com"]
  s.homepage    = "http://www.devinterface.com"
  s.summary     = %q{A spree gem that handles a money transfer offline payment}
  s.description = %q{A spree gem that handles a money transfer offline payment}

  s.rubyforge_project = "spree_money_transfer"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mercado_pago/version"

Gem::Specification.new do |s|
  s.name        = "mercado_pago"
  s.version     = MercadoPago::VERSION
  s.author      = "Sebastian Gamboa"
  s.email       = "me@sagmor.com"
  s.homepage    = ""
  s.summary     = %q{Mercado Pago}
  s.description = %q{Mercado Pago}

  s.rubyforge_project = "mercado_pago"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "hashie"
  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "multi_json"
end

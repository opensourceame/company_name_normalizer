Gem::Specification.new do |gem|
  gem.required_rubygems_version = Gem::Requirement.new(">= 0") if gem.respond_to? :required_rubygems_version=
  gem.name                      = "company_name_normalizer"
  gem.version                   = "0.0.1"
  gem.authors                   = ["David Kelly"]
  gem.date                      = "2020-12-12"
  gem.description               = "Normalize a company name to a minimal representation for machine comparison"
  gem.email                     = "david@futuresbright.com"
  gem.extra_rdoc_files          = [
    "LICENSE.txt",
    "README.md"
  ]
  gem.files                     = [
    "lib/company_name_normalizer.rb"
  ]
  gem.homepage                  = "http://github.com/opensourceame/company_name_normalizer"
  gem.licenses                  = ["MIT"]
  gem.require_paths             = ["lib"]
  gem.rubygems_version          = "1.8.24"
  gem.summary                   = "Normalize a company name for consistent matching"

  gem.add_dependency(%q<i18n>, '>0.4.1')
end


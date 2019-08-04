require 'rubygems/command_manager'

class Gem::Commands::DefaultCommand < Gem::Command
  def initialize(output = STDOUT)
    super 'default', description
    @output = output

    add_option('-v', '--version VERSION', 'Gem version to be a default gem') do |version, _options|
      options[:version] = version
    end
  end

  def usage
    "#{program_name} GEMNAME"
  end

  def description
    'Allows you to change an arbitrary installed gem to a default gem'
  end

  def execute
    gem_name = options[:args][0]
    if gem_name.nil?
      abort 'gem name is not specified. Usage: `gem default gem_name -v 1.2.3`'
    end

    DefaultGemInstaller.new(
      gem_home: Gem.paths.home,
      default_lib_dir: RbConfig::CONFIG['rubylibdir'],
    ).install(gem_name, version: options[:version])
  end

  class DefaultGemInstaller
    def initialize(gem_home:, default_lib_dir:)
      @gem_home = gem_home
      @default_lib_dir = default_lib_dir
    end

    def install(gem_name, version:)
      puts "TODO: install #{gem_name}"
    end
  end
  private_constant :DefaultGemInstaller
end

Gem::CommandManager.instance.register_command :default

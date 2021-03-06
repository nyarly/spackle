require 'active_dotfile'

module Spackle
  class Configuration
    include ActiveDotfile::Configurable
    load_dotfiles_on_initialize

    # The command to invoke when Spackle finds errors. It will receive
    # a single argument, being the path to the Spackle errors file.
    # If left unspecified, no command is invoked.
    attr_accessor :callback_command

    # Where to store the Spackle error files. If unspecified, Spackle will
    # default to /tmp
    attr_accessor :tempdir

    # Which ErrorFormatter class to use when formatting errors. Specified
    # as a symbol or string matching a class in spackle/error_formatters.
    # i.e. config.error_formatter = :vim_quickfix
    attr_accessor :error_formatter

    # Filename to use when writing the formatted Spackle results. If 
    # unspecified, defaults to a filename based on the name of your 
    # project's root directory, or "default.spackle" it can't figure out
    # where your root directory is
    attr_accessor :spackle_file

    # Configure Spackle with defaults. Currently only accepts :vim as an
    # argument.
    def set_defaults_for(mode)
      case mode.to_sym
      when :vim
        self.callback_command = "spackle-vim-load-quickfix"
        self.error_formatter  = :vim_quickfix
      else
        raise ArgumentError.new("unknown Spackle mode: '#{mode}'")
      end
    end


  end
end

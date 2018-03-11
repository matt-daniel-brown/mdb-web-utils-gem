require 'mdb/web/utils/version'

module Mdb
  module Web
    module Utils
      module ClassMethods
        def terminal_size
          require 'io/console'
          IO.console.winsize
        end

        def print_fullwidth_divider_line(line_character = '-')
          puts "\n"
          $terminal_width.times { puts line_character }
          puts "\n"
        end

        def print_console_banner_text(_banner_text)
          terminal_width, terminal_height = terminal_size
          print_fullwidth_divider_line
          printf "\t\t - - - Terminal Window Width is: %d (columns)", terminal_width
          printf "\t\t - - - Terminal Height is: %d (rows) \n\n\n", terminal_height
          print_fullwidth_divider_line
        end
      end

      module InstanceMethods
        def print_fullwidth_divider_line(line_character = '-')
          puts "\n"
          $terminal_width.times { puts line_character }
          puts "\n"
        end

        def print_console_banner_text(_banner_text)
          terminal_width, terminal_height = terminal_size
          print_fullwidth_divider_line
          printf "\t\t - - - Terminal Window Width is: %d (columns)", terminal_width
          printf "\t\t - - - Terminal Height is: %d (rows) \n\n\n", terminal_height
          print_fullwidth_divider_line
        end
        
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end

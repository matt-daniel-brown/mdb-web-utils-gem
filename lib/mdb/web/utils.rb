require "mdb/web/utils/version"

module Mdb
  module Web
    module Utils
  
      def calculate_terminal_window_size()
        require 'io/console'
        IO.console.winsize
      rescue LoadError
        [Integer(`tput co`), Integer(`tput li`)]
      end
  
      $terminal_width, $terminal_height = calculate_terminal_window_size

      def print_fullwidth_divider_line(line_character = "-")
        puts "\n"
        $terminal_width.times { puts line_character }
        puts "\n"
      end
      
      
  
      def print_console_banner_text(banner_text)
        print_fullwidth_divider_line
        printf "\t\t - - - Terminal Window Width is: %d (columns)", terminal_width
        printf "\t\t - - - Terminal Height is: %d (rows) \n\n\n", terminal_height
        print_fullwidth_divider_line
      end
      
      
    end
  end
end

# TODO: Actually learn the best way to configure irb with rails if rails exists
if ENV['RAILS_ENV']
  existing_conf = IRB.conf[:IRB_RC]

  def enable_active_record_logging!
    # Log SQL queries to stdout
    ActiveRecord::Base.connection.instance_variable_set :@logger, Logger.new(STDOUT)
  end

  IRB.conf[:IRB_RC] = Proc.new do
    if existing_conf
      existing_conf.call
    end

    # Let you use Model[id] to find by id
    class ActiveRecord::Base
      def self.[](index)
        find_by_id(index)
      end
    end

    enable_active_record_logging!

    # For marshalling session data
    def load_session(session_data)
      Marshal.load(Base64.decode64(session_data.split('--').first))
    end

    # Override reload! to reenable activerecord logging for when it doesn't exist
    # TODO: figure out a better way to override reload! than copy/pasting it
    def reload!(print = true)
      puts "Reloading..." if print
      Dispatcher.cleanup_application
      Dispatcher.reload_application
      enable_active_record_logging!
      true
    end
  end
elsif defined?(Rails) && !Rails.env.nil?
  class ActiveRecord::Base
    def self.[](index)
      find_by_id(index)
    end
  end
end

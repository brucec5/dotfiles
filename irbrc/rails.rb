# TODO: Actually learn the best way to configure irb with rails if rails exists
if ENV['RAILS_ENV']
  IRB.conf[:IRB_RC] = Proc.new do

    # Let you use Model[id] to find by id
    class ActiveRecord::Base
      def self.[](index)
        find_by_id(index)
      end
    end

    # Log SQL queries to stdout
    ActiveRecord::Base.connection.instance_variable_set :@logger, Logger.new(STDOUT)

    # For marshalling session data
    def load_session(session_data)
      Marshal.load(Base64.decode64(session_data.split('--').first))
    end
  end
elsif defined?(Rails) && !Rails.env.nil?
  class ActiveRecord::Base
    def self.[](index)
      find_by_id(index)
    end
  end
end

require "wildsearcher"
require "active_record"

module Wildsearcher
  module ActiveRecord
    include Wildsearcher

    private def default_scope
      ::ActiveRecord::VERSION::MAJOR >= 4 ? all : scoped
    end

    private def db_like
      case ::ActiveRecord::Base.connection.class.name.demodulize
      when "PostgreSQLAdapter"
        "ILIKE"
      when "MysqlAdapter"
        "LIKE"
      else
        "LIKE"
      end
    end
  end
end

ActiveRecord::Base.extend(Wildsearcher::ActiveRecord)

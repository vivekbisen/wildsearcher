module ActiveRecordHelper
  private def version_specific_scoped
    ::ActiveRecord::VERSION::MAJOR >= 4 ? all : scoped
  end

  private def db_like
    case ::ActiveRecord::Base.connection.class.name.demodulize
    when "PostgreSQLAdapter"
      "ILIKE"
    when "MysqlAdapter", "Mysql2Adapter"
      "LIKE"
    else
      raise NotImplementedError.new("Wildsearcher currently supports only Mysql and Postgresql.")
    end
  end
end

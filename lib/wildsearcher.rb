require "wildsearcher/version"
require "active_record"

module Wildsearcher
  def wildsearcher(params = {})
    field_array = params[:search_fields].to_s.split(",")
    term = params[:search_term].to_s.strip
    filter_records(search_fields: field_array, search_term: term)
  end

  def filter_records(search_fields: [], search_term: "")
    return default_scope if search_fields.empty? || search_term.blank?
    where(conditions(filter_fields(search_fields), search_term))
  end

  private def filter_fields(fields)
    fields.keep_if do |f|
      f.to_s.downcase.in? column_names
    end
  end

  private def conditions(fields, term)
    term = "%" + term.strip + "%" if db_like == "ILIKE"
    [fields.map { |f| "#{f} #{db_like} ?" }.join(" OR ")] + ([term] * fields.count)
  end

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
      raise NotImplementedError.new("Wildsearcher currently supports only Mysql and Postgresql.")
    end
  end

end

::ActiveRecord::Base.extend(Wildsearcher)

require "active_record"

module Wildsearcher
  def wildsearcher(params = {})
    field_array = params[:search_fields].to_s.split(",")
    term = params[:search_term].to_s.strip
    filter_records(search_fields: field_array, search_term: term)
  end

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

  def filter_records(search_fields: [], search_term: "")
    return version_specific_scoped if search_fields.empty? || search_term.blank?
    check_missing_associations(search_fields)
    where(conditions(filter_fields(search_fields), search_term))
  end

  private def filter_fields(fields)
    fields = add_table_name(fields)
    fields.keep_if { |f| f.to_s.downcase.in?(joined_model_columns(fields)) }
  end

  private def conditions(fields, term)
    term = "%" + term.strip + "%"
    [fields.map { |f| "CAST(#{f} as CHAR(50)) #{db_like} ?" }.join(" OR ")] + ([term] * fields.count)
  end

  private def joined_model_columns(search_fields)
    @joined_model_columns ||= begin
      extract_model_names(search_fields).flat_map do |model_name|
        extract_column_names(model_name).map do |column_name|
          "#{model_name.pluralize}.#{column_name}"
        end
      end
    end
  end

  private def extract_model_names(fields)
    fields.map { |f| f.split('.').first if f.to_s.include?('.') }.compact.uniq
  end

  private def extract_column_names(model_name)
    model_name.classify.safe_constantize.try(:column_names).to_a
  end

  private def add_table_name(fields)
    fields.map { |f| f.include?('.') ? f : (table_name + '.' + f) }
  end

  private def check_missing_associations(search_fields)
    extract_model_names(search_fields).map do |n|
      unless table_name == n || reflect_on_association(n).present?
        raise ActiveRecord::AssociationNotFoundError.new(new, n)
      end
    end
  end
end

::ActiveRecord::Base.extend(Wildsearcher)

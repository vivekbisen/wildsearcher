require "wildsearcher/version"
require "wildsearcher/active_record"

module Wildsearcher
  def search_on_fields(search_fields: [], search_term: "")
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
    raise NotImplementedError
  end

  private def db_like
    raise NotImplementedError
  end
end

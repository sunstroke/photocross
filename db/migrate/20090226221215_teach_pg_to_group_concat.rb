# -*- encoding : utf-8 -*-
class TeachPgToGroupConcat < ActiveRecord::Migration
  def self.up
    return unless adapter_name == "PostgreSQL"
    execute <<-EOF
    CREATE FUNCTION _group_concat(text, text, text)
    RETURNS text AS $$
      SELECT CASE
        WHEN $2 IS NULL THEN $1
        WHEN $1 IS NULL THEN $2
        ELSE $1 operator(pg_catalog.||) $3 operator(pg_catalog.||) $2
      END
    $$ IMMUTABLE LANGUAGE SQL;
    
    CREATE AGGREGATE group_concat(text, text) (
      SFUNC = _group_concat,
      STYPE = text
    );    
    EOF
  end

  def self.down
    return unless adapter_name == "PostgreSQL"
    execute <<-EOF
      DROP AGGREGATE group_concat(text, text);
      DROP FUNCTION _group_concat(text, text, text)
    EOF
  end
end

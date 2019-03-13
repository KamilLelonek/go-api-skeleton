DO $$
DECLARE
  extensions TEXT[] := array['pgcrypto', 'hstore', 'citext'];
  extension TEXT;
BEGIN
  FOREACH extension IN ARRAY extensions
  LOOP
    EXECUTE format('DROP EXTENSION IF EXISTS %s', extension);
  END LOOP;
END
$$

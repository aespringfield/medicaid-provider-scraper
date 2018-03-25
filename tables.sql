
-- CREATE DATABASE providers ENCODING 'utf8' TEMPLATE template0;
-- create user providers_web password 'pass';
--    GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO providers_web;
-- grant all on all sequences in schema public to providers_web;

-- drop table providers;
-- drop table subtype_types;
-- drop table subtypes;
-- drop table type_providers;
-- drop table types;

-- these should hvae fk - but not having them makes it easier to drop and reload...
-- tables
CREATE TABLE IF NOT EXISTS "providers" (
    id serial,
    provider character varying,
    street_address character varying,
    city character varying,
    state character varying,
    zip_code character varying,
    phone character varying,
    speciality character varying,
    notes character varying,
    CONSTRAINT providers_pkey PRIMARY KEY (id)
);
CREATE Unique INDEX providers_provider_idx ON providers (provider);
CREATE INDEX providers_city_idx ON providers (city);
CREATE INDEX providers_zip_idx ON providers (zip_code);


CREATE TABLE IF NOT EXISTS "types" (
    id serial,
    type character varying,
    CONSTRAINT types_pkey PRIMARY KEY (id)
);
CREATE unique  INDEX types_type_idx ON types (type);


CREATE TABLE IF NOT EXISTS "subtypes" (
    id serial,
    subtype character varying,
    CONSTRAINT subtypes_pkey PRIMARY KEY (id)
);
CREATE unique INDEX subtypes_subtype_idx ON subtypes (subtype);


-- join tables
CREATE TABLE IF NOT EXISTS "type_providers" (
    id serial,
    type_id integer NOT NULL,
    provider_id integer NOT NULL,
    CONSTRAINT type_providers_pkey PRIMARY KEY (id)
);
CREATE unique INDEX type_providers_type_idx ON type_providers (type_id, provider_id);
CREATE INDEX type_providers_provider_idx ON type_providers (provider_id);


CREATE TABLE IF NOT EXISTS "subtype_types" (
    id serial,
    subtype_id integer NOT NULL,
    type_id integer NOT NULL,
    CONSTRAINT subtype_types_pkey PRIMARY KEY (id)
);
CREATE unique INDEX subtype_types_subtype_idx ON subtype_types (subtype_id, type_id);
CREATE INDEX subtype_types_type_idx ON subtype_types (type_id);

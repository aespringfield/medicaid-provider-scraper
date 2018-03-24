-- tables

CREATE TABLE IF NOT EXISTS "providers" (
    id serial,
    -- cid character varying NOT NULL,
    name character varying,
    street1_address character varying,
    city character varying,
    state character varying,
    zip character varying,
    notes character varying,
    CONSTRAINT providers_pkey PRIMARY KEY (id),
);
CREATE INDEX providers_name_idx ON providers (name);
CREATE INDEX providers_name_idx ON providers (city);
CREATE INDEX providers_name_idx ON providers (zip);


CREATE TABLE IF NOT EXISTS "types" (
    id serial,
    name character varying,
    CONSTRAINT types_pkey PRIMARY KEY (id),
);
CREATE INDEX types_name_idx ON types (name);


CREATE TABLE IF NOT EXISTS "subtypes" (
    id serial,
    name character varying,
    CONSTRAINT subtypes_pkey PRIMARY KEY (id),
);
CREATE INDEX subtypes_name_idx ON subtypes (name);


-- join tables

CREATE TABLE IF NOT EXISTS "type_providers" (
    id serial,
    type_id integer NOT NULL,
    provider_id integer NOT NULL,
    CONSTRAINT types_pkey PRIMARY KEY (id),
);
CREATE INDEX type_providers_type_idx ON type_providers (type_id);
CREATE INDEX type_providers_provider_idx ON type_providers (provider_id);

CREATE TABLE IF NOT EXISTS "type_providers" (
    id serial,
    type_id character varying,
    CONSTRAINT types_pkey PRIMARY KEY (id),
);
CREATE INDEX providers_name_idx ON types (name);

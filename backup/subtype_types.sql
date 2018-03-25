--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Debian 10.3-1.pgdg90+1)
-- Dumped by pg_dump version 10.3 (Debian 10.3-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: subtype_types; Type: TABLE; Schema: public; Owner: providers_web
--

CREATE TABLE public.subtype_types (
    id integer NOT NULL,
    subtype_id integer NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.subtype_types OWNER TO providers_web;

--
-- Name: subtype_types_id_seq; Type: SEQUENCE; Schema: public; Owner: providers_web
--

CREATE SEQUENCE public.subtype_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subtype_types_id_seq OWNER TO providers_web;

--
-- Name: subtype_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: providers_web
--

ALTER SEQUENCE public.subtype_types_id_seq OWNED BY public.subtype_types.id;


--
-- Name: subtype_types id; Type: DEFAULT; Schema: public; Owner: providers_web
--

ALTER TABLE ONLY public.subtype_types ALTER COLUMN id SET DEFAULT nextval('public.subtype_types_id_seq'::regclass);


--
-- Data for Name: subtype_types; Type: TABLE DATA; Schema: public; Owner: providers_web
--

COPY public.subtype_types (id, subtype_id, type_id) FROM stdin;
1	1	1
370	370	370
2636	2636	2636
3042	3042	2636
3245	3245	3245
3799	3799	3799
8418	8418	3799
9232	9232	9232
\.


--
-- Name: subtype_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: providers_web
--

SELECT pg_catalog.setval('public.subtype_types_id_seq', 10624, true);


--
-- Name: subtype_types subtype_types_pkey; Type: CONSTRAINT; Schema: public; Owner: providers_web
--

ALTER TABLE ONLY public.subtype_types
    ADD CONSTRAINT subtype_types_pkey PRIMARY KEY (id);


--
-- Name: subtype_types_subtype_idx; Type: INDEX; Schema: public; Owner: providers_web
--

CREATE UNIQUE INDEX subtype_types_subtype_idx ON public.subtype_types USING btree (subtype_id, type_id);


--
-- Name: subtype_types_type_idx; Type: INDEX; Schema: public; Owner: providers_web
--

CREATE INDEX subtype_types_type_idx ON public.subtype_types USING btree (type_id);


--
-- PostgreSQL database dump complete
--


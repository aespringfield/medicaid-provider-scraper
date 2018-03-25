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
-- Name: types; Type: TABLE; Schema: public; Owner: providers_web
--

CREATE TABLE public.types (
    id integer NOT NULL,
    type character varying
);


ALTER TABLE public.types OWNER TO providers_web;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: providers_web
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO providers_web;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: providers_web
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- Name: types id; Type: DEFAULT; Schema: public; Owner: providers_web
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: providers_web
--

COPY public.types (id, type) FROM stdin;
2636	Clinics
9232	Physical Therapy
1	Acupuncture
370	Chiropractic Services
3245	Dental
3799	Mental Health
\.


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: providers_web
--

SELECT pg_catalog.setval('public.types_id_seq', 10624, true);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: providers_web
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: types_type_idx; Type: INDEX; Schema: public; Owner: providers_web
--

CREATE UNIQUE INDEX types_type_idx ON public.types USING btree (type);


--
-- PostgreSQL database dump complete
--


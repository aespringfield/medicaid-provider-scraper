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
-- Name: subtypes; Type: TABLE; Schema: public; Owner: providers_web
--

CREATE TABLE public.subtypes (
    id integer NOT NULL,
    subtype character varying
);


ALTER TABLE public.subtypes OWNER TO providers_web;

--
-- Name: subtypes_id_seq; Type: SEQUENCE; Schema: public; Owner: providers_web
--

CREATE SEQUENCE public.subtypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subtypes_id_seq OWNER TO providers_web;

--
-- Name: subtypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: providers_web
--

ALTER SEQUENCE public.subtypes_id_seq OWNED BY public.subtypes.id;


--
-- Name: subtypes id; Type: DEFAULT; Schema: public; Owner: providers_web
--

ALTER TABLE ONLY public.subtypes ALTER COLUMN id SET DEFAULT nextval('public.subtypes_id_seq'::regclass);


--
-- Data for Name: subtypes; Type: TABLE DATA; Schema: public; Owner: providers_web
--

COPY public.subtypes (id, subtype) FROM stdin;
1	Acupuncture Services
3042	Primary Resources Sliding Fee
2636	Clinics
3245	Dental Clinic
9232	Physical Therapist
370	Chiropractic Services
3799	Mental Health Therapists
8418	Psychiatry
\.


--
-- Name: subtypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: providers_web
--

SELECT pg_catalog.setval('public.subtypes_id_seq', 10624, true);


--
-- Name: subtypes subtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: providers_web
--

ALTER TABLE ONLY public.subtypes
    ADD CONSTRAINT subtypes_pkey PRIMARY KEY (id);


--
-- Name: subtypes_subtype_idx; Type: INDEX; Schema: public; Owner: providers_web
--

CREATE UNIQUE INDEX subtypes_subtype_idx ON public.subtypes USING btree (subtype);


--
-- PostgreSQL database dump complete
--


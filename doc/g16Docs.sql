--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

DROP INDEX public.unique_schema_migrations;
ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_pkey;
ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.pages_id_seq;
DROP TABLE public.pages;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pages; Type: TABLE; Schema: public; Owner: railsadmin; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    file character varying(255),
    lecture character varying(255),
    category character varying(255),
    "user" character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content_type character varying(255) DEFAULT 'text/plain'::character varying
);


ALTER TABLE public.pages OWNER TO railsadmin;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: railsadmin
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO railsadmin;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: railsadmin
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: railsadmin; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO railsadmin;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: railsadmin
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: railsadmin
--

COPY pages (id, title, description, file, lecture, category, "user", created_at, updated_at, content_type) FROM stdin;
1	Linux Essentials	PDF das die wesentlichen Lehr- und Prüfungsinhalte enthält	LinuxEssentialsPruefung.pdf	KuA FIT3H	Info	Bogner	2014-01-24 19:02:38.213486	2014-01-24 19:02:38.213486	application/pdf
5	Datum_Funktion_Mueck	Funktion zur formatierung eines Datums (Führende Nullen)	Datum_funktion	KuA FIT2AH	Info	Mueck	2014-02-03 17:45:37.161617	2014-02-03 17:45:37.161617	
6	Skript zum Anlegen von Usern	ANlegen von Usern aus einer Datei	0-komplett.sh	KuA FIT2AH	Loesung	\N	2014-02-03 18:39:14.354877	2014-02-03 18:39:14.354877	application/x-shellscript
4	Linux Essentials	Inhalt der Linux Essentials Prüfung	LinuxEssentialsPruefung.pdf	KuA FIT2AH	Info	\N	2014-02-02 18:58:29.791125	2014-02-04 08:16:28.081122	\N
7	Links für Ruby als Textdatei	Links für Ruby als Textdatei	Links.txt	EuP FIT2AH	Info	\N	2014-02-05 17:41:55.812367	2014-02-05 17:41:55.812367	text/plain
8	Mr.Universum	Beispieldatei für Skriptin-Übungen und Klassenarbeit	mr-universum.txt	KuA FIT2AH	Aufgabe	Bogner	2014-02-09 14:49:42.016517	2014-02-09 14:49:42.016517	text/plain
9	Ruby. 1. Wiederholung	Einstieg Ruby Console	aufgabe.txt	KuA_Fit2ah	Aufgabe	Bogner	2014-02-11 20:14:31.836543	2014-02-11 20:14:31.836543	text/plain
10	Ruby. 2. Number. Strings	Ruby. 2. Number. Strings	03-number-strings.tar	KuA_Fit2ah	ZIP	Bogner	2014-02-11 20:25:39.525981	2014-02-11 20:25:39.525981	application/x-tar
11	Ruby. 3. Variablen und Objekte	Ruby. 3. Variablen und Objekte	04-variables-objects.tar	KuA_Fit2ah	ZIP	Bogner	2014-02-11 20:26:35.31263	2014-02-11 20:26:35.31263	application/x-tar
12	Ruby. 4. Methoden	Programmieren mit Methoden	06-methods.tar	KuA_Fit2ah	ZIP	Bogner	2014-02-11 20:27:29.108494	2014-02-11 20:27:29.108494	application/x-tar
13	Ruby. 5. Klassen	Klassen mit einer zusätzlichen Übung	07-classes.tar	KuA_Fit2ah	ZIP	Bogner	2014-02-11 20:30:28.471402	2014-02-11 20:30:28.471402	application/x-tar
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: railsadmin
--

SELECT pg_catalog.setval('pages_id_seq', 13, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: railsadmin
--

COPY schema_migrations (version) FROM stdin;
20131102075856
20131230140812
\.


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: railsadmin; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: railsadmin; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


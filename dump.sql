--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.status AS ENUM (
    'Assistido',
    'Não assistido'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: films; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.films (
    id integer NOT NULL,
    name text NOT NULL,
    genre text NOT NULL,
    streaming text NOT NULL,
    current_status public.status DEFAULT 'Não assistido'::public.status NOT NULL,
    note integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT check_note_range CHECK (((note >= 0) AND (note <= 10)))
);


--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.films_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.films_id_seq OWNED BY public.films.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: streamings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.streamings (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: streamings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.streamings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: streamings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.streamings_id_seq OWNED BY public.streamings.id;


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films ALTER COLUMN id SET DEFAULT nextval('public.films_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: streamings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streamings ALTER COLUMN id SET DEFAULT nextval('public.streamings_id_seq'::regclass);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.films VALUES (2, 'Filme teste 2', 'Ação', 'Netflix', 'Assistido', 5, '2023-07-03 05:30:58.862957');
INSERT INTO public.films VALUES (4, 'Filme teste 3', 'Ação', 'Netflix', 'Não assistido', 0, '2023-07-03 12:39:40.322591');
INSERT INTO public.films VALUES (6, 'Filme teste 3', 'Ação', 'Prime Video', 'Não assistido', 0, '2023-07-03 13:14:22.671255');
INSERT INTO public.films VALUES (7, 'Filme teste 5', 'Ação', 'Prime Video', 'Não assistido', 0, '2023-07-03 13:14:35.442919');
INSERT INTO public.films VALUES (8, 'Filme teste 4', 'Ação', 'Prime Video', 'Não assistido', 0, '2023-07-03 13:14:38.019008');
INSERT INTO public.films VALUES (9, 'Filme teste 10', 'Ação', 'Prime Video', 'Não assistido', 0, '2023-07-03 13:14:40.755894');
INSERT INTO public.films VALUES (10, 'Filme teste 11', 'Ação', 'HBO Max', 'Não assistido', 0, '2023-07-03 13:14:51.442009');
INSERT INTO public.films VALUES (11, 'Filme teste 16', 'Ação', 'HBO Max', 'Não assistido', 0, '2023-07-03 13:14:53.693311');
INSERT INTO public.films VALUES (12, 'Filme teste 15', 'Ação', 'HBO Max', 'Não assistido', 0, '2023-07-03 13:14:55.583056');
INSERT INTO public.films VALUES (13, 'Filme teste 20', 'Ação', 'Star Plus', 'Não assistido', 0, '2023-07-03 13:15:12.678828');
INSERT INTO public.films VALUES (14, 'Filme teste 21', 'Ação', 'Star Plus', 'Não assistido', 0, '2023-07-03 13:15:15.585777');
INSERT INTO public.films VALUES (15, 'Filme teste 22', 'Ação', 'Star Plus', 'Não assistido', 0, '2023-07-03 13:15:17.412894');


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genres VALUES (1, 'Ação');
INSERT INTO public.genres VALUES (2, 'Ficcção Cintífica');
INSERT INTO public.genres VALUES (3, 'Aventura');


--
-- Data for Name: streamings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.streamings VALUES (1, 'Netflix');
INSERT INTO public.streamings VALUES (2, 'Prime Video');
INSERT INTO public.streamings VALUES (3, 'HBO Max');
INSERT INTO public.streamings VALUES (4, 'Star Plus');


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.films_id_seq', 15, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genres_id_seq', 3, true);


--
-- Name: streamings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.streamings_id_seq', 4, true);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: streamings streamings_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streamings
    ADD CONSTRAINT streamings_name_key UNIQUE (name);


--
-- Name: streamings streamings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.streamings
    ADD CONSTRAINT streamings_pkey PRIMARY KEY (id);


--
-- Name: films films_genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_genre_fkey FOREIGN KEY (genre) REFERENCES public.genres(name);


--
-- Name: films films_streaming_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_streaming_fkey FOREIGN KEY (streaming) REFERENCES public.streamings(name);


--
-- PostgreSQL database dump complete
--


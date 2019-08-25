--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Ubuntu 11.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.2 (Ubuntu 11.2-1.pgdg18.04+1)

-- Started on 2019-08-25 23:49:45 EEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE micro_party_quiz_db;
--
-- TOC entry 3016 (class 1262 OID 1143222)
-- Name: micro_party_quiz_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE micro_party_quiz_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF8' LC_CTYPE = 'en_US.UTF8';


ALTER DATABASE micro_party_quiz_db OWNER TO postgres;

\connect micro_party_quiz_db

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
-- TOC entry 200 (class 1259 OID 1143320)
-- Name: game; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.game (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    manager_id bigint NOT NULL,
    max_points integer
);


ALTER TABLE public.game OWNER TO collaborate_user;

--
-- TOC entry 201 (class 1259 OID 1143338)
-- Name: game_player; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.game_player (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    player_id bigint NOT NULL
);


ALTER TABLE public.game_player OWNER TO collaborate_user;

--
-- TOC entry 202 (class 1259 OID 1143353)
-- Name: game_question; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.game_question (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    question_id bigint NOT NULL
);


ALTER TABLE public.game_question OWNER TO collaborate_user;

--
-- TOC entry 199 (class 1259 OID 1143300)
-- Name: manager; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.manager (
    id bigint NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    salt character varying,
    state character varying NOT NULL,
    last_login timestamp without time zone,
    short_name character varying NOT NULL,
    full_name character varying,
    is_multi_session bit(1) DEFAULT (0)::bit(1) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.manager OWNER TO collaborate_user;

--
-- TOC entry 196 (class 1259 OID 1143228)
-- Name: player; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.player (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    state character varying DEFAULT 'ACTIVE'::character varying,
    points integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.player OWNER TO collaborate_user;

--
-- TOC entry 198 (class 1259 OID 1143281)
-- Name: question; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.question (
    id bigint NOT NULL,
    category character varying NOT NULL,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated timestamp without time zone,
    manager_id bigint,
    question_label character varying NOT NULL,
    question_picture character varying
);


ALTER TABLE public.question OWNER TO collaborate_user;

--
-- TOC entry 197 (class 1259 OID 1143247)
-- Name: question_category; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.question_category (
    category character varying NOT NULL,
    name_id bigint,
    is_deleted bit(1) DEFAULT (0)::bit(1) NOT NULL
);


ALTER TABLE public.question_category OWNER TO collaborate_user;

--
-- TOC entry 203 (class 1259 OID 1143368)
-- Name: question_field; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.question_field (
    id bigint NOT NULL,
    code character varying NOT NULL,
    is_multi_value bit(1) DEFAULT (0)::bit(1) NOT NULL,
    is_deleted bit(1) DEFAULT (0)::bit(1) NOT NULL,
    is_read_only bit(1) DEFAULT (0)::bit(1) NOT NULL,
    field_type character varying NOT NULL,
    display_order integer NOT NULL,
    "values" text,
    master_question_field_id bigint,
    is_correct bit(1) DEFAULT (0)::bit(1),
    question_field_description character varying NOT NULL,
    question_id bigint NOT NULL
);


ALTER TABLE public.question_field OWNER TO collaborate_user;

--
-- TOC entry 204 (class 1259 OID 1143385)
-- Name: question_field_data; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.question_field_data (
    id bigint NOT NULL,
    question_field_id bigint NOT NULL,
    text_value character varying,
    numeric_value numeric(30,6),
    datetime_value timestamp without time zone,
    boolean_value bit(1),
    player_id bigint NOT NULL,
    manager_comment character varying,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.question_field_data OWNER TO collaborate_user;

--
-- TOC entry 3006 (class 0 OID 1143320)
-- Dependencies: 200
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.game (id, name, created, manager_id, max_points) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 1143338)
-- Dependencies: 201
-- Data for Name: game_player; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.game_player (id, game_id, player_id) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 1143353)
-- Dependencies: 202
-- Data for Name: game_question; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.game_question (id, game_id, question_id) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 1143300)
-- Dependencies: 199
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.manager (id, login, password, salt, state, last_login, short_name, full_name, is_multi_session, created) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 1143228)
-- Dependencies: 196
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.player (id, username, created, state, points) FROM stdin;
\.


--
-- TOC entry 3004 (class 0 OID 1143281)
-- Dependencies: 198
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.question (id, category, created, updated, manager_id, question_label, question_picture) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 1143247)
-- Dependencies: 197
-- Data for Name: question_category; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.question_category (category, name_id, is_deleted) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 1143368)
-- Dependencies: 203
-- Data for Name: question_field; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.question_field (id, code, is_multi_value, is_deleted, is_read_only, field_type, display_order, "values", master_question_field_id, is_correct, question_field_description, question_id) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 1143385)
-- Dependencies: 204
-- Data for Name: question_field_data; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

COPY public.question_field_data (id, question_field_id, text_value, numeric_value, datetime_value, boolean_value, player_id, manager_comment, created) FROM stdin;
\.


--
-- TOC entry 2864 (class 2606 OID 1143328)
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 1143342)
-- Name: game_player game_player_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_player
    ADD CONSTRAINT game_player_pkey PRIMARY KEY (id);


--
-- TOC entry 2868 (class 2606 OID 1143357)
-- Name: game_question game_question_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_question
    ADD CONSTRAINT game_question_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 1143308)
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 1143255)
-- Name: question_category question_category_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_category
    ADD CONSTRAINT question_category_pkey PRIMARY KEY (category);


--
-- TOC entry 2872 (class 2606 OID 1143393)
-- Name: question_field_data question_field_data_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field_data
    ADD CONSTRAINT question_field_data_pkey PRIMARY KEY (id);


--
-- TOC entry 2870 (class 2606 OID 1143379)
-- Name: question_field question_field_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field
    ADD CONSTRAINT question_field_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 1143289)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 1143232)
-- Name: player user_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 1143331)
-- Name: game game_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.manager(id);


--
-- TOC entry 2875 (class 2606 OID 1143343)
-- Name: game_player game_player_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_player
    ADD CONSTRAINT game_player_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2876 (class 2606 OID 1143348)
-- Name: game_player game_player_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_player
    ADD CONSTRAINT game_player_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- TOC entry 2877 (class 2606 OID 1143358)
-- Name: game_question game_question_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_question
    ADD CONSTRAINT game_question_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2878 (class 2606 OID 1143363)
-- Name: game_question game_question_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_question
    ADD CONSTRAINT game_question_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- TOC entry 2873 (class 2606 OID 1143290)
-- Name: question question_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_category_fkey FOREIGN KEY (category) REFERENCES public.question_category(category);


--
-- TOC entry 2880 (class 2606 OID 1143394)
-- Name: question_field_data question_field_data_question_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field_data
    ADD CONSTRAINT question_field_data_question_field_id_fkey FOREIGN KEY (question_field_id) REFERENCES public.question_field(id);


--
-- TOC entry 2879 (class 2606 OID 1143380)
-- Name: question_field question_field_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field
    ADD CONSTRAINT question_field_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 3016
-- Name: DATABASE micro_party_quiz_db; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE micro_party_quiz_db TO micro_party_quiz_user;


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO micro_party_quiz_user;


--
-- TOC entry 1715 (class 826 OID 1143225)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO micro_party_quiz_user;


--
-- TOC entry 1717 (class 826 OID 1143227)
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO micro_party_quiz_user;


--
-- TOC entry 1716 (class 826 OID 1143226)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO micro_party_quiz_user;


--
-- TOC entry 1714 (class 826 OID 1143224)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO micro_party_quiz_user;


-- Completed on 2019-08-25 23:49:46 EEST

--
-- PostgreSQL database dump complete
--


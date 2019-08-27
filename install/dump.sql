--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Ubuntu 11.2-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.2 (Ubuntu 11.2-1.pgdg18.04+1)

-- Started on 2019-08-27 21:18:24 EEST

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
-- TOC entry 196 (class 1259 OID 1146034)
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
-- TOC entry 197 (class 1259 OID 1146041)
-- Name: game_id_seq; Type: SEQUENCE; Schema: public; Owner: collaborate_user
--

CREATE SEQUENCE public.game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_id_seq OWNER TO collaborate_user;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 197
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collaborate_user
--

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


--
-- TOC entry 198 (class 1259 OID 1146043)
-- Name: game_player; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.game_player (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    player_id bigint NOT NULL
);


ALTER TABLE public.game_player OWNER TO collaborate_user;

--
-- TOC entry 199 (class 1259 OID 1146046)
-- Name: game_player_id_seq; Type: SEQUENCE; Schema: public; Owner: collaborate_user
--

CREATE SEQUENCE public.game_player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_player_id_seq OWNER TO collaborate_user;

--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 199
-- Name: game_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collaborate_user
--

ALTER SEQUENCE public.game_player_id_seq OWNED BY public.game_player.id;


--
-- TOC entry 200 (class 1259 OID 1146048)
-- Name: game_question; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.game_question (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    question_id bigint NOT NULL
);


ALTER TABLE public.game_question OWNER TO collaborate_user;

--
-- TOC entry 201 (class 1259 OID 1146051)
-- Name: game_question_id_seq; Type: SEQUENCE; Schema: public; Owner: collaborate_user
--

CREATE SEQUENCE public.game_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_question_id_seq OWNER TO collaborate_user;

--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 201
-- Name: game_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collaborate_user
--

ALTER SEQUENCE public.game_question_id_seq OWNED BY public.game_question.id;


--
-- TOC entry 202 (class 1259 OID 1146053)
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
-- TOC entry 203 (class 1259 OID 1146061)
-- Name: manager_id_seq; Type: SEQUENCE; Schema: public; Owner: collaborate_user
--

CREATE SEQUENCE public.manager_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manager_id_seq OWNER TO collaborate_user;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 203
-- Name: manager_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collaborate_user
--

ALTER SEQUENCE public.manager_id_seq OWNED BY public.manager.id;


--
-- TOC entry 204 (class 1259 OID 1146063)
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
-- TOC entry 205 (class 1259 OID 1146072)
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: collaborate_user
--

CREATE SEQUENCE public.player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_id_seq OWNER TO collaborate_user;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 205
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collaborate_user
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- TOC entry 206 (class 1259 OID 1146074)
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
-- TOC entry 207 (class 1259 OID 1146081)
-- Name: question_category; Type: TABLE; Schema: public; Owner: collaborate_user
--

CREATE TABLE public.question_category (
    category character varying NOT NULL,
    name_id bigint,
    is_deleted bit(1) DEFAULT (0)::bit(1) NOT NULL
);


ALTER TABLE public.question_category OWNER TO collaborate_user;

--
-- TOC entry 208 (class 1259 OID 1146088)
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
-- TOC entry 209 (class 1259 OID 1146098)
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
-- TOC entry 210 (class 1259 OID 1146105)
-- Name: question_field_data_id_seq; Type: SEQUENCE; Schema: public; Owner: collaborate_user
--

CREATE SEQUENCE public.question_field_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_field_data_id_seq OWNER TO collaborate_user;

--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 210
-- Name: question_field_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collaborate_user
--

ALTER SEQUENCE public.question_field_data_id_seq OWNED BY public.question_field_data.id;


--
-- TOC entry 211 (class 1259 OID 1146107)
-- Name: question_field_id_seq; Type: SEQUENCE; Schema: public; Owner: collaborate_user
--

CREATE SEQUENCE public.question_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_field_id_seq OWNER TO collaborate_user;

--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 211
-- Name: question_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collaborate_user
--

ALTER SEQUENCE public.question_field_id_seq OWNED BY public.question_field.id;


--
-- TOC entry 212 (class 1259 OID 1146109)
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: collaborate_user
--

CREATE SEQUENCE public.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO collaborate_user;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 212
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: collaborate_user
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- TOC entry 2859 (class 2604 OID 1146111)
-- Name: game id; Type: DEFAULT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


--
-- TOC entry 2860 (class 2604 OID 1146112)
-- Name: game_player id; Type: DEFAULT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_player ALTER COLUMN id SET DEFAULT nextval('public.game_player_id_seq'::regclass);


--
-- TOC entry 2861 (class 2604 OID 1146113)
-- Name: game_question id; Type: DEFAULT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_question ALTER COLUMN id SET DEFAULT nextval('public.game_question_id_seq'::regclass);


--
-- TOC entry 2864 (class 2604 OID 1146114)
-- Name: manager id; Type: DEFAULT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.manager ALTER COLUMN id SET DEFAULT nextval('public.manager_id_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 1146115)
-- Name: player id; Type: DEFAULT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 1146116)
-- Name: question id; Type: DEFAULT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- TOC entry 2876 (class 2604 OID 1146117)
-- Name: question_field id; Type: DEFAULT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field ALTER COLUMN id SET DEFAULT nextval('public.question_field_id_seq'::regclass);


--
-- TOC entry 2878 (class 2604 OID 1146118)
-- Name: question_field_data id; Type: DEFAULT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field_data ALTER COLUMN id SET DEFAULT nextval('public.question_field_data_id_seq'::regclass);


--
-- TOC entry 3026 (class 0 OID 1146034)
-- Dependencies: 196
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--



--
-- TOC entry 3028 (class 0 OID 1146043)
-- Dependencies: 198
-- Data for Name: game_player; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--



--
-- TOC entry 3030 (class 0 OID 1146048)
-- Dependencies: 200
-- Data for Name: game_question; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--



--
-- TOC entry 3032 (class 0 OID 1146053)
-- Dependencies: 202
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

INSERT INTO public.manager VALUES (1, 'test', '111', '222', 'ACTIVE', NULL, 'Test', 'Test user', B'0', '2019-08-26 22:43:40.183898');


--
-- TOC entry 3034 (class 0 OID 1146063)
-- Dependencies: 204
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--



--
-- TOC entry 3036 (class 0 OID 1146074)
-- Dependencies: 206
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

INSERT INTO public.question VALUES (1, 'Main', '2019-08-26 22:44:49.252842', NULL, 1, 'What is the test question?', NULL);


--
-- TOC entry 3037 (class 0 OID 1146081)
-- Dependencies: 207
-- Data for Name: question_category; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

INSERT INTO public.question_category VALUES ('Main', NULL, B'0');


--
-- TOC entry 3038 (class 0 OID 1146088)
-- Dependencies: 208
-- Data for Name: question_field; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--

INSERT INTO public.question_field VALUES (1, 'radiobutton_main', B'0', B'0', B'0', 'MULTIPLE_GROUP', 1, NULL, NULL, B'0', 'One choice panel', 1);
INSERT INTO public.question_field VALUES (2, 'radiobutton_option_1', B'0', B'0', B'0', 'RADIOBUTTON', 1, '???', 1, B'0', 'Option 1', 1);
INSERT INTO public.question_field VALUES (3, 'radiobutton_option_2', B'0', B'0', B'0', 'RADIOBUTTON', 2, '42', 1, B'1', 'Option 2', 1);


--
-- TOC entry 3039 (class 0 OID 1146098)
-- Dependencies: 209
-- Data for Name: question_field_data; Type: TABLE DATA; Schema: public; Owner: collaborate_user
--



--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 197
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collaborate_user
--

SELECT pg_catalog.setval('public.game_id_seq', 1, false);


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 199
-- Name: game_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collaborate_user
--

SELECT pg_catalog.setval('public.game_player_id_seq', 1, false);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 201
-- Name: game_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collaborate_user
--

SELECT pg_catalog.setval('public.game_question_id_seq', 1, false);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 203
-- Name: manager_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collaborate_user
--

SELECT pg_catalog.setval('public.manager_id_seq', 1, true);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 205
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collaborate_user
--

SELECT pg_catalog.setval('public.player_id_seq', 1, false);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 210
-- Name: question_field_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collaborate_user
--

SELECT pg_catalog.setval('public.question_field_data_id_seq', 1, false);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 211
-- Name: question_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collaborate_user
--

SELECT pg_catalog.setval('public.question_field_id_seq', 3, true);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 212
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: collaborate_user
--

SELECT pg_catalog.setval('public.question_id_seq', 1, true);


--
-- TOC entry 2880 (class 2606 OID 1146120)
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- TOC entry 2882 (class 2606 OID 1146122)
-- Name: game_player game_player_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_player
    ADD CONSTRAINT game_player_pkey PRIMARY KEY (id);


--
-- TOC entry 2884 (class 2606 OID 1146124)
-- Name: game_question game_question_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_question
    ADD CONSTRAINT game_question_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 1146126)
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 1146128)
-- Name: question_category question_category_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_category
    ADD CONSTRAINT question_category_pkey PRIMARY KEY (category);


--
-- TOC entry 2896 (class 2606 OID 1146130)
-- Name: question_field_data question_field_data_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field_data
    ADD CONSTRAINT question_field_data_pkey PRIMARY KEY (id);


--
-- TOC entry 2894 (class 2606 OID 1146132)
-- Name: question_field question_field_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field
    ADD CONSTRAINT question_field_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 1146134)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 2888 (class 2606 OID 1146136)
-- Name: player user_pkey; Type: CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 1146137)
-- Name: game game_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.manager(id);


--
-- TOC entry 2898 (class 2606 OID 1146142)
-- Name: game_player game_player_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_player
    ADD CONSTRAINT game_player_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2899 (class 2606 OID 1146147)
-- Name: game_player game_player_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_player
    ADD CONSTRAINT game_player_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- TOC entry 2900 (class 2606 OID 1146152)
-- Name: game_question game_question_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_question
    ADD CONSTRAINT game_question_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2901 (class 2606 OID 1146157)
-- Name: game_question game_question_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.game_question
    ADD CONSTRAINT game_question_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- TOC entry 2902 (class 2606 OID 1146162)
-- Name: question question_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_category_fkey FOREIGN KEY (category) REFERENCES public.question_category(category);


--
-- TOC entry 2904 (class 2606 OID 1146167)
-- Name: question_field_data question_field_data_question_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field_data
    ADD CONSTRAINT question_field_data_question_field_id_fkey FOREIGN KEY (question_field_id) REFERENCES public.question_field(id);


--
-- TOC entry 2903 (class 2606 OID 1146172)
-- Name: question_field question_field_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: collaborate_user
--

ALTER TABLE ONLY public.question_field
    ADD CONSTRAINT question_field_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(id);


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO micro_party_quiz_user;


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE game; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.game TO micro_party_quiz_user;


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 197
-- Name: SEQUENCE game_id_seq; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON SEQUENCE public.game_id_seq TO micro_party_quiz_user;


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE game_player; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.game_player TO micro_party_quiz_user;


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 199
-- Name: SEQUENCE game_player_id_seq; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON SEQUENCE public.game_player_id_seq TO micro_party_quiz_user;


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE game_question; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.game_question TO micro_party_quiz_user;


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 201
-- Name: SEQUENCE game_question_id_seq; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON SEQUENCE public.game_question_id_seq TO micro_party_quiz_user;


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE manager; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.manager TO micro_party_quiz_user;


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 203
-- Name: SEQUENCE manager_id_seq; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON SEQUENCE public.manager_id_seq TO micro_party_quiz_user;


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE player; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.player TO micro_party_quiz_user;


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 205
-- Name: SEQUENCE player_id_seq; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON SEQUENCE public.player_id_seq TO micro_party_quiz_user;


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE question; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.question TO micro_party_quiz_user;


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE question_category; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.question_category TO micro_party_quiz_user;


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE question_field; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.question_field TO micro_party_quiz_user;


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE question_field_data; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON TABLE public.question_field_data TO micro_party_quiz_user;


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 210
-- Name: SEQUENCE question_field_data_id_seq; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON SEQUENCE public.question_field_data_id_seq TO micro_party_quiz_user;


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 211
-- Name: SEQUENCE question_field_id_seq; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON SEQUENCE public.question_field_id_seq TO micro_party_quiz_user;


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 212
-- Name: SEQUENCE question_id_seq; Type: ACL; Schema: public; Owner: collaborate_user
--

GRANT ALL ON SEQUENCE public.question_id_seq TO micro_party_quiz_user;


--
-- TOC entry 1730 (class 826 OID 1146031)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO micro_party_quiz_user;


--
-- TOC entry 1731 (class 826 OID 1146033)
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO micro_party_quiz_user;


--
-- TOC entry 1732 (class 826 OID 1146032)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO micro_party_quiz_user;


--
-- TOC entry 1733 (class 826 OID 1146030)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO micro_party_quiz_user;


-- Completed on 2019-08-27 21:18:27 EEST

--
-- PostgreSQL database dump complete
--


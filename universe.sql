--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(20),
    distance_from_earth_mly numeric(5,2),
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    radius_km numeric(6,2),
    discovery_year integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    distance_from_sun_au numeric(5,3),
    number_of_moons integer,
    rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: scientist; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scientist (
    scientist_id integer NOT NULL,
    name character varying(40) NOT NULL,
    info text NOT NULL
);


ALTER TABLE public.scientist OWNER TO freecodecamp;

--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scientist_scientist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scientist_scientist_id_seq OWNER TO freecodecamp;

--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scientist_scientist_id_seq OWNED BY public.scientist.scientist_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_from_earth_ly numeric(10,7),
    constellation character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: scientist scientist_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist ALTER COLUMN scientist_id SET DEFAULT nextval('public.scientist_scientist_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 2.50, false);
INSERT INTO public.galaxy VALUES (3, 'A galaxy far far away', NULL, NULL, true);
INSERT INTO public.galaxy VALUES (4, 'Mario Galaxy', NULL, NULL, true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'dwarf irregular', 0.16, false);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'dwarf irregular', 0.20, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', 3, 1738.00, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.27, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.60, 1610);
INSERT INTO public.moon VALUES (5, 'Europs', 5, 1560.80, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.10, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1882.70, 1610);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 198.20, 1789);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252.10, 1789);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 294.67, 1684);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561.00, 1684);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 763.00, 1672);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 2574.00, 1655);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 765.00, 1671);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 579.00, 1851);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 584.00, 1851);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 789.00, 1787);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 761.00, 1787);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 235.00, 1948);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353.00, 1846);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.390, 0, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.720, 0, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.000, 1, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1.520, 2, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 5.200, 95, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 9.540, 83, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 19.190, 27, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 30.070, 14, true);
INSERT INTO public.planet VALUES (9, 'Tatooine', 8, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'AB Aurigae b', 9, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Beta Pictoris b', 10, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, '51 Eridani b', 11, NULL, NULL, NULL);


--
-- Data for Name: scientist; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scientist VALUES (1, 'Copernicus', 'Thought the earth orbis the sun.');
INSERT INTO public.scientist VALUES (2, 'Kepler', 'Did astronomical calculations');
INSERT INTO public.scientist VALUES (3, 'Newton', 'Father of gravitation');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The sun', 1, 0.0000158, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 8.7094000, 'Canis Major');
INSERT INTO public.star VALUES (4, 'Procyon', 1, 4.3441000, 'Canis Minor');
INSERT INTO public.star VALUES (5, 'Vega', 1, 25.0000000, 'Lyra');
INSERT INTO public.star VALUES (6, 'Betelgeuse', 1, 550.0000000, 'Orion');
INSERT INTO public.star VALUES (7, 'Altair', 1, 17.0000000, 'Aquila');
INSERT INTO public.star VALUES (8, 'Tatoo', 3, NULL, NULL);
INSERT INTO public.star VALUES (10, 'Beta Pictoris', 1, 63.4000000, NULL);
INSERT INTO public.star VALUES (11, '51 Eridani', 1, 96.0000000, NULL);
INSERT INTO public.star VALUES (9, 'AB Aurigae', 1, 508.0000000, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scientist_scientist_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 11, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: scientist scientist_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_name_key UNIQUE (name);


--
-- Name: scientist scientist_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_pkey PRIMARY KEY (scientist_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


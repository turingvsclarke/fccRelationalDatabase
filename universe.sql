--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    lightyear_diam integer,
    shape text,
    parsecs_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying NOT NULL,
    planet_id integer,
    moon_id integer NOT NULL,
    mass numeric,
    has_water boolean,
    number_moons integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_moon_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_moon_info (
    discoverer character varying(20),
    discovery_date date,
    moon_id integer NOT NULL,
    name character varying,
    more_moon_info_id integer NOT NULL
);


ALTER TABLE public.more_moon_info OWNER TO freecodecamp;

--
-- Name: more_moon_info_more_moon_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_moon_info_more_moon_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_moon_info_more_moon_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_moon_info_more_moon_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_moon_info_more_moon_info_id_seq OWNED BY public.more_moon_info.more_moon_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying NOT NULL,
    star_id integer,
    mass numeric,
    gravity numeric,
    avg_temp integer,
    ring_system boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying NOT NULL,
    galaxy_id integer,
    star_id integer NOT NULL,
    luminosity numeric,
    km_s_rotational_velocity integer,
    constellation character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_moon_info more_moon_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_moon_info ALTER COLUMN more_moon_info_id SET DEFAULT nextval('public.more_moon_info_more_moon_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 87400, 'spiral', 0.008);
INSERT INTO public.galaxy VALUES ('Tucana III', 3, 220, NULL, 0.0229);
INSERT INTO public.galaxy VALUES ('Hydrus I', 6, 348, NULL, 0.0276);
INSERT INTO public.galaxy VALUES ('Carina III', 7, 200, NULL, 0.0278);
INSERT INTO public.galaxy VALUES ('Carina II', 12, 590, NULL, 0.0374);
INSERT INTO public.galaxy VALUES ('Pictor II', 16, 300, NULL, 0.045);
INSERT INTO public.galaxy VALUES ('Aquarius II', 17, 1040, NULL, 0.1079);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 18, 152000, 'barred spiral', 0.778);
INSERT INTO public.galaxy VALUES ('Coma Berenices Dwarf', 15, NULL, 'spheroidal', 0.042);
INSERT INTO public.galaxy VALUES ('Bootes II', 14, NULL, 'spheroidal', 0.042);
INSERT INTO public.galaxy VALUES ('Willman 1', 13, NULL, 'elliptical', 0.038);
INSERT INTO public.galaxy VALUES ('Segue 2', 11, 220, 'spheroidal', 0.035);
INSERT INTO public.galaxy VALUES ('Reticulum II', 10, 378, 'spheroidal', 0.03);
INSERT INTO public.galaxy VALUES ('Triangulum II', 9, NULL, 'spheroidal', 0.0314);
INSERT INTO public.galaxy VALUES ('Ursa Major II Dwarf', 8, 1800, 'spheroidal', 0.03);
INSERT INTO public.galaxy VALUES ('Sagittarius Dwarf', 5, 10000, 'elliptical', 0.024);
INSERT INTO public.galaxy VALUES ('Segue 1', 4, NULL, 'spheroidal', 0.023);
INSERT INTO public.galaxy VALUES ('Draco II', 2, 120, 'spheroidal', 0.0215);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Io', 5, 1, 0.08931, true, NULL);
INSERT INTO public.moon VALUES ('Europa', 5, 2, 0.04799, true, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 5, 3, 0.14819, true, NULL);
INSERT INTO public.moon VALUES ('Callisto', 5, 4, 0.18344, true, NULL);
INSERT INTO public.moon VALUES ('Juliet', 7, 5, 5.6, false, NULL);
INSERT INTO public.moon VALUES ('Rosalind', 7, 6, 2.5, false, NULL);
INSERT INTO public.moon VALUES ('Perdita', 7, 7, 0.18, false, NULL);
INSERT INTO public.moon VALUES ('Triton', 8, 8, 2.139, true, NULL);
INSERT INTO public.moon VALUES ('Nereid', 8, 9, 3.1, true, NULL);
INSERT INTO public.moon VALUES ('Proteus', 8, 10, 4.4, false, NULL);
INSERT INTO public.moon VALUES ('Neso', 8, 11, NULL, false, NULL);
INSERT INTO public.moon VALUES ('Hippocamp', 8, 12, NULL, false, NULL);
INSERT INTO public.moon VALUES ('Mimas', 6, 13, 3.75094, true, NULL);
INSERT INTO public.moon VALUES ('Pan', 6, 14, 4.3, false, NULL);
INSERT INTO public.moon VALUES ('Carme', 5, 15, NULL, false, NULL);
INSERT INTO public.moon VALUES ('Atlas', 6, 16, 5.49, false, NULL);
INSERT INTO public.moon VALUES ('Tethys', 6, 17, 61.74959, true, NULL);
INSERT INTO public.moon VALUES ('Dione', 6, 18, 109.54868, true, NULL);
INSERT INTO public.moon VALUES ('Rhea', 6, 19, 0.23064854, true, NULL);
INSERT INTO public.moon VALUES ('Hyperion', 6, 20, 0.55510, true, NULL);
INSERT INTO public.moon VALUES ('Ophelia', 7, 21, 53, false, NULL);
INSERT INTO public.moon VALUES ('Bianca', 7, 22, 92, false, NULL);


--
-- Data for Name: more_moon_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_moon_info VALUES ('Galileo Galilei', '1610-01-07', 4, NULL, 1);
INSERT INTO public.more_moon_info VALUES ('Galileo Galilei', '1610-01-07', 4, NULL, 2);
INSERT INTO public.more_moon_info VALUES ('Galileo Galilei', '1610-01-08', 2, NULL, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('TRAPPIST-1b', 1, NULL, 1.102, NULL, false, 10);
INSERT INTO public.planet VALUES ('TRAPPIST-1c', 1, NULL, 1.086, 67, false, 11);
INSERT INTO public.planet VALUES ('TRAPPIST-1d', 1, NULL, 0.624, 13, false, 12);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 1, NULL, 0.817, -24, false, 13);
INSERT INTO public.planet VALUES ('mercury', 3, 0.330, 3.7, 167, false, 1);
INSERT INTO public.planet VALUES ('venus', 3, 4.87, 8.9, 464, false, 2);
INSERT INTO public.planet VALUES ('earth', 3, 5.97, 9.8, 15, false, 3);
INSERT INTO public.planet VALUES ('mars', 3, 0.642, 3.7, -65, false, 4);
INSERT INTO public.planet VALUES ('jupiter', 3, 1898, 23.1, -110, true, 5);
INSERT INTO public.planet VALUES ('saturn', 3, 568, 9.0, -140, true, 6);
INSERT INTO public.planet VALUES ('uranus', 3, 86.8, 8.7, -195, true, 7);
INSERT INTO public.planet VALUES ('neptune', 3, 102, 11.0, -200, true, 8);
INSERT INTO public.planet VALUES ('pluto', 3, 0.013, 0.7, -225, false, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 3, 1, 2, NULL);
INSERT INTO public.star VALUES ('Gamma Aquarii', 1, 2, NULL, 80, 'Aquarius');
INSERT INTO public.star VALUES ('Alpha Centauri A', 1, 4, 1.5059, 3, 'Centaurus');
INSERT INTO public.star VALUES ('Alpha Centauri B', 1, 5, 0.4981, 1, 'Centaurus');
INSERT INTO public.star VALUES ('Proxima Centauri', 1, 6, 0.001567, 0, 'Centaurus');
INSERT INTO public.star VALUES ('TRAPPIST-1', 1, 1, 0.000553, 6, 'Aquarius');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 18, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: more_moon_info_more_moon_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_moon_info_more_moon_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_moon_info more_moon_info_more_moon_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_moon_info
    ADD CONSTRAINT more_moon_info_more_moon_info_id_key UNIQUE (more_moon_info_id);


--
-- Name: more_moon_info more_moon_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_moon_info
    ADD CONSTRAINT more_moon_info_name_key UNIQUE (name);


--
-- Name: more_moon_info more_moon_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_moon_info
    ADD CONSTRAINT more_moon_info_pkey PRIMARY KEY (more_moon_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: more_moon_info more_moon_info_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_moon_info
    ADD CONSTRAINT more_moon_info_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


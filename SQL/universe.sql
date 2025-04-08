--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(40) NOT NULL,
    is_same_galaxy_group boolean,
    galaxy_shape character varying(40),
    radius_in_1000_ly integer
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
    moon_id integer NOT NULL,
    surface_color text,
    name character varying(40) NOT NULL,
    planet_id integer,
    more_info text
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
-- Name: my_favorite_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.my_favorite_planets (
    my_favorite_planets_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.my_favorite_planets OWNER TO freecodecamp;

--
-- Name: my_favorite_planets_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.my_favorite_planets_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_favorite_planets_body_id_seq OWNER TO freecodecamp;

--
-- Name: my_favorite_planets_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.my_favorite_planets_body_id_seq OWNED BY public.my_favorite_planets.my_favorite_planets_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean,
    nr_of_moons integer,
    star_id integer,
    name character varying(40) NOT NULL
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
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_active boolean,
    masses_of_sun numeric(9,1)
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
-- Name: my_favorite_planets my_favorite_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_favorite_planets ALTER COLUMN my_favorite_planets_id SET DEFAULT nextval('public.my_favorite_planets_body_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'spiral', 110);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 'spiral', 152);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf', true, 'elliptical', 10);
INSERT INTO public.galaxy VALUES (4, 'Draco Dwarf', true, 'spheroidal', 22);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', true, 'spiral', 32);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', true, 'spiral', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'silver', 'The Moon', 3, 'The orginal moon. Seen from Earth');
INSERT INTO public.moon VALUES (2, 'silver', 'Fobos', 4, 'Bigger one');
INSERT INTO public.moon VALUES (3, 'silver', 'Deimos', 4, 'Smaller one');
INSERT INTO public.moon VALUES (4, 'yellow', 'Io', 5, NULL);
INSERT INTO public.moon VALUES (5, 'orange', 'Europa', 5, NULL);
INSERT INTO public.moon VALUES (6, 'brown', 'Ganimedes', 5, NULL);
INSERT INTO public.moon VALUES (7, 'brown', 'Kallisto', 5, NULL);
INSERT INTO public.moon VALUES (8, 'silver', 'Amaltea', 5, NULL);
INSERT INTO public.moon VALUES (9, 'silver', 'Tebe', 5, NULL);
INSERT INTO public.moon VALUES (10, 'silver', 'Adrastea', 5, NULL);
INSERT INTO public.moon VALUES (11, 'silver', 'Metis', 5, NULL);
INSERT INTO public.moon VALUES (12, 'silver', 'Temisto', 5, NULL);
INSERT INTO public.moon VALUES (13, 'silver', 'Mimas', 6, 'Round shape');
INSERT INTO public.moon VALUES (14, 'silver', 'Enceladus', 6, 'Round shape');
INSERT INTO public.moon VALUES (15, 'silver', 'Tetida', 6, 'Round shape');
INSERT INTO public.moon VALUES (16, 'silver', 'Dione', 6, 'Round shape');
INSERT INTO public.moon VALUES (17, 'silver', 'Rea', 6, 'Round shape');
INSERT INTO public.moon VALUES (18, 'yellow', 'Tytan', 6, 'Round shape');
INSERT INTO public.moon VALUES (19, 'brown', 'Hyperion', 6, 'Unregular shape');
INSERT INTO public.moon VALUES (20, 'black', 'Japet', 6, 'Round shape');


--
-- Data for Name: my_favorite_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.my_favorite_planets VALUES (1, 3, 'EARTH');
INSERT INTO public.my_favorite_planets VALUES (2, 4, 'MARS');
INSERT INTO public.my_favorite_planets VALUES (3, 8, 'UR ANUS');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, false, 0, 2, 'Mercury');
INSERT INTO public.planet VALUES (2, false, 0, 2, 'Venus');
INSERT INTO public.planet VALUES (3, true, 1, 2, 'Earth');
INSERT INTO public.planet VALUES (4, true, 2, 2, 'Mars');
INSERT INTO public.planet VALUES (5, false, 95, 2, 'Jupiter');
INSERT INTO public.planet VALUES (6, false, 274, 2, 'Saturn');
INSERT INTO public.planet VALUES (7, false, 28, 2, 'Uranus');
INSERT INTO public.planet VALUES (8, false, 16, 2, 'Neptune');
INSERT INTO public.planet VALUES (9, false, 0, 2, 'Pluto');
INSERT INTO public.planet VALUES (10, false, 0, 2, 'Ceres');
INSERT INTO public.planet VALUES (11, false, 0, 2, 'Haumea');
INSERT INTO public.planet VALUES (12, false, 0, 2, 'Makemake');
INSERT INTO public.planet VALUES (13, false, 0, 2, 'Eris');
INSERT INTO public.planet VALUES (14, NULL, NULL, 4, 'Alfa Centauri Bb');
INSERT INTO public.planet VALUES (15, NULL, NULL, 5, 'Proxima Centauri b');
INSERT INTO public.planet VALUES (16, NULL, NULL, 6, 'Tau Ceti g');
INSERT INTO public.planet VALUES (17, NULL, NULL, 6, 'Tau Ceti h');
INSERT INTO public.planet VALUES (18, NULL, NULL, 6, 'Tau Ceti e');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sagittarius A', false, 4000000.0);
INSERT INTO public.star VALUES (2, 1, 'Sun', true, 1.0);
INSERT INTO public.star VALUES (3, 1, 'Alfa Centauri A', true, 1.9);
INSERT INTO public.star VALUES (4, 1, 'Alfa Centauri B', true, 0.9);
INSERT INTO public.star VALUES (5, 1, 'Proxima Centauri', true, 0.1);
INSERT INTO public.star VALUES (6, 1, 'Tau Ceti', true, 0.7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: my_favorite_planets_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.my_favorite_planets_body_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


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
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: my_favorite_planets my_favorite_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_favorite_planets
    ADD CONSTRAINT my_favorite_planets_pkey PRIMARY KEY (my_favorite_planets_id);


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
-- Name: my_favorite_planets unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_favorite_planets
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: my_favorite_planets my_favorite_planets_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_favorite_planets
    ADD CONSTRAINT my_favorite_planets_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


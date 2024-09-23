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
    name character varying(255) NOT NULL,
    distance_from_earth_km integer NOT NULL,
    number_of_stars integer,
    has_black_hole boolean DEFAULT false,
    star_count text
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
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter_km integer NOT NULL,
    has_atmosphere boolean DEFAULT false,
    orbital_period_days integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    orbit_period_days integer NOT NULL,
    has_life boolean DEFAULT false,
    surface_temperature_k numeric NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    mass_solar_masses numeric NOT NULL,
    is_binary boolean DEFAULT false,
    temperature_k integer NOT NULL
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
-- Name: sun_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun_group (
    sun_name character varying(30),
    sun_galaxy_name character varying(30),
    sun_planet_count integer,
    sun_group_id integer NOT NULL,
    name character varying(30),
    sun_planet_moons integer NOT NULL,
    sun_planet_moons_id integer NOT NULL
);


ALTER TABLE public.sun_group OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 100000, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 1000, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 23100000, 300, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 28000000, 800, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 3000000, 50, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 21000000, 200, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (20, 'Moon', 1, 3475, true, 27);
INSERT INTO public.moon VALUES (21, 'Phobos', 3, 22, false, 0);
INSERT INTO public.moon VALUES (22, 'Deimos', 3, 12, false, 1);
INSERT INTO public.moon VALUES (23, 'Titan', 6, 5150, true, 16);
INSERT INTO public.moon VALUES (24, 'Europa', 11, 3122, false, 4);
INSERT INTO public.moon VALUES (25, 'Ganymede', 6, 5262, false, 7);
INSERT INTO public.moon VALUES (26, 'Io', 12, 3643, false, 2);
INSERT INTO public.moon VALUES (27, 'Callisto', 12, 4822, false, 17);
INSERT INTO public.moon VALUES (28, 'Enceladus', 6, 504, false, 1);
INSERT INTO public.moon VALUES (29, 'Rhea', 6, 1528, false, 5);
INSERT INTO public.moon VALUES (30, 'Triton', 6, 2707, true, 6);
INSERT INTO public.moon VALUES (31, 'Charon', 9, 1212, false, 6);
INSERT INTO public.moon VALUES (32, 'Dione', 6, 1124, false, 3);
INSERT INTO public.moon VALUES (33, 'Tethys', 6, 1062, false, 2);
INSERT INTO public.moon VALUES (34, 'Hyperion', 6, 271, false, 21);
INSERT INTO public.moon VALUES (35, 'Iapetus', 6, 1470, false, 79);
INSERT INTO public.moon VALUES (36, 'Phoebe', 6, 220, false, 551);
INSERT INTO public.moon VALUES (37, 'Mimas', 6, 396, false, 1);
INSERT INTO public.moon VALUES (38, 'Miranda', 6, 472, false, 1);
INSERT INTO public.moon VALUES (39, 'Oberon', 6, 1524, false, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 365, true, 288.15);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 687, false, 210.15);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 225, false, 737);
INSERT INTO public.planet VALUES (4, 'Jupiter', 3, 4333, false, 165);
INSERT INTO public.planet VALUES (5, 'Saturn', 3, 10759, false, 134);
INSERT INTO public.planet VALUES (6, 'Neptune', 3, 60190, false, 72);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, 88, false, 430);
INSERT INTO public.planet VALUES (8, 'Uranus', 3, 30687, false, 76);
INSERT INTO public.planet VALUES (9, 'Pluto', 2, 90560, false, 44);
INSERT INTO public.planet VALUES (10, 'Titan', 6, 16, false, 94);
INSERT INTO public.planet VALUES (11, 'Europa', 6, 4, true, 110);
INSERT INTO public.planet VALUES (12, 'Io', 6, 2, false, 130);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 2.1, false, 9940);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 20.0, false, 3500);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 1.1, true, 5790);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 0.12, false, 2340);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 21.0, true, 12100);
INSERT INTO public.star VALUES (6, 'Antares', 2, 15.0, false, 3500);


--
-- Data for Name: sun_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun_group VALUES ('SUN', 'MILKY WAY', 9, 1, 'sol', 50, 10);
INSERT INTO public.sun_group VALUES ('AND SUN', 'ANDROMEDA GAL', 30, 2, 'and', 100, 11);
INSERT INTO public.sun_group VALUES ('SAG SUN', 'SAGITT GAL', 30, 3, 'sag', 200, 12);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 39, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: sun_group sun_group_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun_group
    ADD CONSTRAINT sun_group_pkey PRIMARY KEY (sun_group_id);


--
-- Name: sun_group sun_group_sun_planet_moons_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun_group
    ADD CONSTRAINT sun_group_sun_planet_moons_id_key UNIQUE (sun_planet_moons_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


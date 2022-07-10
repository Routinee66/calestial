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
    name character varying(50) NOT NULL,
    constellation character varying(50),
    diameter_in_light_years integer,
    distance_from_earth_in_light_years integer,
    type character varying(50)
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
-- Name: galaxy_satelite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_satelite (
    galaxy_satelite_id integer NOT NULL,
    constellation character varying(50),
    diameter_in_light_years integer,
    distance_from_earth_in_light_years integer,
    is_dwarf_type boolean,
    galaxy_id integer,
    name character varying(50) NOT NULL
);


ALTER TABLE public.galaxy_satelite OWNER TO freecodecamp;

--
-- Name: galaxy_satelite_galaxy_satelite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_satelite_galaxy_satelite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_satelite_galaxy_satelite_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_satelite_galaxy_satelite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_satelite_galaxy_satelite_id_seq OWNED BY public.galaxy_satelite.galaxy_satelite_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    orbital_semi_major_axis_in_km integer,
    year_discovery integer,
    discovered_by character varying(50),
    notes text,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    orbital_period_in_days real,
    distance_to_star_in_au real,
    planet_radius_relative_to_earth numeric(4,2),
    planet_mass_relative_to_earth real,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    mass_in_solar_mass numeric(3,2),
    temperature_in_k integer,
    age_in_gyr numeric(4,2),
    notes text,
    galaxy_id integer NOT NULL,
    planets integer
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
-- Name: galaxy_satelite galaxy_satelite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_satelite ALTER COLUMN galaxy_satelite_id SET DEFAULT nextval('public.galaxy_satelite_galaxy_satelite_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 100000, 0, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda', 2200000, 2500000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Triangulum', 60000, 3000000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Centaurus', 97000, 13000000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Virgo', 50000, 29350000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Tadpole Galaxy', 'Draco', 280000, 420000000, 'Spiral');


--
-- Data for Name: galaxy_satelite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_satelite VALUES (1, 'Dorado/Mensa', 14000, 158000, true, 1, 'Large Magellanic Cloud');
INSERT INTO public.galaxy_satelite VALUES (2, 'Tucana', 7000, 160000, true, 1, 'Small Magellanic Cloud');
INSERT INTO public.galaxy_satelite VALUES (3, 'Sagittarius', 10000, 70000, true, 1, 'Sagittarius Dwarf');
INSERT INTO public.galaxy_satelite VALUES (4, 'Antlia', NULL, 130000, true, 1, 'Antlia II');
INSERT INTO public.galaxy_satelite VALUES (5, 'Canis Major', NULL, 25000, true, 1, 'Canis Major Dwarf');
INSERT INTO public.galaxy_satelite VALUES (6, 'Ursa Minor', NULL, 225000, true, 1, 'Ursa Minor Dwarf');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 9380, 1877, 'Hall', NULL, 4);
INSERT INTO public.moon VALUES (2, 'Deimos', 23460, 1877, 'Hall', NULL, 4);
INSERT INTO public.moon VALUES (3, 'Io', 421800, 1610, 'Galileo', 'Main-group moon (Galilean)', 5);
INSERT INTO public.moon VALUES (4, 'Europa', 671100, 1610, 'Galileo', 'Main-group moon (Galilean)', 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1070400, 1610, 'Galileo', 'Main-group moon (Galilean)', 5);
INSERT INTO public.moon VALUES (6, 'Calisto', 1882700, 1610, 'Galileo', 'Main-group moon (Galilean)', 5);
INSERT INTO public.moon VALUES (7, 'Amalthea', 181400, 1892, 'Barnard', 'Inner moon (Amalthea)', 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 185540, 1789, 'Herschel', 'Main-group moon', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 238040, 1789, 'Herschel', 'Main-group moon', 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 294670, 1684, 'Cassini', 'Main-group moon (Sidera Lodoicea)', 6);
INSERT INTO public.moon VALUES (11, 'Dione', 377420, 1684, 'Cassini', 'Main-group moon (Sidera Lodoicea)', 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 527070, 1672, 'Cassini', 'Main-group moon (Sidera Lodoicea)', 6);
INSERT INTO public.moon VALUES (13, 'Ariel', 190900, 1851, 'Lassell', 'Main-group moon', 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 266000, 1851, 'Lassell', 'Main-group moon', 7);
INSERT INTO public.moon VALUES (15, 'Titania', 436300, 1787, 'Herschel', 'Main-group moon', 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 58300, 1787, 'Herschel', 'Main-group moon', 7);
INSERT INTO public.moon VALUES (17, 'Triton', 354800, 1846, 'Lassell', 'Retrograde irregular', 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 5513820, 1949, 'Kuiper', 'Prograde irregular', 8);
INSERT INTO public.moon VALUES (19, 'Naiad', 48224, 1989, 'Terrile (Voyager 2)', 'Inner moon', 8);
INSERT INTO public.moon VALUES (20, 'Thalassa', 50075, 1989, 'Terrile (Voyager 2)', 'Inner moon', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 87.97, 0.387, 0.38, 0.06, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 224.7, 0.723, 0.95, 0.82, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 365.26, 1, 1.00, 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 686.98, 1.53, 0.53, 0.11, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4331, 5.2, 10.97, 317.83, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 10747, 9.58, 9.14, 95.16, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 30660, 19.2, 3.98, 14.54, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 60148, 30.1, 3.87, 17.15, false, 1);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1b', 1.51, 0.011, 1.09, 0.85, false, 3);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1c', 2.42, 0.015, 1.06, 1.38, false, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 4.05, 0.021, 0.77, 0.41, false, 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 6.1, 0.028, 0.92, 0.62, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, 5778, 4.57, 'Pluto was considered as the ninth planet from its discovery in 1930 to 2006, but is now considered to be a dwarf planet instead, along with Ceres, Haumea, Makemake and Eris. The hypothesised Planet Nine remains unconfirmed', 1, 8);
INSERT INTO public.star VALUES (2, 'Gliese 876', 0.33, 3348, 4.89, 'Planet b is a gas giant which orbits in the habitate zone.', 1, 4);
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 0.09, 2550, 7.60, 'Planet d, e, f and g are potentially habitate. Only star known with exactly seven confirmed planets. All seven terrestrial planets lie within only 0.07 AU of the star.', 1, 7);
INSERT INTO public.star VALUES (4, 'Kepler-90', 1.13, 5930, 2.00, 'All eight exoplanets are more massive than earth and are within 1.1 AU of the parent star. Only star apart from the sun with at least eight planets. A Hill stability test shows that the system is stable. Planet h orbits in the habitable zone.', 1, 8);
INSERT INTO public.star VALUES (5, 'Proxima  Centauri', 0.12, 3042, 4.85, 'Closest star to the Sun and the closest star to the Sun with a multiplanetary system. Planet b is potentially habitable. Planet c unconfirmed by RV data, but nonetheless undisputed by astrometry', 1, 3);
INSERT INTO public.star VALUES (6, 'HD 219134', 0.79, 4699, 12.66, 'Closest star to the Sun with exactly sixexoplanets, and closest K-type main sequence star to the Sun with a multiplanetary system. One of the oldest stars with a multplanetary system, although it is still more metal-rich than the Sun.', 1, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_satelite_galaxy_satelite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_satelite_galaxy_satelite_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


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
-- Name: galaxy_satelite galaxy_satelite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_satelite
    ADD CONSTRAINT galaxy_satelite_name_key UNIQUE (name);


--
-- Name: galaxy_satelite galaxy_satelite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_satelite
    ADD CONSTRAINT galaxy_satelite_pkey PRIMARY KEY (galaxy_satelite_id);


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
-- Name: galaxy_satelite galaxy_satelite_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_satelite
    ADD CONSTRAINT galaxy_satelite_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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


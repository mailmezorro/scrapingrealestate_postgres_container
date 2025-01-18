--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: log_deltas(); Type: FUNCTION; Schema: public; Owner: user_name
--

CREATE FUNCTION public.log_deltas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Log price changes in price_deltas
    IF NEW.price IS DISTINCT FROM OLD.price THEN
        INSERT INTO kleinanzeigen_price_deltas (id_ad, old_price, new_price, scrape_date)
        VALUES (OLD.id_ad, OLD.price, NEW.price, NOW());
    END IF;

    -- Log changes of the view counter in view_counter_deltas
    IF NEW.view_counter IS DISTINCT FROM OLD.view_counter THEN
        INSERT INTO Kleinanzeigen_view_counter_deltas (id_ad, old_view_counter, new_view_counter, scrape_date)
        VALUES (OLD.id_ad, OLD.view_counter, NEW.view_counter, NOW());
    END IF;

    -- Log generic changes in kleinanzeigen_deltas
	IF NEW.title IS DISTINCT FROM OLD.title THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'title', OLD.title, NEW.title, NOW());
    END IF;

    IF NEW.location IS DISTINCT FROM OLD.location THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'location', OLD.location, NEW.location, NOW());
    END IF;

    IF NEW.description IS DISTINCT FROM OLD.description THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'description', OLD.description, NEW.description, NOW());
    END IF;

    IF NEW.creation_date IS DISTINCT FROM OLD.creation_date THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'creation_date', OLD.creation_date, NEW.creation_date, NOW());
    END IF;

    IF NEW.bedrooms IS DISTINCT FROM OLD.bedrooms THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'bedrooms', OLD.bedrooms, NEW.bedrooms, NOW());
    END IF;

    IF NEW.living_area IS DISTINCT FROM OLD.living_area THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'living_area', OLD.living_area, NEW.living_area, NOW());
    END IF;

    IF NEW.plot_area IS DISTINCT FROM OLD.plot_area THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'plot_area', OLD.plot_area, NEW.plot_area, NOW());
    END IF;

    IF NEW.rooms IS DISTINCT FROM OLD.rooms THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'rooms', OLD.rooms, NEW.rooms, NOW());
    END IF;

    IF NEW.bathrooms IS DISTINCT FROM OLD.bathrooms THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'bathrooms', OLD.bathrooms, NEW.bathrooms, NOW());
    END IF;

    IF NEW.floors IS DISTINCT FROM OLD.floors THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'floors', OLD.floors, NEW.floors, NOW());
    END IF;

    IF NEW.commission IS DISTINCT FROM OLD.commission THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'commission', OLD.commission, NEW.commission, NOW());
    END IF;

    IF NEW.house_type IS DISTINCT FROM OLD.house_type THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'house_type', OLD.house_type, NEW.house_type, NOW());
    END IF;

    IF NEW.year_built IS DISTINCT FROM OLD.year_built THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'year_built', OLD.year_built, NEW.year_built, NOW());
    END IF;

    IF NEW.seller_name IS DISTINCT FROM OLD.seller_name THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'seller_name', OLD.seller_name, NEW.seller_name, NOW());
    END IF;

    IF NEW.number_of_ads IS DISTINCT FROM OLD.number_of_ads THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'number_of_ads', OLD.number_of_ads, NEW.number_of_ads, NOW());
    END IF;

    IF NEW.link IS DISTINCT FROM OLD.link THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'link', OLD.link, NEW.link, NOW());
    END IF;

    IF NEW.user_type IS DISTINCT FROM OLD.user_type THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'user_type', OLD.user_type, NEW.user_type, NOW());
    END IF;

    IF NEW.active_since IS DISTINCT FROM OLD.active_since THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'active_since', OLD.active_since, NEW.active_since, NOW());
    END IF;

    IF NEW.longitude IS DISTINCT FROM OLD.longitude THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'longitude', OLD.longitude, NEW.longitude, NOW());
    END IF;

    IF NEW.latitude IS DISTINCT FROM OLD.latitude THEN
        INSERT INTO kleinanzeigen_deltas (id_ad, attribute_name, old_value, new_value, scrape_date)
        VALUES (OLD.id_ad, 'latitude', OLD.latitude, NEW.latitude, NOW());
    END IF;

    -- Set the delta flag if a change is detected
    IF (
        NEW.title IS DISTINCT FROM OLD.title OR
        NEW.location IS DISTINCT FROM OLD.location OR
        NEW.description IS DISTINCT FROM OLD.description OR
        NEW.creation_date IS DISTINCT FROM OLD.creation_date OR
        NEW.bedrooms IS DISTINCT FROM OLD.bedrooms OR
        NEW.living_area IS DISTINCT FROM OLD.living_area OR
        NEW.plot_area IS DISTINCT FROM OLD.plot_area OR
        NEW.rooms IS DISTINCT FROM OLD.rooms OR
        NEW.bathrooms IS DISTINCT FROM OLD.bathrooms OR
        NEW.floors IS DISTINCT FROM OLD.floors OR
        NEW.commission IS DISTINCT FROM OLD.commission OR
        NEW.house_type IS DISTINCT FROM OLD.house_type OR
        NEW.year_built IS DISTINCT FROM OLD.year_built OR
        NEW.seller_name IS DISTINCT FROM OLD.seller_name OR
        NEW.number_of_ads IS DISTINCT FROM OLD.number_of_ads OR
        NEW.link IS DISTINCT FROM OLD.link OR
        NEW.user_type IS DISTINCT FROM OLD.user_type OR
        NEW.longitude IS DISTINCT FROM OLD.longitude OR
        NEW.latitude IS DISTINCT FROM OLD.latitude
    ) THEN
        UPDATE kleinanzeigen_houses
        SET delta_flag = TRUE
        WHERE id_ad = OLD.id_ad;
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.log_deltas() OWNER TO user_name;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: kleinanzeigen_deltas; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.kleinanzeigen_deltas (
    id integer NOT NULL,
    id_ad bigint,
    attribute_name text,
    old_value text,
    new_value text,
    scrape_date timestamp without time zone
);

-- Replace user_name with your's

ALTER TABLE public.kleinanzeigen_deltas OWNER TO user_name;

--
-- Name: kleinanzeigen_deltas_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.kleinanzeigen_deltas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kleinanzeigen_deltas_id_seq OWNER TO user_name;

--
-- Name: kleinanzeigen_deltas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.kleinanzeigen_deltas_id_seq OWNED BY public.kleinanzeigen_deltas.id;


--
-- Name: kleinanzeigen_houses; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.kleinanzeigen_houses (
    id_ad bigint NOT NULL,
    title text,
    price numeric,
    location text,
    description text,
    creation_date date,
    scrape_date timestamp without time zone,
    bedrooms integer,
    living_area numeric,
    plot_area numeric,
    rooms integer,
    bathrooms integer,
    floors integer,
    commission text,
    house_type text,
    year_built integer,
    view_counter integer,
    active_flag boolean,
    seller_name text,
    number_of_ads integer,
    link text,
    user_type text,
    active_since date,
    longitude numeric,
    latitude numeric,
    delta_flag boolean
);


ALTER TABLE public.kleinanzeigen_houses OWNER TO user_name;

--
-- Name: kleinanzeigen_price_deltas; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.kleinanzeigen_price_deltas (
    id integer NOT NULL,
    id_ad bigint,
    old_price numeric,
    new_price numeric,
    scrape_date timestamp without time zone
);


ALTER TABLE public.kleinanzeigen_price_deltas OWNER TO user_name;

--
-- Name: kleinanzeigen_price_deltas_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.kleinanzeigen_price_deltas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kleinanzeigen_price_deltas_id_seq OWNER TO user_name;

--
-- Name: kleinanzeigen_price_deltas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.kleinanzeigen_price_deltas_id_seq OWNED BY public.kleinanzeigen_price_deltas.id;


--
-- Name: kleinanzeigen_view_counter_deltas; Type: TABLE; Schema: public; Owner: user_name
--

CREATE TABLE public.kleinanzeigen_view_counter_deltas (
    id integer NOT NULL,
    id_ad bigint,
    old_view_counter numeric,
    new_view_counter numeric,
    scrape_date timestamp without time zone
);


ALTER TABLE public.kleinanzeigen_view_counter_deltas OWNER TO user_name;

--
-- Name: kleinanzeigen_view_counter_deltas_id_seq; Type: SEQUENCE; Schema: public; Owner: user_name
--

CREATE SEQUENCE public.kleinanzeigen_view_counter_deltas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kleinanzeigen_view_counter_deltas_id_seq OWNER TO user_name;

--
-- Name: kleinanzeigen_view_counter_deltas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user_name
--

ALTER SEQUENCE public.kleinanzeigen_view_counter_deltas_id_seq OWNED BY public.kleinanzeigen_view_counter_deltas.id;


--
-- Name: kleinanzeigen_deltas id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_deltas ALTER COLUMN id SET DEFAULT nextval('public.kleinanzeigen_deltas_id_seq'::regclass);


--
-- Name: kleinanzeigen_price_deltas id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_price_deltas ALTER COLUMN id SET DEFAULT nextval('public.kleinanzeigen_price_deltas_id_seq'::regclass);


--
-- Name: kleinanzeigen_view_counter_deltas id; Type: DEFAULT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_view_counter_deltas ALTER COLUMN id SET DEFAULT nextval('public.kleinanzeigen_view_counter_deltas_id_seq'::regclass);


--
-- Name: kleinanzeigen_deltas kleinanzeigen_deltas_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_deltas
    ADD CONSTRAINT kleinanzeigen_deltas_pkey PRIMARY KEY (id);


--
-- Name: kleinanzeigen_houses kleinanzeigen_houses_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_houses
    ADD CONSTRAINT kleinanzeigen_houses_pkey PRIMARY KEY (id_ad);


--
-- Name: kleinanzeigen_price_deltas kleinanzeigen_price_deltas_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_price_deltas
    ADD CONSTRAINT kleinanzeigen_price_deltas_pkey PRIMARY KEY (id);


--
-- Name: kleinanzeigen_view_counter_deltas kleinanzeigen_view_counter_deltas_pkey; Type: CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_view_counter_deltas
    ADD CONSTRAINT kleinanzeigen_view_counter_deltas_pkey PRIMARY KEY (id);


--
-- Name: kleinanzeigen_houses after_update_main_table; Type: TRIGGER; Schema: public; Owner: user_name
--

CREATE TRIGGER after_update_main_table AFTER UPDATE ON public.kleinanzeigen_houses FOR EACH ROW EXECUTE FUNCTION public.log_deltas();


--
-- Name: kleinanzeigen_deltas kleinanzeigen_deltas_id_ad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_deltas
    ADD CONSTRAINT kleinanzeigen_deltas_id_ad_fkey FOREIGN KEY (id_ad) REFERENCES public.kleinanzeigen_houses(id_ad) ON DELETE CASCADE;


--
-- Name: kleinanzeigen_price_deltas kleinanzeigen_price_deltas_id_ad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_price_deltas
    ADD CONSTRAINT kleinanzeigen_price_deltas_id_ad_fkey FOREIGN KEY (id_ad) REFERENCES public.kleinanzeigen_houses(id_ad) ON DELETE CASCADE;


--
-- Name: kleinanzeigen_view_counter_deltas kleinanzeigen_view_counter_deltas_id_ad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user_name
--

ALTER TABLE ONLY public.kleinanzeigen_view_counter_deltas
    ADD CONSTRAINT kleinanzeigen_view_counter_deltas_id_ad_fkey FOREIGN KEY (id_ad) REFERENCES public.kleinanzeigen_houses(id_ad) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


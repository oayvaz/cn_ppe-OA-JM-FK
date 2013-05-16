--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.0
-- Dumped by pg_dump version 9.2.0
-- Started on 2013-04-19 16:37:15

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2099 (class 1262 OID 57344)
-- Name: ConstructionNouvelles; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ConstructionNouvelles" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE "ConstructionNouvelles" OWNER TO postgres;

\connect "ConstructionNouvelles"

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 190 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 190
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 168 (class 1259 OID 57345)
-- Name: agence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE agence (
    id integer NOT NULL,
    nom character varying(50),
    adresse character varying(50),
    cp character varying(5),
    ville character varying(50)
);


ALTER TABLE public.agence OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 57348)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client (
    id integer NOT NULL,
    "nomClient" character varying(50),
    "prenomClient" character varying(50),
    "adresseClient" character varying(150),
    "cpClient" character varying(5),
    "villeClient" character varying(50),
    "mailClient" character varying(50),
    login character varying(50),
    mdp integer,
    "typeUtilisateur" integer
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 57351)
-- Name: commerciale; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE commerciale (
    id_visite integer NOT NULL,
    "dateVisite_visite" timestamp without time zone DEFAULT now() NOT NULL,
    description_visite character varying(500),
    id_projet integer
);


ALTER TABLE public.commerciale OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 106753)
-- Name: comptable; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comptable (
    id integer NOT NULL,
    nom text,
    login text,
    mdp text
);


ALTER TABLE public.comptable OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 106751)
-- Name: comptable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comptable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comptable_id_seq OWNER TO postgres;

--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 188
-- Name: comptable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comptable_id_seq OWNED BY comptable.id;


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 188
-- Name: comptable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comptable_id_seq', 1, false);


--
-- TOC entry 171 (class 1259 OID 57358)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contact (
    id integer NOT NULL,
    "dateContact" timestamp without time zone DEFAULT now() NOT NULL,
    resume character varying(200),
    id_client integer
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 57362)
-- Name: contrainte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contrainte (
    id integer NOT NULL,
    descriptif character varying(500),
    plan character varying(200),
    id_specialiste integer
);


ALTER TABLE public.contrainte OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 57368)
-- Name: envisager; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE envisager (
    etendue integer,
    priorite integer,
    id_secteur integer NOT NULL,
    id_projet integer NOT NULL
);


ALTER TABLE public.envisager OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 57371)
-- Name: examiner; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE examiner (
    "compteRendu" character varying(500),
    id_visite integer NOT NULL,
    id_specialiste integer NOT NULL
);


ALTER TABLE public.examiner OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 106742)
-- Name: infoPret; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "infoPret" (
    "montantProjet" integer NOT NULL,
    nom text NOT NULL,
    prenom text NOT NULL,
    adresse text NOT NULL,
    cp text NOT NULL,
    telephone text NOT NULL,
    mail text NOT NULL,
    "montantApport" integer NOT NULL,
    "dureeEmprunt" integer NOT NULL,
    age integer NOT NULL,
    ville text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public."infoPret" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 106740)
-- Name: infoPret_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "infoPret_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."infoPret_id_seq" OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 186
-- Name: infoPret_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "infoPret_id_seq" OWNED BY "infoPret".id;


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 186
-- Name: infoPret_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"infoPret_id_seq"', 40, true);


--
-- TOC entry 185 (class 1259 OID 90125)
-- Name: note; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE note (
    id integer NOT NULL,
    contenu text,
    date date,
    importance integer,
    valide boolean,
    personnel integer
);


ALTER TABLE public.note OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 90123)
-- Name: note_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_id_seq OWNER TO postgres;

--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 184
-- Name: note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE note_id_seq OWNED BY note.id;


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 184
-- Name: note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('note_id_seq', 1, false);


--
-- TOC entry 175 (class 1259 OID 57377)
-- Name: personnel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personnel (
    id integer NOT NULL,
    nom character varying(50),
    prenom character varying(50),
    mail character varying(100),
    telephone character varying(10),
    mdp character varying(200),
    id_agence integer,
    login character varying(50),
    "typeUtilisateur" integer
);


ALTER TABLE public.personnel OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 57380)
-- Name: projet; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE projet (
    id integer NOT NULL,
    budget double precision,
    descriptif character varying(500),
    precisions character varying(1500),
    "rechercheTerrain" boolean,
    id_terrain integer,
    id_personnel integer,
    id_personnel1 integer,
    id_client integer
);


ALTER TABLE public.projet OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 57386)
-- Name: proposition; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proposition (
    id integer NOT NULL,
    tarif double precision,
    plan character varying(200),
    "valideOK" boolean,
    descriptif character varying(500),
    id_visite integer
);


ALTER TABLE public.proposition OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 57392)
-- Name: secteur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE secteur (
    id integer NOT NULL,
    descriptif character varying(200),
    latitude double precision,
    longitude double precision,
    "codePostal" character varying(5)
);


ALTER TABLE public.secteur OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 57395)
-- Name: specialiste; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE specialiste (
    id integer NOT NULL,
    metier character varying(50)
);


ALTER TABLE public.specialiste OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 57398)
-- Name: technique; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE technique (
    id_visite integer NOT NULL,
    "dateVisite_visite" timestamp without time zone DEFAULT now() NOT NULL,
    description_visite character varying(500),
    id_projet integer
);


ALTER TABLE public.technique OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 57405)
-- Name: terrain; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE terrain (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    superficie integer,
    plan character varying(500),
    prix double precision,
    id_secteur integer
);


ALTER TABLE public.terrain OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 57411)
-- Name: typeUtilisateur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "typeUtilisateur" (
    "idUtilisateur" integer,
    "nomUtilisateur" character varying(50)
);


ALTER TABLE public."typeUtilisateur" OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 57414)
-- Name: visite; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE visite (
    id integer NOT NULL,
    "dateVisite" timestamp without time zone DEFAULT now() NOT NULL,
    description character varying(500),
    id_projet integer
);


ALTER TABLE public.visite OWNER TO postgres;

--
-- TOC entry 2009 (class 2604 OID 106756)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comptable ALTER COLUMN id SET DEFAULT nextval('comptable_id_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 106745)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "infoPret" ALTER COLUMN id SET DEFAULT nextval('"infoPret_id_seq"'::regclass);


--
-- TOC entry 2007 (class 2604 OID 90128)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note ALTER COLUMN id SET DEFAULT nextval('note_id_seq'::regclass);


--
-- TOC entry 2076 (class 0 OID 57345)
-- Dependencies: 168
-- Data for Name: agence; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2077 (class 0 OID 57348)
-- Dependencies: 169
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO client VALUES (1, 'toto', 'tata', '1 alle du port', '11111', 'Bar', NULL, 'toto', 1234, 3);


--
-- TOC entry 2078 (class 0 OID 57351)
-- Dependencies: 170
-- Data for Name: commerciale; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2094 (class 0 OID 106753)
-- Dependencies: 189
-- Data for Name: comptable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO comptable VALUES (1, 'Ayvaz', 'oayvaz', '1234');


--
-- TOC entry 2079 (class 0 OID 57358)
-- Dependencies: 171
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2080 (class 0 OID 57362)
-- Dependencies: 172
-- Data for Name: contrainte; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2081 (class 0 OID 57368)
-- Dependencies: 173
-- Data for Name: envisager; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2082 (class 0 OID 57371)
-- Dependencies: 174
-- Data for Name: examiner; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2093 (class 0 OID 106742)
-- Dependencies: 187
-- Data for Name: infoPret; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "infoPret" VALUES (100000, 'Deycard', 'Marc', '8 rue du pont levis', '55000', '0678987458', 'Marc.Deycard@gmail.com', 50000, 19, 30, 'Bar-le-Duc', 34);
INSERT INTO "infoPret" VALUES (25000, 'Ayvaz', 'Osman', '7 rue des turcs', '15478', '0678987458', 'Osman.Ayvaz@gmail.com', 5000, 15, 30, 'Turcville', 35);
INSERT INTO "infoPret" VALUES (14520, 'Kastendeuch', 'Frédéric', '9 rue de la mairie', '55000', '0673343274', 'frederic.kastendeuch@gmail.com', 3000, 9, 51, 'Bar-le-Duc', 36);
INSERT INTO "infoPret" VALUES (100000, 'Dondelinger', 'Eric', '15 rue des DoNdOns de la Farce', '98654', '067898745', 'Eric.Dondelinger@gmail.com', 50000, 15, 30, 'Dondonville', 37);
INSERT INTO "infoPret" VALUES (100000, 'Garovo', 'Martine', 'salle 204', '55000', '0327180212', 'Garovo.Martine@gmail.com', 50000, 15, 30, 'Bar-le-Duc', 38);
INSERT INTO "infoPret" VALUES (100000, 'Mougin', 'Jason', '8 rue de l''eglise', '57360', '0678459878', 'Jason.Mougin@gmail.com', 50000, 15, 30, 'Amnéville', 39);
INSERT INTO "infoPret" VALUES (100000, 'Moschetta', 'Adrien', '14 rue des américains', '57260', '0678984584', 'Mosketa@live.fr', 50000, 15, 30, 'Algrange', 40);


--
-- TOC entry 2092 (class 0 OID 90125)
-- Dependencies: 185
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO note VALUES (1, 'Rendez vous avec le maire', '2013-04-12', 3, false, 2);
INSERT INTO note VALUES (2, 'Rendez vous a 17h', '2013-12-12', 3, true, 2);


--
-- TOC entry 2083 (class 0 OID 57377)
-- Dependencies: 175
-- Data for Name: personnel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personnel VALUES (1, 'taya', 'toyo', NULL, NULL, '1234', NULL, 'taya', 1);
INSERT INTO personnel VALUES (2, 'tata', 'tata', NULL, NULL, '1234', NULL, 'tata', 2);
INSERT INTO personnel VALUES (3, 'tutu', 'tutu', NULL, NULL, '1234', NULL, 'tutu', 2);


--
-- TOC entry 2084 (class 0 OID 57380)
-- Dependencies: 176
-- Data for Name: projet; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2085 (class 0 OID 57386)
-- Dependencies: 177
-- Data for Name: proposition; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2086 (class 0 OID 57392)
-- Dependencies: 178
-- Data for Name: secteur; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2087 (class 0 OID 57395)
-- Dependencies: 179
-- Data for Name: specialiste; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2088 (class 0 OID 57398)
-- Dependencies: 180
-- Data for Name: technique; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2089 (class 0 OID 57405)
-- Dependencies: 181
-- Data for Name: terrain; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO terrain VALUES (2, 543, 53, 523, '123', 21, NULL);
INSERT INTO terrain VALUES (3, 543, 53, 523, '123', 21, NULL);
INSERT INTO terrain VALUES (4, 543, 53, 523, '123', 21, NULL);
INSERT INTO terrain VALUES (8, 42, 12, 12, 'fyg', 412, NULL);
INSERT INTO terrain VALUES (9, 45, 45, 45, 'fuy', 0, NULL);
INSERT INTO terrain VALUES (11, 545454, 51555552, 1000000, '1548', 12, NULL);
INSERT INTO terrain VALUES (10, 48.778590999999999, 5.1583670000000001, 7835, '5555', 68763, NULL);
INSERT INTO terrain VALUES (12, 87, 78, 120, '100', 50, NULL);


--
-- TOC entry 2090 (class 0 OID 57411)
-- Dependencies: 182
-- Data for Name: typeUtilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "typeUtilisateur" VALUES (1, 'Direction');
INSERT INTO "typeUtilisateur" VALUES (2, 'Commercial');
INSERT INTO "typeUtilisateur" VALUES (3, 'Client');


--
-- TOC entry 2091 (class 0 OID 57414)
-- Dependencies: 183
-- Data for Name: visite; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2057 (class 2606 OID 106750)
-- Name: Primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "infoPret"
    ADD CONSTRAINT "Primaire" PRIMARY KEY (id);


--
-- TOC entry 2011 (class 2606 OID 57422)
-- Name: agence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agence
    ADD CONSTRAINT agence_pkey PRIMARY KEY (id);


--
-- TOC entry 2013 (class 2606 OID 57424)
-- Name: client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 2016 (class 2606 OID 57426)
-- Name: commerciale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY commerciale
    ADD CONSTRAINT commerciale_pkey PRIMARY KEY (id_visite);


--
-- TOC entry 2019 (class 2606 OID 57428)
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2022 (class 2606 OID 57430)
-- Name: contrainte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contrainte
    ADD CONSTRAINT contrainte_pkey PRIMARY KEY (id);


--
-- TOC entry 2025 (class 2606 OID 57432)
-- Name: envisager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY envisager
    ADD CONSTRAINT envisager_pkey PRIMARY KEY (id_secteur, id_projet);


--
-- TOC entry 2028 (class 2606 OID 57434)
-- Name: examiner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY examiner
    ADD CONSTRAINT examiner_pkey PRIMARY KEY (id_visite, id_specialiste);


--
-- TOC entry 2055 (class 2606 OID 90133)
-- Name: note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- TOC entry 2031 (class 2606 OID 57436)
-- Name: personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personnel
    ADD CONSTRAINT personnel_pkey PRIMARY KEY (id);


--
-- TOC entry 2037 (class 2606 OID 57438)
-- Name: projet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY projet
    ADD CONSTRAINT projet_pkey PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 57440)
-- Name: proposition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proposition
    ADD CONSTRAINT proposition_pkey PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 57442)
-- Name: secteur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY secteur
    ADD CONSTRAINT secteur_pkey PRIMARY KEY (id);


--
-- TOC entry 2044 (class 2606 OID 57444)
-- Name: specialiste_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY specialiste
    ADD CONSTRAINT specialiste_pkey PRIMARY KEY (id);


--
-- TOC entry 2047 (class 2606 OID 57446)
-- Name: technique_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY technique
    ADD CONSTRAINT technique_pkey PRIMARY KEY (id_visite);


--
-- TOC entry 2050 (class 2606 OID 57448)
-- Name: terrain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY terrain
    ADD CONSTRAINT terrain_pkey PRIMARY KEY (id);


--
-- TOC entry 2053 (class 2606 OID 57450)
-- Name: visite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY visite
    ADD CONSTRAINT visite_pkey PRIMARY KEY (id);


--
-- TOC entry 2014 (class 1259 OID 57451)
-- Name: commerciale_FK_commerciale_id_projet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "commerciale_FK_commerciale_id_projet" ON commerciale USING btree (id_projet);


--
-- TOC entry 2017 (class 1259 OID 57452)
-- Name: contact_FK_contact_id_client; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "contact_FK_contact_id_client" ON contact USING btree (id_client);


--
-- TOC entry 2020 (class 1259 OID 57453)
-- Name: contrainte_FK_contrainte_id_specialiste; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "contrainte_FK_contrainte_id_specialiste" ON contrainte USING btree (id_specialiste);


--
-- TOC entry 2023 (class 1259 OID 57454)
-- Name: envisager_FK_envisager_id_projet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "envisager_FK_envisager_id_projet" ON envisager USING btree (id_projet);


--
-- TOC entry 2026 (class 1259 OID 57455)
-- Name: examiner_FK_examiner_id_specialiste; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "examiner_FK_examiner_id_specialiste" ON examiner USING btree (id_specialiste);


--
-- TOC entry 2029 (class 1259 OID 57456)
-- Name: personnel_FK_personnel_id_agence; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "personnel_FK_personnel_id_agence" ON personnel USING btree (id_agence);


--
-- TOC entry 2032 (class 1259 OID 57457)
-- Name: projet_FK_projet_id_client; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "projet_FK_projet_id_client" ON projet USING btree (id_client);


--
-- TOC entry 2033 (class 1259 OID 57458)
-- Name: projet_FK_projet_id_personnel; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "projet_FK_projet_id_personnel" ON projet USING btree (id_personnel);


--
-- TOC entry 2034 (class 1259 OID 57459)
-- Name: projet_FK_projet_id_personnel1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "projet_FK_projet_id_personnel1" ON projet USING btree (id_personnel1);


--
-- TOC entry 2035 (class 1259 OID 57460)
-- Name: projet_FK_projet_id_terrain; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "projet_FK_projet_id_terrain" ON projet USING btree (id_terrain);


--
-- TOC entry 2038 (class 1259 OID 57461)
-- Name: proposition_FK_proposition_id_visite; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "proposition_FK_proposition_id_visite" ON proposition USING btree (id_visite);


--
-- TOC entry 2045 (class 1259 OID 57462)
-- Name: technique_FK_technique_id_projet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "technique_FK_technique_id_projet" ON technique USING btree (id_projet);


--
-- TOC entry 2048 (class 1259 OID 57463)
-- Name: terrain_FK_terrain_id_secteur; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "terrain_FK_terrain_id_secteur" ON terrain USING btree (id_secteur);


--
-- TOC entry 2051 (class 1259 OID 57464)
-- Name: visite_FK_visite_id_projet; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "visite_FK_visite_id_projet" ON visite USING btree (id_projet);


--
-- TOC entry 2058 (class 2606 OID 57465)
-- Name: commerciale_id_projet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY commerciale
    ADD CONSTRAINT commerciale_id_projet_fkey FOREIGN KEY (id_projet) REFERENCES projet(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2059 (class 2606 OID 57470)
-- Name: commerciale_id_visite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY commerciale
    ADD CONSTRAINT commerciale_id_visite_fkey FOREIGN KEY (id_visite) REFERENCES visite(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2060 (class 2606 OID 57475)
-- Name: contact_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_id_client_fkey FOREIGN KEY (id_client) REFERENCES client(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2061 (class 2606 OID 57480)
-- Name: contrainte_id_specialiste_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contrainte
    ADD CONSTRAINT contrainte_id_specialiste_fkey FOREIGN KEY (id_specialiste) REFERENCES specialiste(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2062 (class 2606 OID 57485)
-- Name: envisager_id_projet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envisager
    ADD CONSTRAINT envisager_id_projet_fkey FOREIGN KEY (id_projet) REFERENCES projet(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2063 (class 2606 OID 57490)
-- Name: envisager_id_secteur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY envisager
    ADD CONSTRAINT envisager_id_secteur_fkey FOREIGN KEY (id_secteur) REFERENCES secteur(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2064 (class 2606 OID 57495)
-- Name: examiner_id_specialiste_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examiner
    ADD CONSTRAINT examiner_id_specialiste_fkey FOREIGN KEY (id_specialiste) REFERENCES specialiste(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2065 (class 2606 OID 57500)
-- Name: examiner_id_visite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examiner
    ADD CONSTRAINT examiner_id_visite_fkey FOREIGN KEY (id_visite) REFERENCES visite(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2066 (class 2606 OID 57505)
-- Name: personnel_id_agence_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personnel
    ADD CONSTRAINT personnel_id_agence_fkey FOREIGN KEY (id_agence) REFERENCES agence(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2067 (class 2606 OID 57510)
-- Name: projet_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projet
    ADD CONSTRAINT projet_id_client_fkey FOREIGN KEY (id_client) REFERENCES client(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2068 (class 2606 OID 57515)
-- Name: projet_id_personnel1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projet
    ADD CONSTRAINT projet_id_personnel1_fkey FOREIGN KEY (id_personnel1) REFERENCES personnel(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2069 (class 2606 OID 57520)
-- Name: projet_id_personnel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projet
    ADD CONSTRAINT projet_id_personnel_fkey FOREIGN KEY (id_personnel) REFERENCES personnel(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2070 (class 2606 OID 57525)
-- Name: projet_id_terrain_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projet
    ADD CONSTRAINT projet_id_terrain_fkey FOREIGN KEY (id_terrain) REFERENCES terrain(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2071 (class 2606 OID 57530)
-- Name: proposition_id_visite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proposition
    ADD CONSTRAINT proposition_id_visite_fkey FOREIGN KEY (id_visite) REFERENCES visite(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2072 (class 2606 OID 57535)
-- Name: technique_id_projet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY technique
    ADD CONSTRAINT technique_id_projet_fkey FOREIGN KEY (id_projet) REFERENCES projet(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2073 (class 2606 OID 57540)
-- Name: technique_id_visite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY technique
    ADD CONSTRAINT technique_id_visite_fkey FOREIGN KEY (id_visite) REFERENCES visite(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2074 (class 2606 OID 57545)
-- Name: terrain_id_secteur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY terrain
    ADD CONSTRAINT terrain_id_secteur_fkey FOREIGN KEY (id_secteur) REFERENCES secteur(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2075 (class 2606 OID 57550)
-- Name: visite_id_projet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY visite
    ADD CONSTRAINT visite_id_projet_fkey FOREIGN KEY (id_projet) REFERENCES projet(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-04-19 16:37:15

--
-- PostgreSQL database dump complete
--


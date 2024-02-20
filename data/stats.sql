-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.1.0-beta1
-- PostgreSQL version: 16.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
CREATE DATABASE new_database;
-- ddl-end --


-- object: public.characters_playable | type: TABLE --
-- DROP TABLE IF EXISTS public.characters_playable CASCADE;
CREATE TABLE public.characters_playable (
	id smallint NOT NULL,
	character_status bool NOT NULL,
	character_name char(25),
	character_rank char(25),
	character_inspiration smallint,
	character_level smallint,
	character_xp int4,
	character_type char(25),
	damage_done int4,
	damage_taken smallint,
	healing_done smallint,
	healing_taken smallint,
	criticals_given smallint,
	criticals_fails smallint,
	character_initiative smallint,
	character_speed smallint,
	character_ac smallint,
	character_hp smallint,
	character_prof_bonus smallint,
	character_strength smallint,
	character_dex smallint,
	character_cons smallint,
	character_intel smallint,
	character_wisdom smallint,
	character_charisma smallint,
	CONSTRAINT _pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public.characters_playable OWNER TO postgres;
-- ddl-end --

-- object: public."characters_NPC" | type: TABLE --
-- DROP TABLE IF EXISTS public."characters_NPC" CASCADE;
CREATE TABLE public."characters_NPC" (
	id smallint NOT NULL,
	character_status bool NOT NULL,
	character_name char(25),
	character_type char(25),
	character_initiative smallint,
	character_hp smallint,
	character_ac smallint,
	character_strength smallint,
	character_dex smallint,
	character_cons smallint,
	character_intel smallint,
	character_wisdom smallint,
	character_charisma smallint,
	character_prof_bonus smallint,
	character_speed smallint,
	id_characters_playable smallint,
	CONSTRAINT _pk PRIMARY KEY (id)
);
-- ddl-end --
ALTER TABLE public."characters_NPC" OWNER TO postgres;
-- ddl-end --

-- object: characters_playable_fk | type: CONSTRAINT --
-- ALTER TABLE public."characters_NPC" DROP CONSTRAINT IF EXISTS characters_playable_fk CASCADE;
ALTER TABLE public."characters_NPC" ADD CONSTRAINT characters_playable_fk FOREIGN KEY (id_characters_playable)
REFERENCES public.characters_playable (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "characters_NPC_uq" | type: CONSTRAINT --
-- ALTER TABLE public."characters_NPC" DROP CONSTRAINT IF EXISTS "characters_NPC_uq" CASCADE;
ALTER TABLE public."characters_NPC" ADD CONSTRAINT "characters_NPC_uq" UNIQUE (id_characters_playable);
-- ddl-end --



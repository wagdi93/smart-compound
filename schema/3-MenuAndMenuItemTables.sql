-- SQL Manager for PostgreSQL 5.5.0.44853-- ----------------------------------------- Host      : localhost-- Database  : ng_nts_smartcompound-- Version   : PostgreSQL 9.3.5, compiled by Visual C++ build 1600, 64-bitSET check_function_bodies = false;---- Structure for table ng_nts_menu (OID = 42058) : --CREATE SEQUENCE public.menu_item_recid_seq  INCREMENT 1 MINVALUE 1  MAXVALUE 9223372036854775807 START 1  CACHE 1;    CREATE SEQUENCE public.menu_recid_seq  INCREMENT 1 MINVALUE 1  MAXVALUE 9223372036854775807 START 1  CACHE 1;    CREATE SEQUENCE public.ng_nts_menu_item_group_recid_seq  INCREMENT 1 MINVALUE 1  MAXVALUE 9223372036854775807 START 1  CACHE 1;    SET search_path = public, pg_catalog;CREATE TABLE public.ng_nts_menu (    recid integer DEFAULT nextval('menu_recid_seq'::regclass) NOT NULL,    name text,    status_id integer)WITH (oids = false);---- Structure for table ng_nts_menu_item (OID = 42067) : --CREATE TABLE public.ng_nts_menu_item (    recid integer DEFAULT nextval('menu_item_recid_seq'::regclass) NOT NULL,    name text,    status_id integer,    url text,    menu_id integer)WITH (oids = false);---- Structure for table ng_nts_menu_item_group (OID = 42074) : --CREATE TABLE public.ng_nts_menu_item_group (    group_id integer NOT NULL,    menu_item_id integer NOT NULL,    recid integer DEFAULT nextval('ng_nts_menu_item_group_recid_seq'::regclass) NOT NULL)WITH (oids = false);---- Definition for index menu_pkey (OID = 42077) : --ALTER TABLE ONLY ng_nts_menu    ADD CONSTRAINT menu_pkey    PRIMARY KEY (recid);---- Definition for index menu_fk (OID = 42079) : --ALTER TABLE ONLY ng_nts_menu    ADD CONSTRAINT menu_fk    FOREIGN KEY (status_id) REFERENCES ng_nts_lookup(recid) ON UPDATE CASCADE ON DELETE CASCADE;---- Definition for index menu_item_pkey (OID = 42084) : --ALTER TABLE ONLY ng_nts_menu_item    ADD CONSTRAINT menu_item_pkey    PRIMARY KEY (recid);---- Definition for index menu_item_fk (OID = 42086) : --ALTER TABLE ONLY ng_nts_menu_item    ADD CONSTRAINT menu_item_fk    FOREIGN KEY (status_id) REFERENCES ng_nts_lookup(recid) ON UPDATE CASCADE ON DELETE CASCADE;---- Definition for index menu_item_fk1 (OID = 42091) : --ALTER TABLE ONLY ng_nts_menu_item    ADD CONSTRAINT menu_item_fk1    FOREIGN KEY (menu_id) REFERENCES ng_nts_menu(recid) ON UPDATE CASCADE ON DELETE CASCADE;---- Definition for index pkc_name (OID = 42096) : --ALTER TABLE ONLY ng_nts_menu_item_group    ADD CONSTRAINT pkc_name    PRIMARY KEY (group_id, menu_item_id);---- Definition for index menu_item_group_fk (OID = 42098) : --ALTER TABLE ONLY ng_nts_menu_item_group    ADD CONSTRAINT menu_item_group_fk    FOREIGN KEY (group_id) REFERENCES ng_nts_groups(recid) ON UPDATE CASCADE ON DELETE CASCADE;---- Definition for index menu_item_group_fk1 (OID = 42103) : --ALTER TABLE ONLY ng_nts_menu_item_group    ADD CONSTRAINT menu_item_group_fk1    FOREIGN KEY (menu_item_id) REFERENCES ng_nts_menu_item(recid) ON UPDATE CASCADE ON DELETE CASCADE;---- Comments--COMMENT ON SCHEMA public IS 'standard public schema';
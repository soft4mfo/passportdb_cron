ALTER TABLE public.app_passports DROP CONSTRAINT  IF EXISTS app_passports_pkey;
DROP TABLE IF EXISTS t_app_passports;
CREATE TABLE public.t_app_passports
(
    id integer NOT NULL DEFAULT nextval('app_passports_id_seq'::regclass),
    passp_series character varying(150) COLLATE pg_catalog."default" NOT NULL,
    passp_number text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT app_passports_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

\copy t_app_passports(passp_series,passp_number) FROM '/tmp/list_of_expired_passports.csv' DELIMITER ',' ENCODING 'UTF8' CSV HEADER;

DROP TABLE IF EXISTS app_passports;
ALTER TABLE IF EXISTS t_app_passports RENAME TO app_passports;
DROP INDEX IF EXISTS public.app_passpor_passp_s_62f52b_idx;
CREATE INDEX app_passpor_passp_s_62f52b_idx
    ON public.app_passports USING btree
    (passp_series COLLATE pg_catalog."default" ASC NULLS LAST, passp_number COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

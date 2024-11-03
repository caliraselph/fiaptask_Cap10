-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-27 14:14:28 BRT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE t_agro_produto CASCADE CONSTRAINTS;

DROP TABLE t_agro_relatorio CASCADE CONSTRAINTS;

DROP TABLE t_agro_safra CASCADE CONSTRAINTS;

DROP TABLE t_agro_segmento CASCADE CONSTRAINTS;

DROP TABLE t_agro_tp_produto CASCADE CONSTRAINTS;

DROP TABLE t_cnf_ano CASCADE CONSTRAINTS;

DROP TABLE t_cnf_estado CASCADE CONSTRAINTS;

DROP TABLE t_cnf_pais CASCADE CONSTRAINTS;

DROP TABLE t_cnf_periodo CASCADE CONSTRAINTS;

DROP TABLE t_cnf_periodo_ano CASCADE CONSTRAINTS;

DROP TABLE t_cnf_regiao CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_agro_produto (
    cd_produto    NUMBER(5) NOT NULL,
    cd_tp_produto NUMBER(10) NOT NULL,
    ds_produto    VARCHAR2(100) NOT NULL,
    st_produto    NUMBER(1) NOT NULL
);

ALTER TABLE t_agro_produto ADD CONSTRAINT t_agro_produto_pk PRIMARY KEY ( cd_produto );

CREATE TABLE t_agro_relatorio (
    cd_relatorio NUMBER(10) NOT NULL,
    ds_relatorio VARCHAR2(100) NOT NULL,
    st_relatorio NUMBER(1) NOT NULL
);

ALTER TABLE t_agro_relatorio ADD CONSTRAINT t_agro_relatorio_pk PRIMARY KEY ( cd_relatorio );

CREATE TABLE t_agro_safra (
    cd_safra     NUMBER(10) NOT NULL,
    cd_relatorio NUMBER(10) NOT NULL,
    cd_periodo   NUMBER(10) NOT NULL,
    cd_segmento  NUMBER(10) NOT NULL,
    cd_produto   NUMBER(5) NOT NULL,
    cd_estado    NUMBER(10) NOT NULL,
    vl_area      NUMBER(15, 2) NOT NULL,
    vl_produt    NUMBER(15, 2) NOT NULL,
    vl_produc    NUMBER(15, 2) NOT NULL
);

ALTER TABLE t_agro_safra ADD CONSTRAINT t_agro_safra_pk PRIMARY KEY ( cd_safra );

CREATE TABLE t_agro_segmento (
    cd_segmento NUMBER(10) NOT NULL,
    ds_segmento VARCHAR2(100) NOT NULL,
    nr_ordem    NUMBER(2) NOT NULL
);

ALTER TABLE t_agro_segmento ADD CONSTRAINT t_agro_segmento_pk PRIMARY KEY ( cd_segmento );

CREATE TABLE t_agro_tp_produto (
    cd_tp_produto NUMBER(10) NOT NULL,
    ds_tp_produto VARCHAR2(100) NOT NULL,
    st_tp_produto NUMBER(1) NOT NULL
);

ALTER TABLE t_agro_tp_produto ADD CONSTRAINT t_agro_tp_produto_pk PRIMARY KEY ( cd_tp_produto );

CREATE TABLE t_cnf_ano (
    cd_ano NUMBER(10) NOT NULL
);

ALTER TABLE t_cnf_ano ADD CONSTRAINT t_cnf_ano_pk PRIMARY KEY ( cd_ano );

CREATE TABLE t_cnf_estado (
    cd_estado NUMBER(10) NOT NULL,
    cd_regiao NUMBER(10) NOT NULL,
    ds_estado VARCHAR2(100) NOT NULL,
    st_estado NUMBER(1) NOT NULL
);

ALTER TABLE t_cnf_estado ADD CONSTRAINT t_cnf_estado_pk PRIMARY KEY ( cd_estado );

CREATE TABLE t_cnf_pais (
    cd_pais NUMBER(10) NOT NULL,
    ds_pais VARCHAR2(100) NOT NULL,
    st_pais NUMBER(1) NOT NULL
);

ALTER TABLE t_cnf_pais ADD CONSTRAINT t_cnf_pais_pk PRIMARY KEY ( cd_pais );

CREATE TABLE t_cnf_periodo (
    cd_periodo NUMBER(10) NOT NULL,
    ds_periodo VARCHAR2(100) NOT NULL
);

ALTER TABLE t_cnf_periodo ADD CONSTRAINT t_cnf_periodo_pk PRIMARY KEY ( cd_periodo );

CREATE TABLE t_cnf_periodo_ano (
    cd_periodo NUMBER(10) NOT NULL,
    cd_ano     NUMBER(10) NOT NULL
);

ALTER TABLE t_cnf_periodo_ano ADD CONSTRAINT participa_pk PRIMARY KEY ( cd_periodo,
                                                                        cd_ano );

CREATE TABLE t_cnf_regiao (
    cd_regiao NUMBER(10) NOT NULL,
    cd_pais   NUMBER(10) NOT NULL,
    ds_regiao VARCHAR2(100) NOT NULL,
    st_regiao NUMBER(1) NOT NULL
);

ALTER TABLE t_cnf_regiao ADD CONSTRAINT t_cnf_regiao_pk PRIMARY KEY ( cd_regiao );

ALTER TABLE t_agro_safra
    ADD CONSTRAINT t_agro_produto_fk FOREIGN KEY ( cd_produto )
        REFERENCES t_agro_produto ( cd_produto );

ALTER TABLE t_agro_safra
    ADD CONSTRAINT t_agro_relatorio_fk FOREIGN KEY ( cd_relatorio )
        REFERENCES t_agro_relatorio ( cd_relatorio );

ALTER TABLE t_agro_safra
    ADD CONSTRAINT t_agro_segmento_fk FOREIGN KEY ( cd_segmento )
        REFERENCES t_agro_segmento ( cd_segmento );

ALTER TABLE t_agro_produto
    ADD CONSTRAINT t_agro_tp_produto_fk FOREIGN KEY ( cd_tp_produto )
        REFERENCES t_agro_tp_produto ( cd_tp_produto );

ALTER TABLE t_cnf_periodo_ano
    ADD CONSTRAINT t_cnf_ano_fk FOREIGN KEY ( cd_ano )
        REFERENCES t_cnf_ano ( cd_ano );

ALTER TABLE t_agro_safra
    ADD CONSTRAINT t_cnf_estado_fk FOREIGN KEY ( cd_estado )
        REFERENCES t_cnf_estado ( cd_estado );

ALTER TABLE t_cnf_regiao
    ADD CONSTRAINT t_cnf_pais_fk FOREIGN KEY ( cd_pais )
        REFERENCES t_cnf_pais ( cd_pais );

ALTER TABLE t_cnf_periodo_ano
    ADD CONSTRAINT t_cnf_periodo_fk FOREIGN KEY ( cd_periodo )
        REFERENCES t_cnf_periodo ( cd_periodo );

ALTER TABLE t_agro_safra
    ADD CONSTRAINT t_cnf_periodo_fkv2 FOREIGN KEY ( cd_periodo )
        REFERENCES t_cnf_periodo ( cd_periodo );

ALTER TABLE t_cnf_estado
    ADD CONSTRAINT t_cnf_regiao_fk FOREIGN KEY ( cd_regiao )
        REFERENCES t_cnf_regiao ( cd_regiao );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

--
-- Type: TABLE; Owner: DEAPP; Name: DE_VARIANT_SUBJECT_IDX
--
 CREATE TABLE "DEAPP"."DE_VARIANT_SUBJECT_IDX" 
  (	"DATASET_ID" VARCHAR2(50 BYTE), 
"SUBJECT_ID" VARCHAR2(50 BYTE), 
"POSITION" NUMBER, 
"VARIANT_SUBJECT_IDX_ID" NUMBER NOT NULL ENABLE
  ) SEGMENT CREATION DEFERRED
 TABLESPACE "TRANSMART" ;

--
-- Type: REF_CONSTRAINT; Owner: DEAPP; Name: VARIANT_SUBJECT_IDX_FK
--
ALTER TABLE "DEAPP"."DE_VARIANT_SUBJECT_IDX" ADD CONSTRAINT "VARIANT_SUBJECT_IDX_FK" FOREIGN KEY ("DATASET_ID")
 REFERENCES "DEAPP"."DE_VARIANT_DATASET" ("DATASET_ID") ENABLE;

--
-- Type: SEQUENCE; Owner: DEAPP; Name: DE_VARIANT_SUBJECT_IDX_SEQ
--
CREATE SEQUENCE  "DEAPP"."DE_VARIANT_SUBJECT_IDX_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--
-- Type: TRIGGER; Owner: DEAPP; Name: TRG_DE_VARIANT_SUBJ_IDX_ID
--
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_VARIANT_SUBJ_IDX_ID" 
before insert on "DEAPP"."DE_VARIANT_SUBJECT_IDX"
for each row begin
       	if inserting then
               	if :NEW."VARIANT_SUBJECT_IDX_ID" is null then
                       	select DE_VARIANT_SUBJECT_IDX_SEQ.nextval into :NEW."VARIANT_SUBJECT_IDX_ID" from dual;
               	end if;
       	end if;
end;
/
ALTER TRIGGER "DEAPP"."TRG_DE_VARIANT_SUBJ_IDX_ID" ENABLE;
 
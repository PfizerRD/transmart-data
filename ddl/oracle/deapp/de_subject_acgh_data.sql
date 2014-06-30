--
-- Type: TABLE; Owner: DEAPP; Name: DE_SUBJECT_ACGH_DATA
--
 CREATE TABLE "DEAPP"."DE_SUBJECT_ACGH_DATA" 
  (	"TRIAL_NAME" VARCHAR2(50 BYTE), 
"REGION_ID" NUMBER NOT NULL ENABLE, 
"ASSAY_ID" NUMBER NOT NULL ENABLE, 
"PATIENT_ID" NUMBER, 
"CHIP" FLOAT(126), 
"SEGMENTED" FLOAT(126), 
"FLAG" NUMBER(*,0), 
"PROBLOSS" FLOAT(126), 
"PROBNORM" FLOAT(126), 
"PROBGAIN" FLOAT(126), 
"PROBAMP" FLOAT(126), 
"PARTITION_ID" NUMBER(*,0), 
 CONSTRAINT "DE_SUBJECT_ACGH_DATA_PKEY" PRIMARY KEY ("ASSAY_ID", "REGION_ID")
 USING INDEX
 TABLESPACE "DEAPP"  ENABLE
  ) SEGMENT CREATION DEFERRED
 TABLESPACE "DEAPP" ;

--
-- Type: INDEX; Owner: DEAPP; Name: DE_SUBJECT_ACGH_DATA_PATIENT
--
CREATE INDEX "DEAPP"."DE_SUBJECT_ACGH_DATA_PATIENT" ON "DEAPP"."DE_SUBJECT_ACGH_DATA" ("PATIENT_ID")
TABLESPACE "DEAPP" ;

--
-- Type: INDEX; Owner: DEAPP; Name: DE_SUBJECT_ACGH_DATA_REGION
--
CREATE INDEX "DEAPP"."DE_SUBJECT_ACGH_DATA_REGION" ON "DEAPP"."DE_SUBJECT_ACGH_DATA" ("REGION_ID")
TABLESPACE "DEAPP" ;

--
-- Type: REF_CONSTRAINT; Owner: DEAPP; Name: DE_SUBJ_ACGH_REGION_ID_FKEY
--
ALTER TABLE "DEAPP"."DE_SUBJECT_ACGH_DATA" ADD CONSTRAINT "DE_SUBJ_ACGH_REGION_ID_FKEY" FOREIGN KEY ("REGION_ID")
 REFERENCES "DEAPP"."DE_CHROMOSOMAL_REGION" ("REGION_ID") ENABLE;

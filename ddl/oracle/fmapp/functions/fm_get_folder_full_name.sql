--
-- Type: FUNCTION; Owner: FMAPP; Name: FM_GET_FOLDER_FULL_NAME
--
  CREATE OR REPLACE EDITIONABLE FUNCTION "FMAPP"."FM_GET_FOLDER_FULL_NAME" (
  p_folder_id number
)
return nvarchar2
as
  v_parent_id number;
  v_folder_full_name nvarchar2(1000);
begin

  select parent_id into v_parent_id
  from fm_folder
  where folder_id = p_folder_id;
  
  v_folder_full_name := fm_folder_uid(p_folder_id) || '\';
  
  while v_parent_id is not null
  loop
    v_folder_full_name := fm_folder_uid(v_parent_id) || '\' || v_folder_full_name;

    select parent_id into v_parent_id
    from fm_folder
    where folder_id = v_parent_id;
  end loop;

  v_folder_full_name := '\' || v_folder_full_name;
  
  return v_folder_full_name;  
end;

 
/
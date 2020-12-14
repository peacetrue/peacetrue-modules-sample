truncate classify;

insert into classify (id, code, name, remark, type_id, type_code, parent_id, level, leaf, serial_number, creator_id,
                      created_time, modifier_id, modified_time)
values (1, 'pageArea', '页面区域', '', (select id from dictionary_value where code = 'pageArea'), 'pageArea', 1, 1, true, 1,
        1, current_timestamp, 1, current_timestamp);


truncate page_area_config;

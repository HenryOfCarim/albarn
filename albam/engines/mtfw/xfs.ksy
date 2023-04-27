meta:
  endian: le
  id: xfs
  file-extension: jex
  ks-version: 0.10
  title: unfinished MTFramework xfs
seq:
  - {id: header, type: block_header}
  - {id: blocks_ofc, type: block_offset, repeat: expr, repeat-expr: header.struct_count} # all offsets use + 16
instances:
  file_data:
    {pos: header.file_ofc + 16, type: block_file_data}
  
types:
  block_header:
    seq:
      - {id: id_magic, contents: [0x58, 0x46, 0x53, 0x00]}
      - {id: version, type: u2}
      - {id: file_type, type: u2}
      - {id: struct_count, type: u2}
      - {id: unk_04, type: u2}
      - {id: file_ofc, type: u4}
  str_name:
    seq:
      - {id: name, type: str, size: 16, terminator: 0, encoding: UTF-8}
  struct_data:
    seq:
      - {id: name_ofc, type: u4}
      - {id: struct_type, type: u1, enum: data_type}
      - {id: st_unk, type: u1}
      - {id: st_size, type: u2}
      - {id: unk_ofc, type: u4,  repeat: expr, repeat-expr:  4}
    instances:
      type_name:
        {pos: name_ofc + 16, type: str_name}
    enums:
      data_type:
        {0: unknown, 1: class, 2: classref,3: bool, 4: u8,
        5: u16, 6: u32, 7: u64, 8: s8, 9: s16, 10: s32,
        11: s64, 12: f32, 13: f64, 14: string, 15: color,
        16: point, 17: size, 18: rect, 19: matrix44}
        
  struct_header:
    seq:
      - {id: struct_hash, type: u4}
      - {id: data_num, type: u4}
      - {id: structure, type: struct_data, repeat: expr, repeat-expr: data_num}
  block_offset:
    seq:
      - {id: ofc_block, type: u4}
    instances:
      is_used:
        value: ofc_block != 0
      body:
          pos: ofc_block + 16
          type: struct_header
          if: is_used
  xml_header:
    seq:
      - {id unk_01, type: u2}
      - {id count, type: u2}
      - {id unk_03, type: u4}
      - {id unk_04, type: u4}
  xml_block0:
    seq:
      - {id: unk_header, type: xml_header}
      - {id: jnt_00, type: s4}
      - {id: unk_fl_00, type: s4}
      - {id: ref_a, type: s4}
      - {id: unk_fl_01, type: s4}
      - {id: ref_b, type: s4}
      - {id: unk_fl_02, type: u4}
      - {id: pct_a, type: f4}
      - {id: unk_fl_03, type: s4}
      - {id: pct_b, type: f4}
  xml_block1:
    seq:
      - {id: unk_header, type: xml_header}
      - {id: jnt, type: s4}
      - {id: unk_fl_00, type: u4}
      - {id: ref, type: s4}
      - {id: unk_fl_01, type: u4}
      - {id: axis, type: s4}
      - {id: unk_fl_02, type: s4}
      - {id: pct, type: f4}
      - {id: unk_fl_03, type: u4}
      - {id: old, type: f4}
      - {id: unk_fl_04, type: u4}
      - {id: dec_jnt, type: s4}
      - {id: unk_fl_05, type: u4}
      - {id: dec_axis, type: s4}
      - {id: unk_fl_06, type: s4}
      - {id: dec_ang0, type: f4}
      - {id: unk_fl_07, type: s4}
      - {id: dec_ang1, type: f4}
  xml_block2:
    seq:
      - {id: unk_header, type: xml_header}
      - {id: jnt_1, type: s4}
      - {id: unk_fl, type: s4}
      - {id: jnt_2, type: s4}
      
  unk_block:
    seq:
      - {id: unk_type, type: u2}
      - {id: unk_count, type: u2}
      #- {id: unk_02, type: u2}
      - {id: unk_03, type: u4}
      - {id: unk_04, type: u4}
      - {id: bool_val, type: u1}
      - {id: num_blocks, type: u4}
      
  block_file_data:
      seq:
       - {id: test, type: xml_header}
       #- {id: unk_fill_00, type: u1,  repeat: expr, repeat-expr:  3}
       #- {id: test, type: unk_block}
       - {id: quality, type: u4}
       - {id: array_num, type: u4}
       - {id: struct_head_02, type: unk_block}
       - {id: struct_02, type: xml_block0, repeat: expr, repeat-expr: struct_head_02.num_blocks}
       - {id: struct_head_03, type: unk_block}
       - {id: struct_03, type: xml_block1, repeat: expr, repeat-expr: struct_head_03.num_blocks}
       - {id: struct_head_04, type: unk_block}
       - {id: struct_04, type: xml_block2, repeat: expr, repeat-expr: struct_head_04.num_blocks}
    
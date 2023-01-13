meta:
  id: mtframework_mfx
  endian: le
  file-extension: mfx

seq:
- {id: header, type: mfx_header}
- {id: mfx_entryes, type: mfx_entry, repeat: expr, repeat-expr: header.entry_count-1}

types:
  mfx_header:
    seq:
      - {id: magic, contents: [0x4d, 0x46, 0x58, 0x00]}
      - {id: reserved_4, type: u2}
      - {id: reserved_6, type: u2}
      - {id: field_8, type: u4}
      - {id: entry_count, type: u4}
      - {id: string_table_offset, type: u4}
      - {id: unk_01,  type u4}
      
  mfx_entry:
    seq:
      - {id: ofs_body, type: u4}
    instances:
      body:
          pos: ofs_body
          type: mfx_entry_body
          
  string_name:
    seq:
      - {id: name, type: str, terminator: 0, encoding: UTF-8}
      
  mfx_entry_body:
    seq:
      - {id: ofs_string1, type: u4}
      - {id: ofs_string2, type: u4}
      - {id: fields, type: u4}
      - {id: unk_01, type: u2}
      - {id: index, type: u2}
      - {id: field_c, type: u4}
      - {id: field_d, type: u4}
      - {id: field_e, type: u4}
      - {id: num_atributes, type: u2}
      - {id: unk_02, type: u2}
    instances:
      string_1:
            pos: ofs_string1 + _root.header.string_table_offset
            type: string_name
      string_2:
            pos: ofs_string2 + _root.header.string_table_offset
            type: string_name
meta:
  id: mtframework_sdl
  endian: le
  title: MTFramework sheduler format
  file-extension: sdl
  license: CC0-1.0
  ks-version: 0.10

seq:
  - {id: header, type: sdl_header}
  - {id: block_00, type: unk_block_00, repeat: expr, repeat-expr: header.unk_num}
  
types:
  sdl_header:
    seq:
      - {id: magic, contents: [0x53,0x44,0x4c,0x00]}
      - {id: version, type: u2}
      - {id: unk_num, type: u2}
      - {id: unk_00, type: u4}
      - {id: unk_01, type: u4}
      - {id: str_ofc, type: u4}
  
  string:
    seq:
      - { id: my_string, type: str, terminator: 0, encoding: UTF-8}
      
  unk_block_00:
    seq:
      - {id: unk_00, type: u2}
      - {id: unk_01, type: u2}
      - {id: unk_05, type: u4}
      - {id: local_str_ofc, type: u4}
      - {id: unk_02, type: u4}
      - {id: unk_ofc_00, type: u4}
      - {id: unk_ofc_01, type: u4}
    instances:
      name:
        {pos: _root.header.str_ofc + local_str_ofc, type: string}
      is_valid_01:
        {value: unk_ofc_00 != 0}
      unk_val_01:
        {pos: unk_ofc_00, type: u4, if: is_valid_01}
      is_valid_02:
        {value: unk_ofc_01 != 0}
      unk_val_02:
        {pos: unk_ofc_01, type: u4, if: is_valid_02}

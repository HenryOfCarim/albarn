meta:
  id: ccl
  file-extension: ccl
  endian: le
  title: MTFramework ccl
  
seq:
  - {id: id_magic, contents: [0x43, 0x43, 0x4c, 0x00]}
  - {id: unk_id, type: u4}
  - {id: unk_num, type: u4}
  - {id: size, type: u4}
  - {id: data, type: unk_block, repeat: expr, repeat-expr: unk_num}
  
types:
  unk_block:
    seq:
      - {id: unk_00, type: u4}
      - {id: unk_02, type: u2}
      - {id: unk_03, type: u2}
      - {id: unk_04, type: u1}
      - {id: unk_05, type: u1}
      - {id: unk_06, type: u2}
      - {id: unk_07, type: u4}
      - {id: unk_floats, type: f4, repeat: expr, repeat-expr: 11}
      - {id: unk_08, type: u4}
meta:
  id: ccl
  file-extension: ccl
  endian: le
  title: MTFramework ccl
  
seq:
  - {id: id_magic, contents: [0x43, 0x43, 0x4c, 0x00]}
  - {id: id, type: u4}
  - {id: num_block, type: u4}
  - {id: size, type: u4}
  - {id: data, type: col_info, repeat: expr, repeat-expr: num_block}
  
types:
  col_info:
    seq:
      - {id: attr, type: u4}
      - {id: ref_joint, type: u2}
      - {id: pair_joint, type: u2}
      - {id: shape, type: u1}
      - {id: reserved, type: u1, repeat: expr, repeat-expr: 3}
      - {id: reserved1, type: f4}
      - {id: unk_07, type: u4}
      - {id: unk_floats, type: f4, repeat: expr, repeat-expr: 11}
      - {id: unk_08, type: u4}
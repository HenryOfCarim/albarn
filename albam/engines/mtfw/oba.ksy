meta:
  endian: le
  id: oba
  file-extension: oba
  title: MTFramework oba
  
seq:
  - {id: magic, type: u4}
  - {id: type, type: u4}
  - {id: block_num, type: u4}
  - {id: data, type: unk_block,repeat: expr, repeat-expr: block_num}
  
  
types:
  unk_block:
    seq:
      - {id: unk_id, type: u4}
      - {id: unk_00, type: u2}
      - {id: unk_floats, type: f4, repeat: expr, repeat-expr: 8}
      - {id: unk_02, type: u4}
      - {id: unk_03, type: u4}



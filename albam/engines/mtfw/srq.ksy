meta:
  endian: le
  file-extension: srq
  id: srq
  ks-version: 0.10
  title: MTFramework Sound request
  
seq:
  - {id: magic, type: u4}
  - {id: version, type: u4}
  - {id: num_block, type: u4}
  - {id: nulls, type: u4, repeat: expr, repeat-expr: 4}
  - {id: ofc_str, type: u4, repeat: expr, repeat-expr: 6}
  - {id: block, type: unk_block, repeat: expr, repeat-expr: num_block}
  
types:
  unk_block:
    seq:
      - {id: id, type: u2}
      - {id: unk_02, type: u2}
      - {id: unk_03, type: u4}
      - {id: unk_04, type: u4}
      - {id: unk_00, type: u4, repeat: expr, repeat-expr: 35}
      - {id: unk_05, type: u4}
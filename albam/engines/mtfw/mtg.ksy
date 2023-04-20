meta:
  id: mtg
  file-extension: .mtg
  endian: le
  title: MTFramework mtg
  
seq:
 - {id: magic, type: u4}
 - {id: version, type: u4}
 - {id: unk_num, type: u4}
 - {id: num_blocks, type: u4}
 - {id: unk_03, type: u4}
 - {id: unk_04, type: u4}
 - {id: unk_02, type: unk_block_01, repeat: expr, repeat-expr: unk_num}
 - {id: martix, type: unk_block, repeat: expr, repeat-expr: num_blocks}
 
types:
  unk_block_01:
    seq:
      - {id: unk_00, type: u2}
      - {id: unk_01, type: u2}
      - {id: unk_02, type: u4}
  unk_block:
    seq:
      - {id: unk_01, type: u4}
      - {id: unk_02, type: u4}
      - {id: unk_03, type: u4}
      - {id: unk_04, type: u4}
      - {id: unk_f, type: f4}
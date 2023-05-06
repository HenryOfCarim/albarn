meta:
  id: mtg
  file-extension: .mtg
  endian: le
  title: MTFramework mtg
  
seq:
 - {id: magic, type: u4}
 - {id: version, type: u4}
 - {id: num_blocks_00, type: u4}
 - {id: num_blocks_01, type: u4}
 - {id: block_00_ofc, type: u4}
 - {id: block_01_ofc, type: u4}
 - {id: unk_02, type: unk_block_00, repeat: expr, repeat-expr: num_blocks_00}
 - {id: martix, type: unk_block_01, repeat: expr, repeat-expr: num_blocks_01}
 
types:
  unk_block_00:
    seq:
      - {id: unk_00, type: u2}
      - {id: unk_01, type: u2}
      - {id: unk_02, type: u4}
  unk_block_01:
    seq:
      - {id: unk_01, type: u4}
      - {id: unk_02, type: u4}
      - {id: unk_03, type: u4}
      - {id: unk_04, type: u4}
      - {id: unk_f, type: f4}

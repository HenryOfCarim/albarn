meta:
  endian: le
  file-extension: srd
  id: srd
  ks-version: 0.10
  title: MTFramework SoundRandom
  
seq:
  - {id: magic, contents: "DNRS"}
  - {id: num_unk_00, type: u4}
  - {id: num_unk_01, type: u4}
  - {id: num_unk_02, type: u4}
  - {id: data_blocks, type: test_block, repeat: expr, repeat-expr: num_unk_01}
  
types:
  test_block:
    seq:
    - {id: num, type: u4}
    - {id: unk_01, type: u4}
    - {id: unk_02, type: u4}
    - {id: unk_03, type: u4}
    - {id: unk_04, type: u4}
    - {id: unk_05, type: u4}
    - {id: unk_06, type: u4}
    - {id: unk_07, type: u4}
    - {id: unk_08, type: u4}
    - {id: unk_00, type: u4, repeat: expr, repeat-expr: 24}
    - {id: unk_09, type: u1}
    - {id: unk_10, type: u1}
    - {id: unk_11, type: u2}
    - {id: unk_12, type: u4}
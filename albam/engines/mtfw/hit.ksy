meta:
  id: mtframework_hit
  endian: le
  title:  Resident Evil 5 (MTFramework) hitbox format
  application: Resident Evil 5/Biohazard 5
  file-extension: hit
  license: CC0-1.0
  ks-version: 0.9
  
seq:
  - {id: id_magic, contents: [0x48, 0x49, 0x54, 0x20]} # HIT
  - {id: unk_00, type: u4}
  - {id: num_bloks, type: u4}
  - {id: unk_01, type: u2}
  - {id: unk_02, type: u2}
  - {id: blocks, type: unk_block, repeat: expr, repeat-expr: num_bloks}
  
types:
  unk_block:
    seq:
      - {id: unk_00, type: u1}
      - {id: unk_01, type: u4}
      - {id: unk_02, type: u1}
      #- {id: unk_03, type: u4}
      - {id: unk_floats, type: f4, repeat: expr, repeat-expr 8}
      - {id: unk_11, type: u2}
      - {id: unk_12, type: u2}
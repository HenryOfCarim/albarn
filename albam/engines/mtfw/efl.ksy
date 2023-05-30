meta:
  id: ccl
  file-extension: ccl
  endian: le
  title: MTFramework efl
  
seq:
  - {id: magic, type: u4}
  - {id: unk_id, type: u4}
  - {id: size, type: u4}
  - {id: num_blocks, type: u4}
  - {id: unk_02, type: f4, repeat: expr, repeat-expr: 4}
  - {id: unk_blocks, type: unk_block, repeat: expr, repeat-expr: num_blocks}
  - {id: unk_datas,type: u4, repeat: expr, repeat-expr: 4 }
  

types:
  unk_block:
    seq:
      - {id: unk_data,type: u4, repeat: expr, repeat-expr: 4 }
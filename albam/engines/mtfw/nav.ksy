meta:
  id: nav
  file-extension: nav
  endian: le
  
seq:
  - {id: magic, contents: [0x4e, 0x41, 0x56, 0x00]}
  - {id: unk_01, type: u4}
  - {id: unk_02, type: u4}
  - {id: num_vetices , type: u4}
  - {id: unk_num_02, type: u4}
  - {id: unk_05, type: u4}
  - {id: vertices, type: vertex, repeat: expr, repeat-expr: num_vetices}
  - {id: unk_seq_01, type: unk_struct, repeat: expr, repeat-expr: 1799}
  - {id: test, type: u4, repeat: expr, repeat-expr: 6}
  - {id: ofs_01, type: u4, repeat: expr, repeat-expr: 1367}
  - {id: unk_dat, type: unk_struct_01, repeat: expr, repeat-expr: 32}


types:
  vertex:
    seq:
      - {id: x, type: f4}
      - {id: y, type: f4}
      - {id: z, type: f4}
      

  unk_struct:
    seq:
      - {id: face_index, type: u4}
      - {id: b, type: u4}
      - {id: c, type: u4}
      - {id: sub, type: unk_sub_str, if b == 1}
      - {id: unk_f_01, type: f4}
      
  unk_sub_str:
    seq:
      - {id: d, type: u4}
      - {id: e, type: u4}
      - {id: f, type: u4}
      - {id: g, type: u4}
      - {id: h, type: u4}
      - {id: i, type: u4}
      - {id: j, type: u4}
      - {id: k, type: u4}
    
  unk_struct_01:
    seq:
      - {id: ida, type: u4}
      - {id: idb, type: u4}
      - {id: idc, type: u4}
      - {id: idd, type: u4}
  
  
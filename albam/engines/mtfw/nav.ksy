meta:
  id: nav
  file-extension: nav
  endian: le
  
seq:
  - {id: magic, contents: [0x4e, 0x41, 0x56, 0x00]}
  - {id: unk_01, type: u4}
  - {id: unk_02, type: u4}
  - {id: num_vetices , type: u4}
  - {id: num_faces, type: u4}
  - {id: unk_05, type: u4}
  - {id: vertices, type: vertex, repeat: expr, repeat-expr: num_vetices}
  - {id: unk_seq_01, type: unk_struct, repeat: expr, repeat-expr: 528}# 528 for s103
  - {id: bounding_box, type: bbox}
  - {id: unk_06, type: u4, repeat: expr, repeat-expr: 4} # 07 55 15 00
  - {id: nulls, type: u4, repeat: expr, repeat-expr: 1372} # 1372} for s103
  - {id: unk_offset, type u1}
  - {id: unk_faces, type: unk_struct_02, repeat: expr, repeat-expr: 9241} #9241 for s103


types:
  vertex:
    seq:
      - {id: x, type: f4}
      - {id: y, type: f4}
      - {id: z, type: f4}
      

  unk_struct:
    seq:
      - {id: id_face, type: u4} # face id?
      - {id: idb, type: u4}
      - {id: idc, type: u4} #0, 2048, 6144 for idb =1
      - {id: face, type: unk_sub_str, if idb == 1}
      - {id: unk_cost, type: f4}
      
  unk_sub_str:
    seq:
      - {id: d, type: u4} #3
      - {id: vert_a, type: u4} # vertex index
      - {id: vert_b, type: u4} # vertex index
      - {id: vert_c, type: u4} # vertex index
      - {id: h, type: u4} # 2, 3
      - {id: unk_face_index, type: u4} # face index
      - {id: j, type: u4} # 0
      - {id: k, type: u4} # 0, 1
    
  unk_struct_01:
    seq:
      - {id: ida, type: u4}
      - {id: idb, type: u4}
      - {id: idc, type: u4}
      - {id: idd, type: u4}
  
  unk_struct_02:
    seq:
      - {id: idb, type u4}
      
  bbox:
    seq:
      - {id: min, type: f4, repeat: expr, repeat-expr: 4}
      - {id: max, type: f4, repeat: expr, repeat-expr: 4}
  
  
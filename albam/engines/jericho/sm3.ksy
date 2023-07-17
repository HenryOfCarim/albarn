meta:
  endian: le
  file-extension: sm3
  id: sm3
  ks-version: 0.10
  title: MTFramework Sound request
  
seq:
  - {id: magic, contents: [0x53, 0x4d, 0x33, 0x00]}
  - {id: unk_01, type: u4}
  - {id: unk_bytes, type: u1, repeat: expr, repeat-expr: 12}
  - {id: unk_03, type: u4, repeat: expr, repeat-expr: 4}
  - {id: unk_04, type: u4, repeat: expr, repeat-expr: 3}
  - {id: unk_08, type: u4}
  - {id: unk_09, type: u4}
  - {id: data, type: u4, repeat: expr, repeat-expr: 3}
  - {id: paths, type: strings_00, repeat: expr, repeat-expr: data[2]}
  - {id: unk_floats, type: f4, repeat: expr, repeat-expr: 15}
  - {id: num_mat, type: u4}
  - {id: materials, type: material}
types:
  strings_00:
    seq:
      - {id: str_size, type: u4}
      - {id: string, type: str, size: str_size, encoding: UTF-8}
  material:
    seq:
      - {id: id_name, type: u4}
      - {id: unk_00, type: u4}
      - {id: num_textures, type: u4}
      - {id: mat_name, type: strings_00}
      - {id: unk_01, size: 44}
      - {id: unk_02, type: u4, , repeat: expr, repeat-expr: 3}
      - {id: unk_03, type: u4}
      - {id: data, type: u4}
      - {id: map, size: 8}
      - {id: unk_04, type: u4}
      - {id: texture, type: strings_00}
      - {id: unk_05, type: u4, repeat: expr, repeat-expr: 4}
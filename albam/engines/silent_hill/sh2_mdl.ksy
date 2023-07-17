meta:
  id: mdl
  endian: le
  title: ufinished Silent Hill 2 mesh format
  file-extension: mdl
  license: CC0-1.0
  ks-version: 0.8
  
  
seq:
  - {id: header, type: header_block}
  - {id: unk_meshes, type: mesh_block}
  - {id: unk_fill, type: u4, repeat: expr, repeat-expr:40}
  - {id: mesh_parts, type: unk_mesh_part,repeat: expr, repeat-expr: unk_meshes.num_mesh}
  - {id: unk_faces, type: faces, repeat: expr, repeat-expr: 140} # 3ri knife hardcoded
  - {id: unk_ofc, type: f4, repeat: expr, repeat-expr: 2}
  - {id: vertices, type:vertex_block, repeat: expr, repeat-expr: 260}

types:
  header_block:
    seq:
        - {id: unk_00, type: u4}
        - {id: unk_01, type: u1}
        - {id: unk_02, type: u1}
        - {id: unk_03, type: u2}
        - {id: num_textures, type: u4}
        - {id: ofs_textures, type: textures}
        - {id: unk_3, type: u4}
        - {id: unk_ofc, type: u4}
        - {id: unk_nulls, type: u4, repeat: expr, repeat-expr: 10}
      
  mesh_block:
    seq:
        - {id: unk_id, type: u4}
        - {id: unk_00, type: u4}
        - {id: unk_ofs_00, type: u4} # +64
        - {id: num_matrix, type: u4}
        - {id: unk_01, type: u4}
        - {id: unk_num, type: u4}
        - {id: unk_02, type: u4} # offset after matrix
        - {id: unk_002, type: u4}
        - {id: num_mesh, type: u4}
        - {id: unk_03, type: u4}
        - {id: unk_04, type: u4}
        - {id: ofs_vertices, type: u4}
        - {id: unk_fill_01, type: u4, repeat: expr, repeat-expr: 20}
        - {id: unk_ofs_01, type: u4}
        - {id: unk_05, type: u4}
        - {id: unk_06, type: u4}
        - {id: unk_ofs_02, type: u4}
        - {id: unk_ofs_03, type: u4}
        - {id: unk_fill_02, type: u4, repeat: expr, repeat-expr: 3}
        - {id: unk_block_ofc, type: u4} # offset before mesh blocks
        - {id: unk_nulls, type: u4, repeat: expr, repeat-expr: 3}
        - {id: unk_matrix, type: matrix,repeat: expr, repeat-expr: num_matrix}
        - {id: unk_fill_03, type: u4, repeat: expr, repeat-expr: 12} # optional or 24 or 12
        
  unk_mesh_part:
    seq:
      - {id: filler, type: u4, repeat: expr, repeat-expr: 12}
      - {id: unk_float_00, type: f4,repeat: expr, repeat-expr: 4}
      - {id: unk_float_01, type: f4,repeat: expr, repeat-expr: 4}
      - {id: unk_float_02, type: f4,repeat: expr, repeat-expr: 4}
      - {id: unk_nulls, type: u4, repeat: expr, repeat-expr: 6}
      - {id: num_polygons, type: u4}
      - {id: unk_ints, type: u4, repeat: expr, repeat-expr: 13}
  vertex_block:
    seq:
      - {id: pos, type: vertex}
      - {id: idx, type: f4, repeat: expr, repeat-expr: 3}
      - {id: idy, type: u4, repeat: expr, repeat-expr: 2}
      - {id: idz, type: f4, repeat: expr, repeat-expr: 3}
        
  block_1:
    seq:
      - {id: test_block, type: u4, repeat: expr, repeat-expr: 20}
      
  faces:
    seq:
      - {id: vetice_index, type: u2, repeat: expr, repeat-expr:3}
      
  vertex:
    seq:
      - {id: x, type f4}
      - {id: y, type f4}
      - {id: z, type f4}
      - {id: w, type f4}
      
  tex_width_height:
    seq:
       - {id: width, type: u2}
       - {id: height, type: u2}
  matrix:
    seq:
      - {id: float, type: f4, ,repeat: expr, repeat-expr: 16}
    
  textures_body:
    seq:
      - {id: id_block, type: u4}
      - {id: unk_02, type: u4, repeat: expr, repeat-expr: 3}
      - {id: unk_05, type: u4}
      - {id: size, type: tex_width_height, repeat: expr, repeat-expr: 2}
      - {id: unk_06, type: u4}
      - {id: unk_07, type: u4}
      - {id: unk_08, type: u4, repeat: expr, repeat-expr: 3}
      - {id: unk_09, type: u4}
      - {id: size_1, type: tex_width_height, repeat: expr, repeat-expr: 2}
      - {id: unk_10, type: u4}
      - {id: unk_11, type: u4, repeat: expr, repeat-expr: 4}
      
  textures:
    seq:  
      - {id: pos_texture, type: u4}
    instances:
        is_used:
          value: pos_texture != 0
        body:
            pos: pos_texture
            type: textures_body
            if: is_used
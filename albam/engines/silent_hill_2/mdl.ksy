meta:
  id: mdl
  endian: le
  title: unfinished Silent Hill 2 mesh format
  file-extension: mdl
  license: CC0-1.0
  ks-version: 0.8
  
  
seq:
  - {id: header, type: header_block}
  - {id: unk_id, type: mesh_block, repeat: expr, repeat-expr: 2}
  - {id: unk_obj, type: unk_objs,repeat: expr, repeat-expr: 8}
  #- {id: unk_faces, type: faces, repeat: expr, repeat-expr: 140}
  #- {id: unk_ofc, type: f4, repeat: expr, repeat-expr: 3}
  #- {id: vertices, type:vertex_block, repeat: expr, repeat-expr: 260}
  #- {id: vtxs, type: vertex, repeat: expr, repeat-expr: 260}

types:
  header_block:
    seq:
        - {id: unk_1, type: u4}
        - {id: unk_a, type: u1}
        - {id: unk_b, type: u1}
        - {id: unk_c, type: u2}
        - {id: num_textures, type: u4}
        - {id: ofs_textures, type: textures}
        - {id: unk_3, type: u4}
        - {id: unk_4, type: u4}
        - {id: unk_nulls, type: u4, repeat: expr, repeat-expr: 10}
      
  mesh_block:
    seq:
        - {id: unk_id, type: u4}
        - {id: unk_7, type: u4}
        - {id: unk_offs, type: u4} # +64
        - {id: unk_num, type: u4}
        - {id: unk_9, type: u4}
        - {id: unk_10, type: u4}
        - {id: unk_11, type: u4}
        - {id: unk_12, type: u4}
        - {id: num_mesh, type: u4}
        - {id: unk_fill_01, type: u4, repeat: expr, repeat-expr: 35}
        - {id: unk_matrix, type: matrix,repeat: expr, repeat-expr: 1}
        - {id: unk_fill_02, type: u4, repeat: expr, repeat-expr: 32} # optional or 24 or 12
        
  unk_objs:
    seq:
      - {id: unk_mask_1, type: f4,repeat: expr, repeat-expr: 4}
      - {id: unk_mask_2, type: f4,repeat: expr, repeat-expr: 4}
      - {id: unk_nulls, type: u4, repeat: expr, repeat-expr: 6}
      - {id: num_polygons, type: u4}
      - {id: unk_ints, type: u4, repeat: expr, repeat-expr: 13}
      - {id: filler, type: u4, repeat: expr, repeat-expr: 16}
  unk_obj_end:
    seq:
      - {id: unk_mask_1, type: f4,repeat: expr, repeat-expr: 4}
      - {id: unk_mask_2, type: f4,repeat: expr, repeat-expr: 4}
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
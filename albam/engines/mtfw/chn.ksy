meta:
  endian: le
  id: chn
  file-extension: .chn
  title: MTFramework chn
  
seq:
  - {id: id_magic, contents: [0x43, 0x48, 0x4e, 0x00]}
  - {id: unk_id, type: u4}
  - {id: size, type: u4}
  - {id: unk_num, type: u1}
  - {id: unk_01, type: u1}
  - {id: unk_02, type: u1}
  - {id: unk_03, type: u1}
  #- {id: head_data, type: unk_block_00, repeat: expr, repeat-expr: unk_num} # doesn't work right because of relative offset
  - {id: head_data, type: unk_head_block_00}
  #- {id: head_data_01, type: unk_head_block_01}
  #- {id: head_data_03, type: unk_head_block_02}
  
types:
  unk_8_floats:
    seq:
      - {id: unk_fd_00, type: f4, repeat: expr, repeat-expr: 8}
  unk_block_01:
    seq:
       - {id: bone_type, type: u4}
       - {id: bone_anim_index, type: u1}
       - {id: unk_id_01, type: u1}
       - {id: unk_id_type, type: u1}
       - {id: unk_id_02, type: u1}
       - {id: unk_path_00, type: u4,repeat: expr, repeat-expr: 2} 
       - {id: unk_floats, type: unk_8_floats}
       - {id: unk_00, type: f4} 
       - {id: unk_01, type: u4}
       - {id: unk_02, type: f4}
       - {id: unk_03, type: f4} 
       - {id: bone_parent, type: u1}
       - {id: bone_child, type: u1} 
       - {id: unk_04, type: u2} 
       - {id: unk_05, type: u4}
       - {id: unk_06, type: u4} 
       - {id: unk_07, type: f4} 
       - {id: unk_path_01, type: u4, repeat: expr, repeat-expr: 4}
  unk_head_block_00:
    seq:
      - {id: block_num, type: u1}
      - {id: unk_num, type: u1}
      - {id: unk_00, type: u2}
      - {id: unk_data_pos, type: u4}
      - {id: unk_ofc, type: u4, repeat: expr, repeat-expr: 2}
      - {id: unk_gravity, type: f4, repeat: expr, repeat-expr: 4}
    instances:
      body:
        {pos: unk_data_pos + 16, type: unk_block_01, repeat: expr, repeat-expr: block_num}
		
 #for testing purposes only       
  unk_head_block_01:
    seq:
      - {id: block_num, type: u1}
      - {id: unk_num, type: u1}
      - {id: unk_05, type: u2}
      - {id: unk_data_pos, type: u4}
      - {id: unk_ofc, type: u4, repeat: expr, repeat-expr: 2}
      - {id: unk_gravity, type: f4, repeat: expr, repeat-expr: 4}
    instances:
      body:
        {pos: unk_data_pos + 48, type: unk_block_01, repeat: expr, repeat-expr: block_num}

  unk_head_block_02:
    seq:
      - {id: block_num, type: u1}
      - {id: unk_num, type: u1}
      - {id: unk_05, type: u2}
      - {id: unk_data_pos, type: u4}
      - {id: unk_ofc, type: u4, repeat: expr, repeat-expr: 2}
      - {id: unk_gravity, type: f4, repeat: expr, repeat-expr: 4}
    instances:
      body:
        {pos: unk_data_pos + 80 , type: unk_block_01, repeat: expr, repeat-expr: block_num}

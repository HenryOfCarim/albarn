meta:
  id: mtframework_lmt
  endian: le
  title: MTFramework animtation format
  file-extension: lmt
  license: CC0-1.0
  ks-version: 0.9


seq:
  - {id: id_magic, contents: [0x4c, 0x4d, 0x54, 0x00]}
  - {id: version, type: u2}
  - {id: num_blocks, type: u2}
  - {id: block_offsets, type: block_offset, repeat: expr, repeat-expr: num_blocks}

types:
  block_offset:
    seq:
      - {id: ofc_block, type: u4}
    instances:
      is_used:
        value: ofc_block != 0
      body:
          pos: ofc_block
          type: block_header
          if: is_used
      
  block_header:
    seq:
      - {id: ofs_frame, type: u4}
      - {id: num_bones, type: u4} # num_tracks?
      - {id: num_frames, type: u4}
      - {id: unk_01, type: u4, repeat: expr, repeat-expr: 25}
      - {id: count_01, type: u4}
      - {id: ofs_buffer, type: u4}
      - {id: unk_02, type: u4, repeat: expr, repeat-expr: 16}
      - {id: count_02, type: u4}
      - {id: ofs_02, type: u4}
    instances:
      frames:
        {pos: ofs_frame, type: frame, repeat: expr, repeat-expr: num_bones}

  frame:
    seq:
      - {id: buffer_type, type: u1}
      - {id: usage, type: u1}
      - {id: joint_type, type: u1}
      - {id: bone_index, type: u1}
      - {id: unk_01, type: f4}
      - {id: size_data, type: u4}
      - {id: ofs_data, type: u4}
      - {id: unk_reference_data, type: f4, repeat: expr, repeat-expr: 4}
    instances:
      data:
        {pos: ofs_data, size: size_data}

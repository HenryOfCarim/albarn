meta:
  endian: le
  file-extension: srq
  id: srq
  ks-version: "0.11"
  title: MTFramework Sound request
  
seq:
  - {id: magic, type: u4}  # rSoundRequest::ReadHeader /* size : 0x00000034 */
  - {id: version, type: u4}
  - {id: num_element, type: u4}
  - {id: num_speaker_set, type: u4}
  - {id: num_speaker, type: u4}
  - {id: num_directional_curve, type: u4}
  - {id: num_directional_curve_element, type: u4}
  - {id: file_path_offset, type: s4}
  - {id: random_table_offset, type: s4}
  - {id: speaker_set_offset, type: s4}
  - {id: speaker_offset, type: s4}
  - {id: directional_curve_offset, type: s4}
  - {id: directional_curve_element_offset, type: s4}
  - {id: elements, type: element, repeat: expr, repeat-expr: num_element}
  
types:
  element: # rSoundRequest::Element /* size : 0x0000009c */
    seq:
      - {id: req_no, type: u2}
      - {id: pad_00, type: u2}
      - {id: category, type: u4}
      - {id: command, type: u4}
      - {id: global, type: u1} # mGlobal /* public */; // 0x0000000c
      - {id: pad_01, type: u1}
      - {id: id_1, type: u2}
      - {id: id_2, type: u2}
      - {id: id_3, type: u2}
      - {id: priority, type: u1}
      - {id: priority_mode, type: u1}
      - {id: pad_02, type: u2} # // 0x00000016
      - {id: limit, type: u4}
      - {id: link, type: u2}
      - {id: program_no, type: u2}
      - {id: split_no, type: u2}
      - {id: vol, type: u1}
      - {id: pad_03, type: u1} # //0x00000023
      - {id: pan, type: u2}
      - {id: pad_04, type: u2} # // 0x00000026
      - {id: pitch_shift, type: s4}
      - {id: effect_send, type: u4} #// 0x0000002c
      - {id: lfe_send, type: u4}
      - {id: random_req_no, type: u4}
      - {id: delay_timer, type: u4}
      - {id: booking_timer, type: u4}  
      - {id: center_volume, type: u4} # //0x00000040
      - {id: volume_curve_id, type: s4}
      - {id: effect_curve_id, type: s4}   
      - {id: lfe_curve_id, type: s4}
      - {id: directional_curve_id, type: s4} # // 0x00000050
      - {id: eq_no, type: u2}
      - {id: eq_effect_no, type: u2}
      - {id: effect_no, type: u2}
      - {id: pad_05, type: u2}
      - {id: interior_distance, type: f4}
      - {id: doppler_scaler, type: f4} # // 0x00000060
      - {id: free_area, type: s4, repeat: expr, repeat-expr: 8}
      - {id: random_volume_max, type: u2}
      - {id: random_volume_min, type: u2}
      - {id: random_pitch_max, type: u2}
      - {id: random_pitch_min, type: u2}
      - {id: pack_file_name_table_index, type: s4}
      - {id: speaker_set_index, type: s4}
      - {id: sound_package, type: u4}
      - {id: speaker_set, type: u4}
      #- {id: unk_00, type: u4, repeat: expr, repeat-expr: 35}
      #- {id: unk_05, type: u4}
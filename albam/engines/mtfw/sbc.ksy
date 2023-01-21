meta:
  id: mtframework_sbc
  file-extension: ksy
  endian: le
  title:  Resident Evil 5 (MTFramework) collision format
  application: Resident Evil 5/Biohazard 5
  file-extension: sbc
  license: CC0-1.0
  ks-version: 0.8

seq:
  - {id: id_magic, contents: [0x53, 0x42, 0x43, 0x31]} # SBC1
  - {id: unk_num_01, type: u2}
  - {id: num_groups, type: u2}
  - {id: unk_num_02, type: u2}
  - {id: unk_num_03, type: u2}
  - {id: num_boxes, type: u4}
  - {id: num_faces, type: u4}
  - {id: num_vertices, type: u4}
  - {id: bbox, type: tbox}
  - {id: boxes, type: re5boxes, repeat: expr, repeat-expr: num_boxes}
  - {id: groups, type: sbcgroup, repeat: expr, repeat-expr: num_groups}
  - {id: triangles, type : re5triangle, repeat: expr, repeat-expr: num_faces}
  - {id: vertices, type: vertex, repeat: expr, repeat-expr: num_vertices}
  
types:

  sbcgroup: #96 bytes
    seq:
      - {id: base, type: u4}
      - {id: ofs_tris, type: u4}
      - {id: ofs_b, type: u4}
      - {id: ofs_vertices, type: u4}
      - {id: group_id, type: u4}
      - {id: boxa, type: tbox}
      - {id: boxb, type: tbox}
      - {id: boxc, type: tbox}
      - {id: ida, type: u2}
      - {id: idb, type: u2}

  re5triangle: #28 bytes
    seq:
      - {id: a, type: u2}
      - {id: b, type: u2}
      - {id: c, type: u2}
      - {id: ida, type: u2}
      - {id: idb, type: u2}
      - {id: idc, type: u2}
      - {id: idd, type: u2}
      - {id: ide, type: u2}
      - {id: idf, type: u2}
      - {id: idg, type: u2}
      - {id: idh, type: u2}
      - {id: idi, type: u2}
      - {id: idj, type: u2}
      - {id: idk, type: u2}
  
  re5boxes: # 80 bytes
    seq:
      - {id: boxa, type: pbox}
      - {id: boxb, type: pbox}
      - {id: ida, type: u1}
      - {id: idb, type: u1}
      - {id: idc, type: u1}
      - {id: idd, type: u1}
      - {id: ide, type: u1}
      - {id: idf, type: u1}
      - {id: idg, type: u1}
      - {id: idh, type: u1}
      - {id: ids, type: u1, repeat: expr, repeat-expr: 8}
      
  vertex:
    seq:
      - {id: vector, type: vec4}
  
  tbox:
    seq:
      - {id: min, type: vec3}
      - {id: max, type: vec3}
      
  pbox:
    seq:
      - {id: min, type: vec4}
      - {id: max, type: vec4}
      
  vec4:
    seq:
      - {id: x, type: f4}
      - {id: y, type: f4}
      - {id: z, type: f4}
      - {id: w, type: f4}

  vec3:
    seq:
      - {id: x, type: f4}
      - {id: y, type: f4}
      - {id: z, type: f4}
  

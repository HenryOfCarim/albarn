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
  - {id: boxcount, type: u2}
  - {id: unk_num_02, type: u2}
  - {id: unk_num_03, type: u2}
  - {id: mvtc, type: u4}
  - {id: facecount, type: u4}
  - {id: ncount, type: u4}
  - {id: skipbbox, type: f4, repeat: expr, repeat-expr: 6}
  - {id: boxes, type: re5v4quad, repeat: expr, repeat-expr: mvtc}
  - {id: groups, type: sbcgroup, repeat: expr, repeat-expr: boxcount}
  - {id: triangles, type : re5triangle, repeat: expr, repeat-expr: facecount}
  - {id: vertices, type: vertex, repeat: expr, repeat-expr: ncount}
  
types:

  sbcgroup: #96 bytes
    seq:
      - {id: base, type: u4}
      - {id: offseta, type: u4}
      - {id: offsetb, type: u4}
      - {id: vstart, type: u4}
      - {id: grouid, type: u4}
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
  
  re5v4quad: # 80 bytes
    seq:
      - {id: a, type: vec4}
      - {id: b, type: vec4}
      - {id: c, type: vec4}
      - {id: d, type: vec4}
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
  

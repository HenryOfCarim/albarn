meta:
  id: lfs
  file-extension: lfs
  endian: le
  
  
seq:
   - {id: lfs_header, type: header}
   - {id: data_chunks, type: data_chunk, repeat: expr, repeat-expr: lfs_header.num_chunks }
  

types:
  header:
    seq:
    - {id: id_magic, contents: [0x52, 0x44, 0x4c, 0x58]}
    - {id: id_magic_2, type: u4}
    - {id: size_decompressed, type: u4}
    - {id: size_compressed, type: u4}
    - {id: num_chunks, type: u4}
      
  data_chunk:
    seq:
      - {id: size_compressed, type: u2}
      - {id: size_decompressed, type: u2} 
      - {id: offset, type: u4}
    instances:
      chunk:
        pos: offset 
        size: size_compressed
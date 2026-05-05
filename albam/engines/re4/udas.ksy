meta:
  id: udas
  file-extension: udas
  endian: le
  

seq:
 - {id: header, type: udas_header}
  
types:
  udas_header:
    seq:
    - {id: id_magic, type: u4, repeat: expr, repeat-expr 8}
    - {id: unk_00, type: u4}
    - {id: file_size, type: u4}
    - {id: unk_01, type: u4}
    - {id: data_offset, type: u4}
    instances:
     data_bloc:
      {pos: data_offset, type: udas_data}
  
  udas_data:
    seq:
    - {id: num_files, type: u4}
    - {id: padding, type: u4, repeat: expr, repeat-expr 3}
    - {id: offsets, type: u4, repeat: expr, repeat-expr num_files}
    - {id: file_extension, type: extension, repeat: expr, repeat-expr num_files}
    
  extension:
    seq:
      - {id: ext, type: str ,terminator: 0, encoding: UTF-8}
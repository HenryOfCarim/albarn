meta:
  endian: le
  file-extension: packed
  id: packed
  ks-version: 0.10
  title: Clive Baker's Jerico archives
  
seq:
  - {id: magic, contents:"BFPK"}
  - {id: unk_01, type: u4}
  - {id: num_files, type: u4}
  - {id: files, type: file_block, repeat: expr, repeat-expr: num_files}
  
types:
  file_block:
    seq:
      - {id: str_len, type: u4}
      - {id: file_name, type: str, size: str_len, encoding: UTF-8}
      - {id: file_size, type: u4}
      - {id: file_ofs, type: u4}
    instances:
      file_body:
        {pos: file_ofs, size: file_size}
meta:
  endian: le
  bit-endian: le
  file-extension: srd
  id: srd
  ks-version: "0.11"
  title: MTFramework SoundRandom
  
seq:
  - {id: magic, contents: "DNRS"} # struct rSoundRandom::Header /* size : 0x00000010 */
  - {id: version, type: u4}
  - {id: num_elements, type: u4} 	# unsigned int numElement /* public */; // 0x00000008
  - {id: reserved, type: u4}
  - {id: data_blocks, type: element, repeat: expr, repeat-expr: num_elements}
  
types:
  element:
    seq:
    - {id: m_req_no, type: u4}
    - {id: m_random_req_no_00, type: u4}
    - {id: m_percent_00, type: u4}
    - {id: m_random_req_no_01, type: u4}
    - {id: m_percent_01, type: u4}
    - {id: m_random_req_no_02, type: u4}
    - {id: m_percent_02, type: u4}
    - {id: m_random_req_no_03, type: u4}
    - {id: m_percent_03, type: u4}
    - {id: m_random_req_no_04, type: u4}
    - {id: m_percent_04, type: u4}
    - {id: m_random_req_no_05, type: u4}
    - {id: m_percent_05, type: u4}
    - {id: m_random_req_no_06, type: u4}
    - {id: m_percent_06, type: u4}
    - {id: m_random_req_no_07, type: u4}
    - {id: m_percent_07, type: u4}
    - {id: m_random_req_no_08, type: u4}
    - {id: m_percent_08, type: u4}
    - {id: m_random_req_no_09, type: u4}
    - {id: m_percent_09, type: u4}
    - {id: m_random_req_no_10, type: u4}
    - {id: m_percent_10, type: u4}
    - {id: m_random_req_no_11, type: u4}
    - {id: m_percent_11, type: u4}
    - {id: m_random_req_no_12, type: u4}
    - {id: m_percent_12, type: u4}
    - {id: m_random_req_no_13, type: u4}
    - {id: m_percent_13, type: u4}
    - {id: m_random_req_no_14, type: u4}
    - {id: m_percent_14, type: u4}
    - {id: m_random_req_no_15, type: u4}
    - {id: m_percent_15, type: u4}
    - {id: is_random_mode, type: b1} # 	char mIsSimpleRandomMode /* public */; // 0x00000084
    - {id: filler, type: b31}
    - {id: last_req_no, type: u4}
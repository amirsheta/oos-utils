create or replace package oos_util_crypto
as
  -- CONSTANTS
  /**
   * @constant gc_hash_md4 test
   * @constant gc_hash_md5
   * @constant gc_hash_sh1
   * @constant gc_hash_sh224
   * @constant gc_hash_sh256
   * @constant gc_hash_sh384
   * @constant gc_hash_sh512
   * @constant gc_hash_ripemd160
   * @constant gc_hmac_md4
   * @constant gc_hmac_md5
   * @constant gc_hmac_sh1
   * @constant gc_hmac_sh224
   * @constant gc_hmac_sh256
   * @constant gc_hmac_sh384
   * @constant gc_hmac_sh512
   * @constant gc_hmac_ripemd160
   */

  -- Hash Functions
  gc_hash_md4 constant pls_integer := 1;
  gc_hash_md5 constant pls_integer := 2;
  gc_hash_sh1 constant pls_integer := 3;
  gc_hash_sh224 constant pls_integer := 11;
  gc_hash_sh256 constant pls_integer := 4;
  gc_hash_sh384 constant pls_integer := 5;
  gc_hash_sh512 constant pls_integer := 6;
  gc_hash_ripemd160 constant pls_integer := 15;

  -- MAC Functions
  gc_hmac_md4 constant pls_integer := 0;
  gc_hmac_md5 constant pls_integer := 1;
  gc_hmac_sh1 constant pls_integer := 2;
  gc_hmac_sh224 constant pls_integer := 10;
  gc_hmac_sh256 constant pls_integer := 3;
  gc_hmac_sh384 constant pls_integer := 4;
  gc_hmac_sh512 constant pls_integer := 5;
  gc_hmac_ripemd160 constant pls_integer := 14;
  -- Block Cipher Algorithms
  encrypt_des constant pls_integer := 1;  -- 0x0001
  encrypt_3des_2key constant pls_integer := 2;  -- 0x0002
  encrypt_3des constant pls_integer := 3;  -- 0x0003
  encrypt_aes constant pls_integer := 4;  -- 0x0004
  encrypt_pbe_md5des constant pls_integer := 5;  -- 0x0005
  encrypt_aes128 constant pls_integer := 6;  -- 0x0006
  encrypt_aes192 constant pls_integer := 7;  -- 0x0007
  encrypt_aes256 constant pls_integer := 8;  -- 0x0008
  -- Block Cipher Chaining Modifiers
  chain_cbc constant pls_integer := 256;  -- 0x0100
  chain_cfb constant pls_integer := 512;  -- 0x0200
  chain_ecb constant pls_integer := 768;  -- 0x0300
  chain_ofb constant pls_integer := 1024;  -- 0x0400
  chain_ofb_real constant pls_integer := 1280;  -- 0x0500

  -- Block Cipher Padding Modifiers
  pad_pkcs5 constant pls_integer := 4096;  -- 0x1000
  pad_none constant pls_integer := 8192;  -- 0x2000
  pad_zero constant pls_integer := 12288;  -- 0x3000
  pad_orcl constant pls_integer := 16384;  -- 0x4000
  pad_oneandzeroes constant pls_integer := 20480;  -- 0x5000
  pad_ansi_x923 constant pls_integer := 24576;  -- 0x6000

  -- Stream Cipher Algorithms
  encrypt_rc4 constant pls_integer := 129;  -- 0x0081

  -- TODO mdsouza: What about allowing wrappers for string basd hashing?
  -- Convert string to hext rawtohex(utl_raw.cast_to_raw('hello'))

  -- Functions
  function hash(
    p_src raw,
    p_typ pls_integer)
  return raw;

  function mac( src raw, typ pls_integer, key raw )
  return raw;

  function randombytes( number_bytes positive )
  return raw;

  function encrypt( src raw, typ pls_integer, key raw, iv raw := null )
  return raw;

  function decrypt( src raw, typ pls_integer, key raw, iv raw := null )
  return raw;

end oos_util_crypto;

/

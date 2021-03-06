#!/bin/bash ../test_wrapper.sh

require_relative './app_model_test_base'

class CachesTests < AppModelTestBase

  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # caches.path
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  test 'F6CCC9',
  'caches path has correct format when set with trailing slash' do
    path = 'slashed/'
    set_caches_root(path)
    assert_equal path, caches.path
    assert correct_path_format?(caches)
  end

  #- - - - - - - - - - - - - - - -

  test 'C10B9D',
  'caches path has correct format when set without trailing slash' do
    path = 'unslashed'
    set_caches_root(path)
    assert_equal path + '/', caches.path
    assert correct_path_format?(caches)
  end

  #- - - - - - - - - - - - - - - -

  test '2177BF',
  'write_json, read_json round-trips' do
    set_caches_root(tmp_root)
    cache_filename = 'test_cache.json'
    caches.write_json(cache_filename, [0,1,2,3,4])
    array = caches.read_json(cache_filename)
    assert_equal 0, array[0]
  end

end

mkdir -p tests/data
cp test_data/coutwildrnp.zip tests/data
cp test_data/coutwildrnp.tar tests/data
cp test_data/coutwildrnp.json tests/data
cp -r tests /tmp/

SKIP="\
test_exception or \
test_collection or \
test_seq_rs or \
test_seq_no_rs or \
test_dst_crs_default_to_src_crs or \
test_different_crs or \
test_dst_crs_no_src or \
test_fio_load_layer or \
test_fio_ls_multi_layer or \
test_directory_trailing_slash or \
test_directory or \
test_fio_ls_single_layer or \
test_write_gb18030 or \
test_broken_encoding"

pushd /tmp
pytest -s -rxs -vvv -k "not ($SKIP)" tests
popd

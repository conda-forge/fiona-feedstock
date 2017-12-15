mkdir -p tests/data
cp test_data/coutwildrnp.zip tests/data
cp test_data/coutwildrnp.tar tests/data
cp test_data/coutwildrnp.json tests/data
cp -r tests /tmp/

pushd /tmp
if [[ $(uname) == Darwin ]]; then
  # retry this when https://github.com/Toblerity/Fiona/pull/516 is merged.
  py.test -s -rxs -v -k "not (test_fio_ls_multi_layer or test_directory_trailing_slash or test_directory or test_fio_ls_single_layer or test_write_gb18030 or test_broken_encoding)" tests
elif [[ $(uname) == Linux ]]; then
  py.test -s -rxs -v -k "not (test_fio_ls_multi_layer or test_directory_trailing_slash or test_directory or test_fio_ls_single_layer)" tests
fi
popd

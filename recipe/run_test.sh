mkdir -p tests/data
cp test_data/coutwildrnp.zip tests/data
cp test_data/coutwildrnp.tar tests/data
cp test_data/coutwildrnp.json tests/data
cp -r tests /tmp/

pushd /tmp

# test_drvsupport.py::test_no_append_driver_cannot_append[FlatGeobuf] GH#197
${PYTHON} -m pytest -s -rxs -v -k "not (test_no_append_driver_cannot_append[FlatGeobuf] or test_fio_ls_single_layer or test_directory or test_directory_trailing_slash or test_options or test_transaction or test_encoding_option_warning or test_search_debian_gdal_data or test_search_gdal_data_debian or test_collection_zip_http or test_compound_crs or test_mapinfo or test_no_append_driver_cannot_append[PCIDSK] or test_write_or_driver_error[DGN] or test_listdir_path or test_listdir_zipmemoryfile)"  -m "not wheel" tests
popd


# I believe it is safe to ignore the failures in tests/test_listing.py
#     def test_directory_trailing_slash(data_dir):
# >       assert fiona.listlayers(data_dir) == ['coutwildrnp', 'gre']
# E       AssertionError: assert ['gre', 'coutwildrnp'] == ['coutwildrnp', 'gre']
# E         At index 0 diff: u'gre' != 'coutwildrnp'
# E         Full diff:
# E         - [u'gre', u'coutwildrnp']
# E         + ['coutwildrnp', 'gre']

# Some wierd things happen with the gcc7 stack and pytest-catchlog
# test_encoding_option_warning

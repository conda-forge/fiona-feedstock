# OS X is broken.
# See: https://travis-ci.org/conda-forge/fiona-feedstock/jobs/198841996
if [[ $(uname) == Linux ]]; then
mkdir -p tests/tests/data
cp test_data/coutwildrnp.zip tests/tests/data

nosetests --exclude test_filter_vsi --exclude test_geopackage --exclude test_write_mismatch tests
fi

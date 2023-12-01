#/usr/bin/env bash

# Get JPEG files because they are much smaller, but store them
# with .tif extension because the PAGE XML files expect that.
for xml in $(find */*/page -name "*.xml"|sort); do (cd $(dirname $xml); page=$(basename $xml .xml); base=$(echo $page|sed 's/_[0-9]*$//'); test -f $page.tif || (echo $page; curl --silent -Lo $page.tif https://opendigi.ub.uni-tuebingen.de/opendigi/image/$base/$page.jp2/full/full/0/default.jpg)); done

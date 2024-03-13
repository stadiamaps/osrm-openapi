#!/usr/bin/env zsh

set -e
set -u

clean=false

language="$1"
shift

for arg in "$@"
do
     case $arg in
          --clean)
               clean=true
               shift # Remove --release from processing
               ;;
          *)
               shift # Ignore other argument from processing
               ;;
     esac
done

# Clean the .build directory
if $clean; then
     if [ -d ".build" ]; then
          rm -r .build
     fi
     mkdir -p .build
fi

if [ "$language" = "swift" ]; then
     # Clean the Generated Swift Models
     if $clean; then
          if [ -d "./apple/Sources/OSRM/Models" ]; then
               rm -r ./apple/Sources/OSRM/Models
          fi
          mkdir -p ./apple/Sources/OSRM/Models
     fi

     openapi-generator generate -i ./openapi.yaml -g swift5 --strict-spec=true \
          -o .build --global-property models --model-package Models \
          --skip-validate-spec --additional-properties=useJsonEncodable=false

     swiftformat .build/OpenAPIClient/Classes/OpenAPIsModels

     cp .build/OpenAPIClient/Classes/OpenAPIsModels/* ./apple/Sources/OSRM/Models
else
     echo "Language not supported"
     exit 1
fi
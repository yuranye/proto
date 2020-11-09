for SERVICE in $(find * -type f -name "*.proto"); do #iterate over services
  echo "$SERVICE"
  for PROTOFILE in $(find "$SERVICE" -type f -name "*.proto"); do #recursive iterate over service protofiles 
    echo "$PROTOFILE"
    docker run --rm -v${PWD}:${PWD} -w${PWD} jaegertracing/protobuf:latest --proto_path=${PWD} --go_out=${PWD}/gen/go "$PROTOFILE"
    docker run --rm -v${PWD}:${PWD} -w${PWD} jaegertracing/protobuf:latest --proto_path=${PWD} --csharp_out=${PWD}/gen/csharp "$PROTOFILE"
  done
done

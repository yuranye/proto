for SERVICE in $(find * -type f -name "*.proto"); do #iterate over services
  for PROTOFILE in $(find "$SERVICE" -type f -name "*.proto"); do #recursive iterate over service protofiles 
    echo "$PROTOFILE" "go"
    docker run --rm -v${PWD}:${PWD} -w${PWD} jaegertracing/protobuf:latest --proto_path=${PWD} --go_out=${PWD}/gen/go "$PROTOFILE"
    
    echo "$PROTOFILE" "csharp"
    docker run --rm -v${PWD}:${PWD} -w${PWD} jaegertracing/protobuf:latest --proto_path=${PWD} --csharp_out=${PWD}/gen/csharp "$PROTOFILE"
  done
done

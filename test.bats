setup() {
  docker history resnullius/offlineimap >/dev/null 2>&1
}

@test "offlineimap is there" {
  run docker run --rm --entrypoint "" resnullius/offlineimap which offlineimap
  [ $status -eq 0 ]
}

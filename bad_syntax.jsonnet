{
  local arr1 = ['foo', 'bar'],
  local arr2 = ['baz'],
  local bad_local = ['something'],
  bad:
    arr1 +
    arr2,
}

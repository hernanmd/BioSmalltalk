*biosupport
isZipped

  ^ (self first: 2) asByteArray = GZipConstants gzipMagic asByteArray reverse
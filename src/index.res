module Hindi = {
  type fileSyncModule = {toString: (. unit) => string}
  @module("fs") @val external readFileSync: (. string) => fileSyncModule = "readFileSync"

  let hindi_words = readFileSync(. "./hindi/hindi_curated.csv").toString(.)

  let lines = Js.String.split("\n", hindi_words)
}

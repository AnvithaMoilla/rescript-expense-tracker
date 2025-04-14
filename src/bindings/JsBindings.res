@val @scope("localStorage") external getItem: string => Js.Nullable.t<string> = "getItem"
@val @scope("localStorage") external setItem: (string, string) => unit = "setItem"


@val @scope("JSON") external parseIntoMyData: string => 'a = "parse"
@val @scope("JSON") external stringify: Js.Json.t => string = "stringify"
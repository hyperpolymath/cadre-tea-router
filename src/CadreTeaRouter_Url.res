@@ocaml.doc("URL representation and utilities")

@ocaml.doc("Represents a parsed URL")
type t = {
  path: string,
  query: option<string>,
  fragment: option<string>,
}

@ocaml.doc("Parse a URL string into components")
let parse: string => t = url => {
  // TODO: Implement proper URL parsing using cadre-router
  {
    path: url,
    query: None,
    fragment: None,
  }
}

@ocaml.doc("Convert URL components back to a string")
let toString: t => string = ({path, query, fragment}) => {
  let queryPart = query->Option.mapOr("", q => "?" ++ q)
  let fragmentPart = fragment->Option.mapOr("", f => "#" ++ f)
  path ++ queryPart ++ fragmentPart
}

@ocaml.doc("Get the current browser URL")
let current: unit => t = () => {
  // Browser-specific implementation
  switch %external(__unsafe_window) {
  | None => {path: "/", query: None, fragment: None}
  | Some(_) => parse(%raw(`window.location.pathname + window.location.search + window.location.hash`))
  }
}

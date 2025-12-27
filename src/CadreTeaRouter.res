@@ocaml.doc("
  TEA-specialised routing integration for ReScript.

  This module provides the wiring to connect cadre-router's URL parsing
  to TEA (The Elm Architecture) applications.
")

module Router = CadreTeaRouter_Router
module Navigation = CadreTeaRouter_Navigation
module Url = CadreTeaRouter_Url

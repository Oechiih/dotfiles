# Catppuccin Frappé theme for nushell
# https://github.com/catppuccin/nushell

$env.config.color_config = {
  separator:                   "#737994"   # overlay0
  leading_trailing_space_bg:   { attr: n }
  header:                      { fg: "#a6d189" attr: b }  # green bold
  empty:                       "#8caaee"   # blue
  bool:                        "#81c8be"   # teal
  int:                         "#ef9f76"   # peach
  filesize:                    "#85c1dc"   # sapphire
  duration:                    "#e5c890"   # yellow
  date:                        "#f4b8e4"   # pink
  range:                       "#c6d0f5"   # text
  float:                       "#ef9f76"   # peach
  string:                      "#c6d0f5"   # text
  nothing:                     "#737994"   # overlay0
  binary:                      "#ef9f76"   # peach
  cell-path:                   "#c6d0f5"   # text
  row_index:                   { fg: "#ca9ee6" attr: b }  # mauve bold
  record:                      "#c6d0f5"   # text
  list:                        "#c6d0f5"   # text
  block:                       "#8caaee"   # blue
  hints:                       "#626880"   # surface2
  search_result:               { fg: "#303446" bg: "#e78284" }  # base/red

  # Syntax highlighting
  shape_and:                   { fg: "#ca9ee6" attr: b }
  shape_binary:                { fg: "#ef9f76" attr: b }
  shape_block:                 { fg: "#8caaee" attr: b }
  shape_bool:                  "#81c8be"
  shape_closure:               { fg: "#81c8be" attr: b }
  shape_custom:                "#a6d189"
  shape_datetime:              { fg: "#81c8be" attr: b }
  shape_directory:             "#81c8be"
  shape_external:              "#85c1dc"
  shape_external_resolved:     "#81c8be"
  shape_externalarg:           { fg: "#a6d189" attr: b }
  shape_filepath:              "#81c8be"
  shape_flag:                  { fg: "#8caaee" attr: b }
  shape_float:                 { fg: "#ef9f76" attr: b }
  shape_garbage:               { fg: "#c6d0f5" bg: "#e78284" attr: b }
  shape_glob_interpolation:    { fg: "#81c8be" attr: b }
  shape_globpattern:           { fg: "#81c8be" attr: b }
  shape_int:                   { fg: "#ca9ee6" attr: b }
  shape_internalcall:          { fg: "#81c8be" attr: b }
  shape_keyword:               { fg: "#ca9ee6" attr: b }
  shape_list:                  { fg: "#81c8be" attr: b }
  shape_literal:               "#8caaee"
  shape_match_pattern:         "#a6d189"
  shape_matching_brackets:     { attr: u }
  shape_nothing:               "#81c8be"
  shape_operator:              "#e5c890"
  shape_or:                    { fg: "#ca9ee6" attr: b }
  shape_pipe:                  { fg: "#ca9ee6" attr: b }
  shape_range:                 { fg: "#e5c890" attr: b }
  shape_raw_string:            { fg: "#a6d189" attr: b }
  shape_record:                { fg: "#81c8be" attr: b }
  shape_redirection:           { fg: "#ca9ee6" attr: b }
  shape_signature:             { fg: "#a6d189" attr: b }
  shape_string:                "#a6d189"
  shape_string_interpolation:  { fg: "#81c8be" attr: b }
  shape_table:                 { fg: "#8caaee" attr: b }
  shape_variable:              "#ca9ee6"
  shape_vardecl:               { fg: "#ca9ee6" attr: u }
  shape_where:                 { fg: "#ca9ee6" attr: b }
}

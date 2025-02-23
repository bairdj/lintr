#' Default linters
#'
#' @description List of default linters for [lint()]. Use
#' [linters_with_defaults()] to customize it. Most of the default linters
#' are based on [the tidyverse style guide](https://style.tidyverse.org/).
#'
#' The set of default linters is as follows (any parameterized linters, e.g., `line_length_linter` use their default
#' argument(s), see `?<linter_name>` for details):
#'
#' @evalRd rd_linters("default")
#' @seealso [linters] for a complete list of linters available in lintr.
#'
#' @export
default_linters <- modify_defaults(
  defaults = list(),
  assignment_linter(),
  brace_linter(),
  commas_linter(),
  commented_code_linter(),
  cyclocomp_linter(),
  equals_na_linter(),
  function_left_parentheses_linter(),
  indentation_linter(),
  infix_spaces_linter(),
  line_length_linter(),
  object_length_linter(),
  object_name_linter(),
  object_usage_linter(),
  paren_body_linter(),
  pipe_continuation_linter(),
  quotes_linter(),
  semicolon_linter(),
  seq_linter(),
  spaces_inside_linter(),
  spaces_left_parentheses_linter(),
  T_and_F_symbol_linter(),
  trailing_blank_lines_linter(),
  trailing_whitespace_linter(),
  vector_logic_linter(),
  whitespace_linter()
)

#' Default undesirable functions and operators
#'
#' Lists of function names and operators for [undesirable_function_linter()] and [undesirable_operator_linter()].
#' There is a list for the default elements and another that contains all available elements.
#' Use [modify_defaults()] to produce a custom list.
#'
#' @details
#' The following functions are sometimes regarded as undesirable:
#'
#'  * [attach()] modifies the global search path. Use roxygen2's @importFrom statement in packages, or `::` in scripts.
#'  * [browser()] pauses execution when run and is likely a leftover from debugging. It should be removed.
#'  * [debug()] traps a function and causes execution to pause when that function is run. It should be removed.
#'  * [debugcall()] works similarly to [debug()], causing execution to pause. It should be removed.
#'  * [debugonce()] is only useful for interactive debugging. It should be removed.
#'  * [detach()] modifies the global search path. Detaching environments from the search path is rarely necessary in
#'    production code.
#'  * [ifelse()] isn't type stable. Use an `if`/`else` block for scalar logic, or use
#'    `dplyr::if_else()`/`data.table::fifelse()` for type stable vectorized logic.
#'  * [.libPaths()] permanently modifies the library location. Use [withr::with_libpaths()] for a temporary change
#'    instead.
#'  * [library()] modifies the global search path. Use roxygen2's @importFrom statement in packages, or `::` in scripts.
#'  * [loadNamespace()] doesn't provide an easy way to signal failures. Use the return value of [requireNamespace()]
#'    instead.
#'  * [mapply()] isn't type stable. Use [Map()] to guarantee a list is returned and simplify accordingly.
#'  * [options()] permanently modifies the session options. Use [withr::with_options()] for a temporary change instead.
#'  * [par()] permanently modifies the graphics device parameters. Use [withr::with_par()] for a temporary change
#'    instead.
#'  * [require()] modifies the global search path. Use roxygen2's @importFrom statement in packages, and [library()]
#'    or `::` in scripts.
#'  * [sapply()] isn't type stable. Use [vapply()] with an appropriate `FUN.VALUE=` argument to obtain type stable
#'    simplification.
#'  * [setwd()] modifies the global working directory. Use [withr::with_dir()] for a temporary change instead.
#'  * [sink()] permanently redirects output. Use [withr::with_sink()] for a temporary redirection instead.
#'  * [source()] loads code into the global environment unless `local = TRUE` is used, which can cause unexpected
#'    behavior.
#'  * [substring()] should be replaced by [substr()] with appropriate `stop=` value.
#'  * [Sys.setenv()] permanently modifies the global environment variables. Use [withr::with_envvar()] for a temporary
#'    change instead.
#'  * [Sys.setlocale()] permanently modifies the session locale. Use [withr::with_locale()] for a temporary change
#'    instead.
#'  * [trace()] traps a function and causes execution of arbitrary code when that function is run. It should be removed.
#'  * [undebug()] is only useful for interactive debugging with [debug()]. It should be removed.
#'  * [untrace()] is only useful for interactive debugging with [trace()]. It should be removed.
#'
#' The following operators are sometimes regarded as undesirable:
#'
#'  * \code{\link[base:ns-dblcolon]{:::}} accesses non-exported functions inside packages. Code relying on these is
#'    likely to break in future versions of the package because the functions are not part of the public interface and
#'    may be changed or removed by the maintainers without notice.
#'    Use public functions via `::` instead.
#'  * [`<<-`][base::assignOps] and `->>` assign outside the current environment in a way that can be hard to reason
#'    about. Prefer fully-encapsulated functions wherever possible, or, if necessary, assign to a specific environment
#'    with [assign()]. Recall that you can create an environment at the desired scope with [new.env()].
#'
#' @format A named list of character strings.
#' @rdname default_undesirable_functions
#' @export
all_undesirable_functions <- modify_defaults(
  defaults = list(),
  attach =
    "use roxygen2's @importFrom statement in packages, or `::` in scripts. attach() modifies the global search path",
  browser =
    "remove this likely leftover from debugging. It pauses execution when run",
  debug = paste(
    "remove this likely leftover from debugging.",
    "It traps a function and causes execution to pause when that function is run"
  ),
  debugcall = paste(
    "remove this likely leftover from debugging.",
    "It traps a function and causes execution to pause when that function is run"
  ),
  debugonce = paste(
    "remove this likely leftover from debugging.",
    "It traps a function and causes execution to pause when that function is run"
  ),
  detach = paste(
    "avoid modifying the global search path.",
    "Detaching environments from the search path is rarely necessary in production code"
  ),
  ifelse = paste(
    "use an `if`/`else` block for scalar logic,",
    "or use dplyr::if_else()/data.table::fifelse() for type-stable vectorized logic"
  ),
  .libPaths = paste(
    "use withr::with_libpaths() for a temporary change",
    "instead of permanently modifying the library location"
  ),
  library = paste(
    "use roxygen2's @importFrom statement in packages and `::` in scripts,",
    "instead of modifying the global search path"
  ),
  loadNamespace =
    "use the return value of requireNamespace() instead to provide an easy way to signal failures",
  mapply =
    "use Map() to guarantee a list is returned and simplify accordingly",
  options =
    "use withr::with_options() for a temporary change instead of permanently modifying the session options",
  par =
    "use withr::with_par() for a temporary change instead of permanently modifying the graphics device parameters",
  require = paste(
    "use roxygen2's @importFrom statement in packages and library() or `::` in scripts,",
    "instead of modifying the global search path"
  ),
  sapply =
    "use vapply() with an appropriate `FUN.VALUE=` argument to obtain type-stable simplification",
  setwd =
    "use withr::with_dir() for a temporary change instead of modifying the global working directory",
  sink =
    "use withr::with_sink() for a temporary redirection instead of permanently redirecting output",
  source = paste(
    "manage dependencies through packages.",
    "source() loads code into the global environment unless `local = TRUE` is used,",
    "which can cause hard-to-predict behavior"
  ),
  substring =
    "use substr() with appropriate `stop=` value.",
  Sys.setenv =
    "use withr::with_envvar() for a temporary change instead of permanently modifying global environment variables",
  Sys.setlocale =
    "use withr::with_locale() for a temporary change instead of permanently modifying the session locale",
  trace = paste(
    "remove this likely leftover from debugging.",
    "It traps a function and causes execution of arbitrary code when that function is run"
  ),
  undebug = paste(
    "remove this likely leftover from debugging.",
    "It is only useful for interactive debugging with debug()"
  ),
  untrace = paste(
    "remove this likely leftover from debugging.",
    "It is only useful for interactive debugging with trace()"
  )
)

#' @rdname default_undesirable_functions
#' @format NULL
#' @export
default_undesirable_functions <- all_undesirable_functions[names(all_undesirable_functions) %in% c(
  "attach",
  "browser",
  "debug",
  "debugcall",
  "debugonce",
  "detach",
  ".libPaths",
  "library",
  "mapply",
  "options",
  "par",
  "require",
  "sapply",
  "setwd",
  "sink",
  "source",
  "Sys.setenv",
  "Sys.setlocale",
  "trace",
  "undebug",
  "untrace"
)]

#' @rdname default_undesirable_functions
#' @format NULL
#' @export
all_undesirable_operators <- modify_defaults(
  defaults = list(),
  ":::" = paste(
    "It accesses non-exported functions inside packages. Code relying on these is likely to break in",
    "future versions of the package because the functions are not part of the public interface and may be",
    "changed or removed by the maintainers without notice. Use public functions via :: instead."
  ),
  "<<-" = paste(
    "It assigns outside the current environment in a way that can be hard to reason about.",
    "Prefer fully-encapsulated functions wherever possible, or, if necessary, assign to a specific",
    "environment with assign(). Recall that you can create an environment at the desired scope with",
    "new.env()."
  ),
  "->>" = paste(
    "It assigns outside the current environment in a way that can be hard to reason about.",
    "Prefer fully-encapsulated functions wherever possible, or, if necessary, assign to a specific",
    "environment with assign(). Recall that you can create an environment at the desired scope with",
    "new.env()."
  )
)

#' @rdname default_undesirable_functions
#' @format NULL
#' @export
default_undesirable_operators <- all_undesirable_operators[names(all_undesirable_operators) %in% c(
  ":::",
  "<<-",
  "->>"
)]

#' Default lintr settings
#'
#' @description
#' The default settings consist of
#'
#'  - `linters`: a list of default linters (see [default_linters()])
#'  - `encoding`: the character encoding assumed for the file
#'  - `exclude`: pattern used to exclude a line of code
#'  - `exclude_start`, `exclude_end`: patterns used to mark start and end of the code block to exclude
#'  - `exclude_linter`, `exclude_linter_sep`: patterns used to exclude linters
#'  - `exclusions`:a list of files to exclude
#'  - `cache_directory`: location of cache directory
#'  - `comment_token`: a GitHub token character
#'  - `comment_bot`: decides if lintr comment bot on GitHub can comment on commits
#'  - `error_on_lint`: decides if error should be produced when any lints are found
#'
#' @examples
#' # available settings
#' names(default_settings)
#'
#' # linters included by default
#' names(default_settings$linters)
#'
#' # default values for a few of the other settings
#' default_settings[c(
#'   "encoding",
#'   "exclude",
#'   "exclude_start",
#'   "exclude_end",
#'   "exclude_linter",
#'   "exclude_linter_sep",
#'   "exclusions",
#'   "error_on_lint"
#' )]
#'
#' @seealso [read_settings()], [default_linters]
#' @export
default_settings <- NULL

settings <- NULL

# nocov start
.onLoad <- function(libname, pkgname) {
  op <- options()
  op_lintr <- list(
    lintr.linter_file = Sys.getenv("R_LINTR_LINTER_FILE", ".lintr")
  )
  toset <- !(names(op_lintr) %in% names(op))
  if (any(toset)) options(op_lintr[toset])

  backports::import(pkgname, c("trimws", "lengths", "deparse1", "...names"))
  # requires R>=3.6.0; see https://github.com/r-lib/backports/issues/68
  base_ns <- getNamespace("base")
  backports_ns <- getNamespace("backports")
  lintr_ns <- getNamespace(pkgname)
  for (base_fun in c("str2lang", "str2expression")) {
    if (!exists(base_fun, base_ns)) {
      assign(base_fun, get(base_fun, backports_ns), lintr_ns)
    }
  }

  utils::assignInMyNamespace("default_settings", list(
    linters = default_linters,
    encoding = "UTF-8",
    exclude = rex("#", any_spaces, "nolint"),
    exclude_next = rex("#", any_spaces, "nolint next"),
    exclude_start = rex("#", any_spaces, "nolint start"),
    exclude_end = rex("#", any_spaces, "nolint end"),
    exclude_linter = rex(
      start, any_spaces, ":", any_spaces,
      capture(
        name = "linters",
        zero_or_more(one_or_more(none_of(",.")), any_spaces, ",", any_spaces),
        one_or_more(none_of(",."))
      ), "."
    ),
    exclude_linter_sep = rex(any_spaces, ",", any_spaces),
    exclusions = list(),
    cache_directory = R_user_dir("lintr", "cache"),
    comment_token = Sys.getenv("GITHUB_TOKEN", unset = NA) %||% rot(
      paste0(
        "0n12nn72507",
        "r6273qnnp34",
        "43qno7q42n1",
        "n71nn28"
      ),
      54L - 13L
    ),
    comment_bot = logical_env("LINTR_COMMENT_BOT") %||% TRUE,
    error_on_lint = logical_env("LINTR_ERROR_ON_LINT") %||% FALSE
  ))

  utils::assignInMyNamespace("settings", list2env(default_settings, parent = emptyenv()))

  if (requireNamespace("tibble", quietly = TRUE)) {
    registerS3method("as_tibble", "lints", as_tibble.lints, asNamespace("tibble"))
  }
  if (requireNamespace("data.table", quietly = TRUE)) {
    registerS3method("as.data.table", "lints", as.data.table.lints, asNamespace("data.table"))
  }
}
# nocov end

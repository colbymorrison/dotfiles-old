let g:ale_python_pyls_executable = '/usr/local/bin/pyls-language-server'
let g:ale_fixers = {'python': ['pyfmt']}
let g:ale_linters = { 'python': ['flake8', 'pyls'] }

let g:ale_lint_on_enter = 1
let g:ale_python_autopep8_use_global=1
let g:ale_python_flake8_use_global=1
let g:ale_python_isort_use_global=1
let g:ale_python_mypy_use_global=1
let g:ale_python_mypy_options='--ignore-missing-imports'
let g:ale_python_pycodestyle_use_global=1
let g:ale_python_pylint_use_global=1
let g:ale_python_yapf_use_global=1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_completion_enabled = 1

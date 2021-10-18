let g:firenvim_config = {
            \ 'globalSettings': {
            \ 'alt': 'all',
            \  },
            \ 'localSettings': {
            \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
            \ },
            \ }
            \ }

let fc = g:firenvim_config['localSettings']
let fc['https?://twitter.com'] = {'takeover': 'never', 'priority': 1}
let fc['https?://www.twitch.tv'] = {'takeover': 'never', 'priority': 1}
let fc['https?://dashboard.twitch.tv'] = {'takeover': 'never', 'priority': 1}
let fc['https?://www.instagram.com'] = {'takeover': 'never', 'priority': 1}
let fc['https?://www.notion.so'] = {'takeover': 'never', 'priority': 1}
let fc['https?://roamresearch.com'] = {'takeover': 'never', 'priority': 1}
let fc['https?://meet.google.com'] = {'takeover': 'never', 'priority': 1}

# -*- coding: utf-8 -*-
puts 'Configurações'

def setting(name, value, scoping, deletable, type)
  if type == 'boolean'
    if value == true
      value =
"--- 'true'
"
    end
    if value == false
      value =
"--- 'false'
"
    end
  elsif type == 'choice'
    value = 
"--- #{value}
...
"  
  elsif type == 'list'
    value = 
"---
#{value.join('
')}
" 
  end
  [name, value, scoping, deletable]
end

settings = []
settings << setting('use_marketable_urls', true, 'pages', true, 'boolean')
settings << setting('i18n_translation_enabled', true, 'refinery', true, 'boolean')
settings << setting('i18n_translation_default_frontend_locale', ':pt-BR', 'refinery', true, 'choice')
settings << setting('dragonfly_secret', 'd232d407b4e8fb7480501934dfe14df822e0f0d912cfef09', nil, true, 'choice')
settings << setting('approximate_ascii', false, 'pages', true, 'boolean')
settings << setting('strip_non_ascii', false, 'pages', true, 'boolean')
settings << setting(
  'i18n_translation_locales', 
  [
    ":pt-BR: Português",
    ":en: English",
    ":fr: Français",
    ":nl: Nederlands",
    ":da: Dansk",
    ":nb: Norsk Bokmål",
    ":sl: Slovenian",
    ":es: Español",
    ":it: Italiano",
    ":de: Deutsch",
    ":lv: Latviski",
    ":ru: Русский",
    ":sv: Svenska",
    ":pl: Polski",
    ":zh-CN: Simplified Chinese",
    ":zh-TW: Traditional Chinese",
    ":el: Ελληνικά",
    ":rs: Srpski",
    ":cs: Česky",
    ":sk: Slovenský",
    ":jp: 日本語",
  ],
  'refinery', true, 'list'
)
settings << setting('site_name', 'Arquiteturas de Computadores', nil, true, 'choice')
settings << setting('use_resource_caching', true, nil, true, 'boolean')
settings << setting('use_google_ajax_libraries', false, nil, true, 'boolean')
settings << setting('i18n_translation_default_locale', ':pt-BR', 'refinery', true, 'choice')
settings << setting('i18n_translation_current_locale', ':pt-BR', 'refinery', true, 'choice')
settings << setting('i18n_translation_frontend_locales', ':pt-BR', 'refinery', true, 'choice')
settings << setting('activity_show_limit', '7', nil, true, 'choice')
settings << setting(
  'page_title', 
  [
    ":chain_page_title: false",
    ":ancestors:",
    "  :separator: ! ' | '",
    "  :class: ancestors",
    "  :tag: span",
    ":page_title:",
    "  :class: !!null ",
    "  :tag: !!null ",
    "  :wrap_if_not_chained: false",
  ],
  nil, true, 'list'
)
settings << setting('authenticity_token_on_frontend', true, nil, true, 'boolean')
settings << setting('frontend_refinery_stylesheets_enabled', true, nil, true, 'boolean')
settings << setting('menu_hide_children', false, nil, true, 'boolean')
settings << setting('cache_pages_backend', false, nil, true, 'boolean')
settings << setting(
  'default_page_parts', 
  [
    "- Body",
    "- Page Call",
    "- Side Body",
  ],
  nil, true, 'list'
)
settings << setting(
  'image_views', 
  [
    "- :grid",
    "- :list",
  ],
  nil, true, 'list'
)
settings << setting('preferred_image_view', ':grid', nil, true, 'choice')
settings << setting('superuser_can_assign_roles', false, nil, true, 'boolean')
settings << setting('new_page_parts', true, nil, true, 'boolean')
settings << setting(
  'user_image_sizes', 
  [
    ":small: 110x110>",
    ":medium: 225x255>",
    ":large: 450x450>",
  ],
  nil, true, 'list'
)


settings.each do |name, value, scoping, destroyable|
  r = RefinerySetting.new(
    :name => name,
    :value => value,
    :destroyable => destroyable,
    :restricted => false,
    :form_value_type => 'text_area'
  )
  unless scoping.nil?
    r.scoping = scoping
  end
  r.save!
end
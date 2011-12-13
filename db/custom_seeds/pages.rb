# -*- coding: utf-8 -*-

puts 'Páginas'

::Page.reset_column_information
# Check whether all columns are applied yet by seo_meta.
unless !defined?(::SeoMeta) || ::SeoMeta.attributes.keys.all? { |k|
    ::Page.translation_class.instance_methods.include?(k)
  }
  # Make pages model seo_meta because not all columns are accessible.
  ::Page.translation_class.send :is_seo_meta
end

def criar_pagina(parts, options)
  p = Page.create!(options)
  parts.each do |title, body, position|
    PagePart.create!(
      :page_id => p.id,
      :title => title,
      :body => body,
      :position => position
    )
  end
  p
end

puts '-Home'
home = criar_pagina(
  [
    ["Page Call", "
	<h2>Bem Vindo</h2>
	<h3>Ao site de Arquitetura de Computadores</h3>", 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
  ], {
    :title => 'Home',
    :link_url => '/',
    :deletable => false,
    :position => 0
  }
)

puts '--404'
criar_pagina(
  [
    ["Body", "<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>", 0],
    ["Page Call", "", 1],
    ["Side Body", "", 2],
  ], {
    :title => 'Page not found',
    :menu_match => '^/404$',
    :show_in_menu => false,
    :deletable => false,
    :position => 0,
    :parent_id => home.id
  }
)

puts '--Disciplina'
criar_pagina(
  [
    ["Home", "<p>Esta disciplina tem como objetivo principal apresentar os princípios básicos da arquitetura de computadores, mostrando os vários níveis, desde o microprogramável, até o nível que executa a linguagem de programação Assembly.</p>
  <p>Os conceitos fundamentais serão o apresentados ao longo do curso, não se detendo em detalhes de certos computadores.</p>", 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
    ["Page Call", "
	<h2>Veja toda informação</h2>
	<h3>Disciplina, professores e site</h3>", 3],
  ], {
    :title => 'A Disciplina',
    :link_url => '/disciplina',
    :parent_id => home.id,
    :position => 1
  }
)

puts '--Trabalhos'
criar_pagina(
  [
    ["Home", "<p>Veja trabalhos dos períodos anteriores</p>", 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
    ["Page Call", "", 3],
  ], {
    :title => 'Trabalhos',
    :link_url => '/projects',
    :position => 2,
    :parent_id => home.id
  }
)


puts '--Veja Também'
criar_pagina(
  [
    ["Home", 
%(<ul class="see-too">
  <li>
    <h3>Vídeos</h3>
    <img rel="225x255" alt="Youtube" title="Youtube" src="#{Image.find_by_image_name('youtube.png').url}" width="100" height="80" />
    <p><a title="/studies/category/2" href="/studies/category/2">Videos sobre a Arquitetura de Computadores</a>
    </p>
  </li>
  <li>
    <h3>Slides</h3>
    <img rel="225x255" alt="Slide" title="Slide" src="#{Image.find_by_image_name('slide.png').url}" width="100" height="80" />
    <p><a title="/studies/category/1" href="/studies/category/1">Conteúdo completo para você estudar</a>
    </p>
  </li> 
  <li class="last">
    <h3>Monitoria</h3>
    <img rel="225x255" alt="Question" title="Question" src="#{Image.find_by_image_name('question.png').url}" width="100" height="80" />
    <p><a title="Monitoria" href="/monitoria">Comunicação em tempo real através de video chat</a>
    </p>
  </li>
</ul>), 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
    ["Page Call", "", 3],
  ], {
    :title => 'Veja também',
    :skip_to_first_child => true,
    :parent_id => home.id,
    :position => 3
  }
)

puts '-Notícias'
criar_pagina(
  [
    ["Page Call", "<p>Page Call Notícias</p><br/>", 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
  ], {
    :title => 'Notícias',
    :menu_match => '^/updates(\/|\/.+?|)$',
    :link_url => '/updates',
    :deletable => false,
    :position => 4
  }
)

puts '-Disciplina'
criar_pagina(
  [
    ["Body", "", 0],
    ["Side Body", "", 1],
    ["Page Call", "<p>Page Call Disciplina</p><br/>", 2],
  ], {
    :title => 'Disciplina',
    :deletable => true,
    :position => 5
  }
)

puts '-Conteúdo'
criar_pagina(
  [
    ["Page Call", "<p>Page Call Estudos</p><br/>", 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
  ], {
    :title => 'Conteúdo',
    :link_url => '/studies',
    :menu_match => '^/studies(\/|\/.+?|)$',
    :deletable => false,
    :position => 6
  }
)

puts '-Trabalhos'
criar_pagina(
  [
    ["Page Call", "<p>Page Call Trabalhos</p><br/>", 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
  ], {
    :title => 'Trabalhos',
    :link_url => '/projects',
    :menu_match => '^/projects(\/|\/.+?|)$',
    :deletable => false,
    :position => 7
  }
)

puts '-Monitoria'
criar_pagina(
  [
    ["Body", "", 0],
    ["Side Body", "", 1],
    ["Page Call", "<p>Page Call Monitoria</p><br/>", 2],
  ], {
    :title => 'Monitoria',
    :deletable => true,
    :position => 8
  }
)

puts '-Sobre (hidden)'
criar_pagina(
  [
    ["Body", 
"<p>Este site foi criado como projeto da disciplina Arquitetura de Computadores em 2011.2</p>
<p>Grupo:</p>
<ul><li>Guilherme Rangel Ferreira</li>
  <li>João Felipe Nicolaci Pimentel</li>
  <li>Lucas de Sousa Nadalutti</li>
  <li>Luis Antônio Vieira Junior</li>
  <li>Marcelle Silva Guiné</li>
</ul>", 0],
    ["Page Call", "<p>Page Call Sobre</p><br/>", 1],
    ["Side Body", "", 2],
  ], {
    :title => 'Sobre',
    :deletable => false,
    :show_in_menu => false,
    :position => 9
  }
)

puts '-Eventos (hidden)'
criar_pagina(
  [
    ["Page Call", "<p>Page Call Eventos</p><br/>", 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
  ], {
    :title => 'Trabalhos',
    :link_url => '/events',
    :menu_match => '^/events(\/|\/.+?|)$',
    :deletable => false,
    :show_in_menu => false,
    :position => 10
  }
)

puts '-Categorias (hidden)'
criar_pagina(
  [
    ["Page Call", "<p>Page Call Categorias</p><br/>", 0],
    ["Body", "", 1],
    ["Side Body", "", 2],
  ], {
    :title => 'Conteúdo',
    :link_url => '/study_categories',
    :menu_match => '^/study_categories(\/|\/.+?|)$',
    :deletable => false,
    :show_in_menu => false,
    :position => 11
  }
)
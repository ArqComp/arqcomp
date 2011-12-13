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
    ["Page Call", "
	<h2>Os melhores trabalhos feitos</h2>
	<h3>Em cada periodo</h3>", 3],
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
    <p><a title="Monitoria" href="/monitoria">Comunicação em tempo real - Video chat</a>
    </p>
  </li>
</ul>), 0],
    ["Body", "
	<div class="monitor">
  <h3>O Monitor</h3>
  <p><span class="bold">Nome:</span>Nome do monitor</p>
  <p><span class="bold">E-mail:</span>Email do monitor</p>
  <p><span class="bold">Horários da monitoria:</span>Horários da monitoria</p>
</div>

<div class="chat">
  <h3>Chat</h3>
  <p>Acesse o site abaixo para se comunicar com o monitor e os outros alunos através do chat ou do vídeo chat.</p>
  <a>Link</a>
</div>


<div class="chat">
  <h3>Fórum</h3>
  <p>Acesse o site abaixo para tirar suas dúvidas através do fórum do Conexão UFF.</p>
  <a href="https://sistemas.uff.br/conexaouff/grupos/19260/usuarios?autenticado=true">Conexão UFF</a>
</div>
	", 1],
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
    ["Page Call", "
	<h2>Principais Notícias</h2>
	<h3>Acesse e fique por dentro</h3>", 0],
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
    ["Side Body", "
	<div class="teachers">
    <h3>Professores</h3>
    
    <div class="teacher">
        <img alt="image" src="/images/about/vinod.png" />
        <h4>Vinod Rebello (Ph.D Univ. of Edinburgh)</h4>
        <h5>Areas de interesse:</h5>
        <p>Escalonamento de Tarefas em Multicomputadores, Aplicações Adaptativas, Computação em grades(grids) e Arquitetura de Computadores.</p>
        <h5>E-mail:</h5>
        <p>vinod@ic.uff.br</p>
    </div>

    <div class="teacher">
        <img alt="image" src="/images/about/boeres.png" />
        <h4>Maria Cristina S. Boeres (Ph.D Univ. of Edinburgh)</h4>
        <h5>Areas de interesse:</h5>
        <p>Escalonamento de Tarefas em Multicomputadores, Tolerância a falhas, Modelos de Computação Paralela e Heurísticas.</p>
        <h5>E-mail:</h5>
        <p>boeres@ic.uff.br</p>
    </div>
</div>

<div class="chapters">
 <h3>Ementa do Curso</h3>
    <ul>
        <li>Capítulo 1: 
                <ul>
                        <li>1.1</li>
                        <li>1.2</li>
                        <li>1.3</li>
                        <li>1.4</li>
                        <li>1.5</li>
                </ul>
        </li>
        <li>Capítulo 2:
                <ul>
                    <li> 2.1
                        <ul>
                            <li>2.1.1</li>
                            <li>2.1.2</li>
                            <li>2.1.3</li>
                        </ul>
                    </li>
                    <li>2.2
                            <ul>
                                <li>2.2.1</li>
                                <li>2.2.2</li>
                                <li>2.2.3</li>
                            </ul>
                    </li>
                </ul>
        </li>
        <li>Capítulo 3: 
                <ul>
                        <li>3.1</li>
                        <li>3.2</li>
                        <li>3.3</li>
                        <li>3.4</li>
                        <li>3.5</li>
                </ul>
        </li>
</ul>
<ul>
        <li>Capítulo 4:
                <ul>
                    <li> 4.1
                        <ul>
                            <li>4.1.1</li>
                            <li>4.1.2</li>
                            <li>4.1.3</li>
                            <li>4.1.4</li>
                        </ul>
                    </li>
                    <li>4.2
                        <ul>
                             <li>4.2.1</li>
                            <li>4.2.2</li>
                        </ul>
                    </li>
                    <li> 4.3
                        <ul>
                            <li>4.3.1</li>
                            <li>4.3.2</li>
                            <li>4.3.3</li>
                        </ul>
                    </li>
                    <li> 4.4
                        <ul>
                            <li>4.4.1</li>
                            <li>4.4.2</li>
                            <li>4.4.3</li>
                            <li>4.4.4</li>
                            <li>4.4.5</li>
                        </ul>
                    </li>
                </ul>
        </li>
</ul>
<ul>
 <li>Capítulo 5:
                <ul>
                    <li>5.1
                        <ul>
                            <li>5.1.1</li>
                            <li>5.1.2</li>
                        </ul>
                    </li>
                    <li>5.2
                        <ul>
                             <li>5.2.1</li>
                            <li>5.2.2</li>
                            <li>5.2.3</li>
                            <li>5.2.4</li>
                            <li>5.2.5</li>
                            <li>5.2.6</li>
                        </ul>
                    </li>
                    <li> 5.3
                        <ul>
                            <li>5.3.1</li>
                            <li>5.3.2</li>
                            <li>5.3.3</li>
                            <li>5.3.4</li>
                            <li>5.3.5</li>
                            <li>5.3.6</li>
                            <li>5.3.7</li>
                        </ul>
                    </li>
                    <li>5.4
                        <ul>
                            <li>5.4.1</li>
                        </ul>
                    </li>
                </ul>
        </li>
    </ul>

<a title="Sumario" href="/system/resources/BAhbBlsHOgZmSSIoMjAxMS8xMi8xMy8wMl8zNF8yOV8yMjRfU3VtYXJpby5wZGYGOgZFVA/Sumario.pdf"><span class="bold">Livro texto:</span> Organização de Computadores - A. Tanembaum 5ta edição</a>

<a href="http://www.karbosguide.com/books/pcarchitecture/start.htm"><span class="bold">Livro adicional:</span> PC Architecture. A book by Michael B. Karbo</a>
</div>
	", 1],
    ["Page Call", "
	<h2>Veja toda informação</h2>
	<h3>Disciplina, professores e site</h3>", 2],
  ], {
    :title => 'Disciplina',
    :deletable => true,
    :position => 5
  }
)

puts '-Conteúdo'
criar_pagina(
  [
    ["Page Call", "
	<h2>Todo conteúdo dado em sala</h2>
	<h3>De maneira bem explicativa</h3>", 0],
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
    ["Page Call", "
	<h2>Os melhores trabalhos feitos</h2>
	<h3>Em cada periodo</h3>", 0],
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
    ["Page Call", "
	<h2>Informações sobre o monitor</h2>
	<h3>Acesse chat, fóruns e vídeo-chats</h3>", 2],
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
"
<div class="about">
    <h3>Sobre o site</h3>

    <p>Este site tem por objetivo apresentar a matéria Arquitetura de Computadores 2 de uma maneira dinâmica e com uma linguagem mais próxima dos alunos que cursam a disciplina.</p>

    <p>O conteúdo foi baseado no site feito em uma versão anterior pelos alunos Carol Cruz, João Gouveia e Rafael Moulin, e posteriormente finalizado por Maria Gabriela de Alcântara utilizando a internet e livros como fontes de pesquisa.</p>

    <p>A última versão do site foi feita no segundo periodo de 2011, como projeto final da disciplina, pelos alunos João Felipe, Guilherme Rangel, Lucas Nadalutti, Luis Vieira e Marcelle Guiné.</p>

    <p>Aqui você encontrará, além de informações sobre o curso, datas de provas, informações sobre os professores e resumos de capítulos, animações, vídeos, imagens e também bons textos, enfim tudo para melhorar o entendimento de como é organizado um computador e sua estrutura.</p>

    <p>Uma nova funcionalidade do site é a interação com o monitor da disciplina através de fóruns, chats e vídeo-chats.</p>
</div>
", 0],
    ["Page Call", "
	<h2>Informações sobre a elaboração</h2>
	<h3>Do site de Arquitetura de Computadores</h3>", 1],
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
    ["Page Call", "
	<h2>Todos os eventos</h2>
	<h3>Marcados pelo professor</h3>", 0],
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
    ["Page Call", "
	<h2>Todo conteúdo dado em sala</h2>
	<h3>De maneira bem explicativa</h3>", 0],
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
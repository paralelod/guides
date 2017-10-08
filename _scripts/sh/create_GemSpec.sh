
echo "🐙 \033[1;34m Criando Gemspec para $theme \033[0m"

# cria o arquivo inicial para ser editado

echo "
Gem::Specification.new do |spec|
  spec.name          = '$theme'
" >> ./_theme/$theme/$theme.gemspec


# append o resto arquivo em separado para evitar bugs de caracteres
# nesse caso regexp nao funciona na conversão

cat >> ./_theme/$theme/$theme.gemspec <<- 'EOF'
    spec.version       = '0.0.0'
    spec.authors       = ['Diogo Russo']
    spec.email         = ['hello_diogorusso@gmail.com']
  
    spec.summary       = %q{Oh Sorte!!!!!.}
    spec.description   = 'Diogo from BRazil, nice to meet you you hope you hace fun, hey ho!!!!'
    spec.homepage      = 'https://hello.diogorusso.com'
    spec.license       = 'MIT'
  
    spec.metadata["plugin_type"] = "theme"

    spec.files         = `git ls-files -z`.split("\x0").select do |f|
      f.match(%r{^(assets|_(includes|layouts|sass)/|(LICENSE|README)((\.(txt|md|markdown)|$)))}i)
    end
    spec.bindir        = "exe"
    spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  
    spec.add_runtime_dependency "jekyll", "~> 3.3"

    spec.add_development_dependency "bundler", "~> 1.12"
    spec.add_development_dependency "rake", "~> 10.0"
  end
EOF

# converte ASCII para UTF8
file -I ./_theme/$theme/$theme.gemspec
echo "encoding "src/_theme/$theme/$theme.gemspec" ("us-ascii") to utf-8"
O desafio consiste em desenvolver um aplicativo iOS usando Swift, UIKit e View Code, que exibirá a tela inicial da Digio Store com um carrossel de produtos e uma tela de detalhes para exibir detalhes do produto selecionado. O aplicativo deverá consumir dados de um serviço fornecido.

A seguir como eu planejei abordar o desafio proposto:

1. Configuração do projeto:
   - Criar um novo projeto no Xcode usando Swift e UIKit.
   - Definir o Deployment Target como iOS 12.
   - Configurar o SwiftLint para garantir a conformidade com as diretrizes de estilo de código.
   - Configurar o Fastlane para facilitar a automação de tarefas como build e testes.

2. Consumo do serviço:
   - Usar a URLSession para fazer uma solicitação HTTP GET para a URL fornecida: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products".
   - Tratar os possíveis erros durante a solicitação e o parsing dos dados usando o Codable.
   - Armazenar os dados recebidos em estruturas de dados apropriadas para representar os produtos.

3. Design da Home:
   - Criar uma UIViewController para a tela inicial.
   - Adicionar uma UIImageView para exibir o ícone da Digio Store.
   - Adicionar um UILabel para exibir a mensagem de boas-vindas ao usuário.
   - Implementar um carrossel de produtos em destaque usando um UICollectionView.
   - Carregar os dados dos produtos destacados e exibi-los no carrossel.

4. Design da tela de detalhes do produto:
   - Criar uma UIViewController para a tela de detalhes do produto.
   - Ao selecionar um produto na tela inicial, navegar para a tela de detalhes e exibir imagem, nome e descrição do produto.

5. Arquitetura MVVM:
   - Organizar o código seguindo o padrão de arquitetura MVVM (Model-View-ViewModel).
   - Separar as responsabilidades de exibição da interface (View) e lógica de negócios (ViewModel).
   - Utilizar bindings para sincronizar os dados entre a View e o ViewModel.
   - Implementar a lógica de busca e atualização de dados no ViewModel.

6. Testes:
   - Escrever testes unitários para verificar o comportamento correto do aplicativo.
   - Testar o consumo do serviço, parsing dos dados e funcionalidades específicas.

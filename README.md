# Controle de Leitura

Aplicativo mobile desenvolvido em Flutter como projeto avaliativo da disciplina. O objetivo é simular um sistema de controle de leitura pessoal, permitindo que o usuario se cadastre, realize login e visualize os ultimos livros lidos vinculados a sua conta.

---

## Funcionalidades implementadas

- Cadastro de novos usuarios com nome, email e senha
- Validacao de campos em todas as telas
- Bloqueio de emails duplicados no cadastro
- Login com validacao de credenciais
- Exibicao de boas-vindas personalizada com o nome do usuario logado
- Lista dos ultimos 5 livros lidos (exclusiva para o usuario Otavio)
- Tela Home sem possibilidade de voltar ao login pelo botao de hardware
- Botao de sair da conta na tela Home
- Tema escuro com cores preto e vermelho em todas as telas

---

## Descricao das telas

### Tela de Cadastro (`cadastro_screen.dart`)

Primeira tela exibida ao abrir o aplicativo. Contem os campos Nome, Email e Senha com validacoes individuais. Ao clicar em Cadastrar, o sistema verifica se o email ja esta em uso e, em caso negativo, adiciona o novo usuario a lista estatica compartilhada. Apos o cadastro bem-sucedido, o usuario e redirecionado automaticamente para a tela de Login. Novos usuarios cadastrados nao possuem livros lidos associados.

### Tela de Login (`login_screen.dart`)

Permite que o usuario acesse sua conta informando email e senha. As credenciais sao validadas contra a lista de usuarios cadastrados. Em caso de sucesso, o usuario e redirecionado para a tela Home com seu nome passado como argumento de rota. Em caso de falha, uma mensagem de erro e exibida via SnackBar.

### Tela Home (`home_screen.dart`)

Exibe uma mensagem de boas-vindas personalizada com o nome do usuario logado. Se o usuario for Otavio, a lista com os ultimos 5 livros lidos e exibida em cards numerados, cada um mostrando titulo e autor. Para os demais usuarios, a tela exibe uma mensagem indicando que nenhum livro foi registrado. A navegacao de retorno ao login pelo botao de hardware e bloqueada via `PopScope`. Ha um botao Sair da Conta que redireciona manualmente para o Login.

---

## Conta com livros cadastrados

Para visualizar a lista de livros lidos, utilize as seguintes credenciais no Login:

```
Email: otavio@email.com
Senha: 123456
```

Somente o usuario **Otavio** possui livros associados. Qualquer outro usuario cadastrado pelo app vera a tela Home sem livros listados.

Os livros exibidos sao:

| # | Titulo | Autor |
|---|--------|-------|
| 1 | Contos de Horror da Mimi | Junji Ito |
| 2 | Eu, Robo | Isaac Asimov |
| 3 | Androides Sonham com Ovelhas Eletricas? | Philip K. Dick |
| 4 | Meridiano de Sangue | Cormac McCarthy |
| 5 | I Have No Mouth, and I Must Scream | Harlan Ellison |

---

## Conceitos utilizados

**Dart**
Linguagem principal do projeto. Utilizada para toda a logica de validacao, manipulacao de listas e controle de fluxo.

**Flutter Widgets**
A interface foi construida com widgets nativos do Flutter: `Scaffold`, `Column`, `ListView.builder`, `TextFormField`, `ElevatedButton`, `TextButton`, `Container`, `Row`, `Expanded`, `SingleChildScrollView` e `SafeArea`.

**StatefulWidget e setState**
As telas de Cadastro e Login utilizam `StatefulWidget` com `setState` para controlar a visibilidade da senha em tempo real.

**StatelessWidget**
A tela Home e o widget `_LivroCard` sao implementados como `StatelessWidget`, pois nao possuem estado mutavel proprio.

**Gerenciamento de estado com static**
A lista de usuarios e declarada como `static final` dentro do `CadastroScreen`, tornando-a acessivel de qualquer tela sem necessidade de bibliotecas externas.

**Navigator e rotas nomeadas**
A navegacao entre telas utiliza rotas nomeadas definidas no `MaterialApp` (`/cadastro`, `/login`, `/home`). `Navigator.pushReplacementNamed` e usado para impedir que o usuario volte para telas anteriores pelo historico de navegacao.

**Passagem de argumentos entre rotas**
O nome do usuario logado e passado da tela de Login para a tela Home via `arguments` do `Navigator`, e recuperado com `ModalRoute.of(context)!.settings.arguments`.

**PopScope**
Utilizado na tela Home para bloquear o botao de voltar do dispositivo, impedindo que o usuario retorne ao Login sem clicar explicitamente em Sair da Conta.

**Form e GlobalKey**
Cada tela com formulario utiliza um `GlobalKey<FormState>` para controlar e disparar a validacao de todos os campos de uma vez com `_formKey.currentState!.validate()`.

**ThemeData**
O tema global do aplicativo e configurado no `main.dart` com `ThemeData`, definindo cores, bordas, estilos de botao e campos de texto de forma centralizada para todas as telas.

---

## Estrutura do projeto

```
lib/
├── main.dart
└── screens/
    ├── cadastro_screen.dart
    ├── login_screen.dart
    └── home_screen.dart
```

---

## Instrucoes para executar o projeto localmente

**Pre-requisitos**

- Flutter SDK instalado (versao 3.0.0 ou superior)
- Dart SDK incluso na instalacao do Flutter
- Android Studio ou VS Code com a extensao Flutter instalada
- Um emulador Android/iOS configurado ou um dispositivo fisico conectado

**Passo a passo**

1. Clone ou baixe o repositorio na sua maquina:

```bash
git clone https://github.com/seu-usuario/controle-leitura.git
cd controle-leitura
```

2. Instale as dependencias do projeto:

```bash
flutter pub get
```

3. Verifique se ha um dispositivo disponivel:

```bash
flutter devices
```

4. Execute o aplicativo:

```bash
flutter run
```

Para rodar especificamente no Windows:

```bash
flutter run -d windows
```

Para rodar em um dispositivo Android conectado:

```bash
flutter run -d android
```

**Observacao:** nao e necessario configurar nenhum backend, banco de dados ou variaveis de ambiente. O projeto roda localmente de forma completa sem dependencias externas.
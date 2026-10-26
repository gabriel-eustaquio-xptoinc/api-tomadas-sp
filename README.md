# API REST para Controle de Tomadas Wi‑Fi via Home Assistant

## Visão Geral

Este projeto disponibiliza uma API REST para controle de tomadas Wi‑Fi integradas ao Home Assistant através da plataforma Tuya.

A solução foi criada para abstrair a complexidade do Home Assistant, oferecendo endpoints HTTP simples que podem ser consumidos por qualquer aplicação capaz de realizar requisições REST.

A API permite:

- Ligar tomadas
- Desligar tomadas
- Consultar informações dos dispositivos
- Centralizar o controle dos dispositivos em uma única interface REST
- Integrar dispositivos IoT a aplicações web

---

# Arquitetura

```text
Aplicação Cliente
       |
       v
    API REST
       |
       v
 Home Assistant
       |
       v
      Tuya
       |
       v
 Tomadas Wi‑Fi
```

---

# Objetivo

A API atua como intermediária entre aplicações externas e o Home Assistant.

Em vez de acessar diretamente o Home Assistant, os sistemas consomem os endpoints expostos pela API, que é responsável por:

- Receber as requisições HTTP
- Validar parâmetros
- Executar comandos no Home Assistant
- Acionar dispositivos cadastrados
- Retornar respostas em formato JSON

---

# Tecnologias Utilizadas

- Python
- REST API
- Home Assistant
- Tuya
- JSON
- Linux

---

# Funcionamento

Quando uma requisição é enviada para a API:

1. O endpoint recebe a solicitação.
2. A API interpreta os parâmetros recebidos.
3. O Home Assistant executa a ação correspondente.
4. O dispositivo recebe o comando.
5. A API retorna o resultado da operação.

Fluxo resumido:

```text
Cliente
   |
POST /endpoint
   |
API
   |
Home Assistant
   |
Tuya
   |
Tomada
```

---

# Estrutura do Projeto

```text
api-tomadas/
│
├── __pycache__/
├── api.log
├── api_tomada.py
├── iniciar_api.sh
├── tomadas.json
└── tomadas.sqlite3
```

### Descrição dos Arquivos

#### api_tomada.py

Arquivo principal da API.

Responsável por:

- Receber as requisições HTTP
- Processar os comandos
- Comunicar com o Home Assistant
- Retornar respostas JSON

#### tomadas.json

Arquivo de configuração utilizado pela aplicação para mapear dispositivos e parâmetros utilizados pela API.

#### tomadas.sqlite3

Banco de dados SQLite utilizado pela aplicação para armazenamento local de informações necessárias ao funcionamento da API.

#### api.log

Arquivo de log contendo informações de execução, erros e operações realizadas pela API.

#### iniciar_api.sh

Script responsável pela inicialização da API.

Pode ser utilizado manualmente ou configurado para execução automática durante a inicialização do sistema operacional.

---

# API REST

Todos os retornos da API utilizam JSON.

A lista completa dos endpoints e exemplos de utilização encontra-se no documento:

```text
Requisições da api-tomadas.docx
```

Este documento contém:

- URLs disponíveis
- Métodos HTTP suportados
- Parâmetros necessários
- Exemplos de requisição
- Exemplos de resposta
- Casos de uso

---

# Exemplo de Consumo da API
# LEIA O ARQUIVO SOBRE REQUISIÇÕES DA API-TOMADAS.docx

## Ligar Tomada

```bash
curl -X POST http://SERVIDOR/ENDPOINT
```

---

## Desligar Tomada

```bash
curl -X POST http://SERVIDOR/ENDPOINT
```

---

# Inicialização do Serviço

## Execução Manual

```bash
cd ~/api-tomadas
python3 api_tomada.py
```

---

## Execução pelo Script

```bash
chmod +x iniciar_api.sh
./iniciar_api.sh
```

---

# Segurança

As credenciais utilizadas pela integração são armazenadas separadamente dos arquivos da aplicação.

Recomendações:

- Não armazenar tokens diretamente no código.
- Limitar o acesso aos arquivos de configuração.
- Restringir o acesso à API através de firewall.
- Utilizar HTTPS quando a API estiver acessível externamente.
- Revisar periodicamente credenciais e tokens de acesso.

---

# Logs e Diagnóstico

Verificar processos da API:

```bash
ps aux | grep api_tomada
```

Verificar portas em uso:

```bash
sudo lsof -i
```

Acompanhar logs da aplicação:

```bash
tail -f api.log
```

Verificar conectividade com o Home Assistant:

```bash
curl http://IP_HOME_ASSISTANT:8123
```

---

# Dependências

Para execução da API é necessário possuir:

- Python 3
- Acesso ao Home Assistant
- Integração Tuya configurada
- Conectividade de rede entre a API e o Home Assistant

---

# Casos de Uso

- Controle remoto de tomadas Wi‑Fi
- Automação residencial
- Automação corporativa
- Acionamento remoto de dispositivos
- Integração de aplicações com dispositivos IoT
- Centralização de comandos através de uma API REST

---

# Resumo

Esta API fornece uma camada REST simples sobre o Home Assistant para gerenciamento de tomadas Wi‑Fi integradas ao Tuya. O projeto centraliza o controle dos dispositivos e disponibiliza endpoints HTTP padronizados para acionamento das tomadas, permitindo integração com qualquer sistema capaz de consumir serviços REST.
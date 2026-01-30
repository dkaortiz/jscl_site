# Checklist de Conversão PHP → Node.js + Prisma

Este documento lista todas as páginas PHP do projeto, com um breve resumo do propósito de cada uma, funções principais e status de conversão/adaptação para Node.js + Prisma.

## Legenda de Status
- [ ] Não iniciado
- [~] Em andamento
- [x] Finalizado

---

## Páginas PHP

- [ ] adicionar-coluna-unidade.php — Adiciona coluna de unidade na base de dados.
- [ ] adicionar-colunas-membros.php — Adiciona colunas extras na tabela de membros.
- [ ] adicionar-cpf-membros.php — Adiciona campo de CPF para membros.
- [ ] adicionar-observacoes.php — Adiciona campo de observações para membros.
- [ ] adicionar-pedido-bencao.php — Adiciona pedidos de bênção.
- [ ] aprovar-rejeitar-membro.php — Aprova ou rejeita membros.
- [ ] avisos-admin.php — Gerenciamento de avisos pelo admin.
- [ ] cadastro-membro.php — Cadastro e edição de membros.
- [ ] config-igreja.php — Configurações específicas da igreja.
- [ ] config.php — Configuração e conexão com banco de dados, autenticação.
- [ ] criar-tabela-avisos.php — Criação da tabela de avisos.
- [ ] criar-tabelas-ministerios.php — Criação das tabelas de ministérios.
- [ ] dashboard-membros-simples.php — Dashboard simplificado de membros.
- [ ] dashboard-membros.php — Dashboard detalhado de membros.
- [ ] dashboard.php — Dashboard principal do sistema.
- [ ] debug-dashboard.php — Dashboard para debug.
- [ ] deletar-aviso.php — Deleta avisos.
- [ ] deletar-unidade.php — Deleta unidade.
- [ ] diagnostico-email.php — Diagnóstico de envio de e-mails.
- [ ] editar-unidade.php — Edição de unidade.
- [ ] enviar-avisos.php — Envio de avisos para membros.
- [ ] enviar-resposta-oracao.php — Envio de resposta para pedidos de oração.
- [ ] executar-migracao-colunas.php — Executa migração de colunas.
- [ ] executar-migracao-completa.php — Executa migração completa do banco.
- [ ] executar-migracao.php — Executa migração simples.
- [ ] exportar-membros.php — Exporta dados de membros.
- [ ] exportar-oracoes.php — Exporta pedidos de oração.
- [ ] funcoes-email.php — Funções utilitárias para envio de e-mails.
- [ ] garantir-cpf-unique.php — Garante unicidade do CPF.
- [ ] gerador_hash.php — Gera hash para senhas ou tokens.
- [ ] gerar-ficha-html.php — Gera ficha de membro em HTML.
- [ ] gerar-pdf-membro.php — Gera ficha de membro em PDF.
- [ ] gerenciar-ministerios-acoes.php — Gerencia ministérios e ações sociais.
- [ ] gerenciar-pedido-bencao.php — Gerencia pedidos de bênção.
- [ ] gerenciar-status-membro.php — Gerencia status dos membros.
- [ ] gerenciar-usuarios.php — Gerencia usuários do sistema.
- [ ] imprimir-ficha-membro.php — Imprime ficha de membro.
- [ ] imprimir-ficha-unidade.php — Imprime ficha de unidade.
- [ ] index.php — Página inicial, exibe unidades, ministérios, ações sociais.
- [ ] listar-membros-teste.php — Lista de membros para teste.
- [ ] login.php — Tela de login.
- [ ] logout.php — Logout do sistema.
- [ ] marcar-aviso-lido.php — Marca aviso como lido.
- [ ] marcar-oracao-respondida.php — Marca oração como respondida.
- [ ] migrar-pedido-bencao.php — Migração de pedidos de bênção.
- [ ] migrar-status-membros.php — Migração de status dos membros.
- [ ] nova-unidade.php — Cadastro de nova unidade.
- [ ] novo-pedido.php — Cadastro de novo pedido de oração.
- [ ] obter-html-ficha.php — Obtém HTML da ficha de membro.
- [ ] painel-membro-avisos.php — Painel de avisos para membros.
- [ ] pedidos-oracao.php — Gerenciamento de pedidos de oração.
- [ ] remover-pedido-bencao.php — Remove pedido de bênção.
- [ ] salvar-inscricao.php — Salva inscrição de membro.
- [ ] salvar-oracao.php — Salva pedido de oração.
- [ ] setup-pedidos-visitantes.php — Setup para pedidos de visitantes.
- [ ] setup-tcpdf.php — Setup da biblioteca TCPDF.
- [ ] setup_dias_cultos.php — Setup de dias de cultos.
- [ ] sincronizar-whatsapp.php — Sincroniza dados de WhatsApp.
- [ ] sistema-avisos-resumo.html — Resumo do sistema de avisos.
- [ ] testar-email-membro.php — Teste de envio de e-mail para membro.
- [ ] teste-desligamento.php — Teste de desligamento de membro.
- [ ] teste-email-direto.php — Teste de envio de e-mail direto.
- [ ] teste-fluxo-completo.php — Teste de fluxo completo do sistema.
- [ ] teste-inativar-membro.php — Teste de inativação de membro.
- [ ] teste-oracao.php — Teste de pedidos de oração.
- [ ] teste-session-membro.php — Teste de sessão de membro.
- [ ] teste-unidade-cadastro.php — Teste de cadastro de unidade.
- [ ] teste-unidades.php — Teste de unidades.
- [ ] verificar-avisos.php — Verifica avisos pendentes.
- [ ] verificar-estrutura-membros.php — Verifica estrutura da tabela membros.
- [ ] verificar-oracao.php — Verifica pedidos de oração.
- [ ] visualizar-carta-recomendacao.php — Visualiza carta de recomendação.
- [ ] visualizar-emails-salvos.php — Visualiza e-mails salvos.
- [ ] visualizar-oracoes.php — Visualiza pedidos de oração.

---

> Atualize o status conforme for convertendo/adaptando cada página/função.

---

## Observações
- Funções utilitárias e fluxos principais serão detalhados conforme avançar a conversão.
- Este checklist será atualizado a cada etapa concluída.

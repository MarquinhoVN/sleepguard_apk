# SleepGuard - Aplicativo de Monitoramento de Padrão de Sono

**SleepGuard** é um aplicativo para monitoramento de padrões de sono de pacientes, utilizando Flutter para a interface e Firebase Realtime Database para armazenar e gerenciar os dados em tempo real.

## Funcionalidades Principais

- **Exibição de Dados de Sono**: Visualização dos dados coletados dos sensores de movimento e acelerômetro.
- **Armazenamento de Dados**: Os dados de sono são salvos e atualizados em tempo real no Firebase Realtime Database.
- **Notificações de Alerta**: Notificações enviadas quando padrões de sono anormais são detectados.
- **Controle Remoto**: A partir do aplicativo, os profissionais de saúde podem acionar os atuadores, como LEDs e buzzer, remotamente.

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento do aplicativo mobile.
- **Firebase**: Para armazenamento de dados em tempo real com Firebase Realtime Database.
- **Firebase Authentication**: Para autenticação de usuários, garantindo acesso seguro ao aplicativo.

## Funcionalidades do Aplicativo

### Visualização dos Dados
O aplicativo permite que o usuário visualize os dados de sono coletados em tempo real. Isso inclui:
- Padrões de movimento
- Alertas de distúrbios no sono
- Gráficos de monitoramento

### Armazenamento de Dados
O aplicativo usa **Firebase Realtime Database** para armazenar e sincronizar os dados de sono coletados. O sistema armazena:
- Dados de movimento e posição do paciente
- Informações sobre a qualidade do sono
- Notificações de alerta

### Notificações em Tempo Real
Sempre que um distúrbio no padrão de sono é detectado (como agitação ou ausência de movimento), o sistema envia uma notificação para o médico ou responsável, permitindo uma resposta imediata.


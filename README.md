# Little Adventure - Android build

Este repositório prepara a compilação Android do jogo **Little Adventure**, sem alterar o projeto original.

- Projeto original: https://github.com/imikado/dupotLittleAdventure
- Versão-fonte fixada: `111c7479c907df33363d8e3ca23f39d0f71cb625`
- Motor: Godot 4.7.2
- Saída esperada: APK Android de depuração, arquitetura ARM64.

## Como funciona

O GitHub Actions baixa exatamente a versão-fonte fixada do projeto original, instala o Godot 4.7.2, os templates Android e o SDK, valida/importa o projeto e tenta exportar o APK. A configuração de exportação é criada apenas durante o workflow; nenhum script, mapa, personagem, arte ou mecânica do jogo original é editado.

Quando a compilação terminar, o APK ficará disponível em **Actions → execução mais recente → Artifacts**.

## Licença

O jogo original declara licença GNU LGPL 2.1. Consulte o arquivo LICENSE no repositório original e verifique os avisos/licenças dos recursos de terceiros antes de redistribuir o jogo ou o APK.

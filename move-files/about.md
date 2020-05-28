# unzip&mv VS cp -R

## Sobre a dúvida do unzip&mv vs o cp -R

A dúvida surgiu ao analisar um script que atualiza alguns arquivos no servidor, basicamente pega um arquivo zipado, descompacta e os movia. Como o processo é realizado inumeras vezes, surgiu a dúvida se não seria melhor descompactar somente uma vez, e copiar os arquivos para seus respectivos diretórios.

Um colega levantou um ponto interessante, o copiar os arquivos pode ser mais custoso do que descompactar e mover, aparentemente o mv apenas deve mudar o endereço de memória dos arquivos ou algo assim.

Encontramos um cenário parecido no [viva o linux](https://www.vivaolinux.com.br/topico/Duvidas-em-Geral/Descompactar-e-mais-rapido-que-copiar-e-colar)

Também encontramos a resposta sobre a velocidade superior em mover o arquivo [aqui](https://littleoak.wordpress.com/2009/02/19/quem-e-mais-rapido-o-mv-ou-cp-para-manipular-um-arquivo-de-um-lugar-para-outro/)

## Preparação do ambiente de testes

Para fazer o teste criei minha versão do script com a mesma funcionalidade, assim consegui testar, medir e comparar os tempos.

Testei movendo um zip de 303.36 MB

criei dois métodos, um da unzip e move 'n' vezes, o outro da unzip uma vez só e copia os arquivos 'n' vezes

## Resultados dos testes

Inicialmente coloquei pra rodar uma vez só temos os tempos:

MOVENDO
Tempo de execucao: 29 segundos

COPIANDO
Tempo de execucao: 56 segundos

depois coloquei pra rodar 15 vezes, fazendo semelhante ao cenário que temos.

MOVENDO
Tempo de execucao: 447 segundos (7,45min)

COPIANDO
Tempo de execucao: 870 segundos (14,5min)

## Observação

USO %CPU
unzip 62 - ficou cravado nesses valor boa parte do tempo
cp 12 ~ 20 - ficou variando entre esses valores maior parte do tempo, teve picos onde o máximo que chegou foi de 50%

**Atenção dados Analisados com base no Olhomêtro!**

## Conclusão

Pelo que vi usar o unzip&mv é mais rápido porém é mais custoso em termos de processamento, e o cp -R é mais lento e usa menos processamento. Neste caso é necessário analisar o cenário em que se encontra para escolher a melhor opção
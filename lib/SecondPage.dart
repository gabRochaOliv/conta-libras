import 'package:flutter/material.dart';
import 'AtivoPage.dart';
import 'AplicacaoFinanceiraPage.dart';
import 'BalancoContabilPage.dart';
import 'BensPage.dart';
import 'CaixaPage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> terms = [
    'Aplicação Financeira',
    'Ativo',
    'Balanço Contábil ou Balanço Patrimonial',
    'Bens',
    'Caixa',
    'Capital',
    'Capital Social',
    'Cliente',
    'Compras a Prazo',
    'Compras a Vista',
    'Contabilidade',
    'Contas a Receber',
    'Crédito',
    'Custo de Mercadorias Vendidas',
    'Débito',
    'Demonstração Contábil',
    'Demonstração do Resultado do Exercício',
    'Depósito Bancário',
    'Depreciação',
    'Despesa',
    'Direito',
    'Empréstimo',
    'Estoque',
    'Fato Contábil',
    'FGTS',
    'Fornecedor',
    'ICMS',
    'Imobilizado',
    'Imposto',
    'Imposto de Renda',
    'Integralização de Capital',
    'Investimento',
    'Lucro',
    'Máquina e Equipamentos',
    'Matéria Prima',
    'Mercadoria',
    'Normas',
    'Obrigações',
    'Passivo',
    'Patrimônio Líquido',
    'Preço de Venda',
    'Prejuízo',
    'Receita ou Faturamento',
    'Salários',
    'Veículo',
    'Venda',
  ];

  late List<String> filteredTerms;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredTerms = terms;
    searchController.addListener(searchListener);
  }

  @override
  void dispose() {
    searchController.removeListener(searchListener);
    searchController.dispose();
    super.dispose();
  }

  void searchListener() {
    setState(() {
      if (searchController.text.isEmpty) {
        filteredTerms = terms;
      } else {
        String searchTerm = searchController.text.toLowerCase();
        filteredTerms = terms
            .where((term) => term.toLowerCase().contains(searchTerm))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glossário'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).appBarTheme.backgroundColor ??
                const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/Conta Libras_PNG.png', // Substitua pelo caminho da sua imagem
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    searchListener();
                  },
                ),
                hintText: 'Buscar...',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTerms.length,
              itemBuilder: (context, index) {
                if (index == 0 ||
                    filteredTerms[index][0] != filteredTerms[index - 1][0]) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 238, 240, 242),
                        width: MediaQuery.of(context).size.width / 0.1,
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 16),
                        child: Text(
                          filteredTerms[index][0],
                          style: const TextStyle(
                            fontSize: 18.4,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          filteredTerms[index],
                          style: const TextStyle(
                            fontSize: 18.2,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          // Implemente a ação ao clicar no termo
                          if (filteredTerms[index] == 'Ativo') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AtivoPage(),
                              ),
                            );
                          } else if (filteredTerms[index] ==
                              'Aplicação Financeira') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AplicacaoFinanceiraPage(),
                              ),
                            );
                          } else if (filteredTerms[index] ==
                              'Balanço Contábil ou Balanço Patrimonial') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BalancoContabilPage(),
                              ),
                            );
                          } else if (filteredTerms[index] == 'Bens') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BensPage(),
                              ),
                            );
                          } else if (filteredTerms[index] == 'Caixa') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CaixaPage(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return ListTile(
                    title: Text(
                      filteredTerms[index],
                      style: const TextStyle(
                        fontSize: 18.2,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      // Implemente a ação ao clicar no termo
                      if (filteredTerms[index] == 'Ativo') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AtivoPage(),
                          ),
                        );
                      } else if (filteredTerms[index] ==
                          'Aplicação Financeira') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AplicacaoFinanceiraPage(),
                          ),
                        );
                      } else if (filteredTerms[index] ==
                          'Balanço Contábil ou Balanço Patrimonial') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BalancoContabilPage(),
                          ),
                        );
                      } else if (filteredTerms[index] == 'Bens') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BensPage(),
                          ),
                        );
                      } else if (filteredTerms[index] == 'Caixa') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CaixaPage(),
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:juno/src/database/dao/passageiros_deslocamento_dao.dart';
import 'package:juno/src/models/passageiros_deslocamento.dart';
import 'package:juno/src/screens/rides_and_companies/ui/rides_and_companies_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/theme/colors.dart';
import '../../../database/dao/deslocamentos_dao.dart';
import '../../../database/dao/user_dao.dart';
import '../../../models/user.dart';
import '../../../models/veiculo.dart';

class DisplacementDetailsScreen extends StatefulWidget {
  final Veiculo? veiculo;
  final String municipioOrigem;
  final String municipioDestino;
  final int criadorCaronaId;
  final String criadorCaronaUserName;
  final String criadorCaronaUserPhotoUrl;
  final int? deslocamentoId;
  final int quantidadeVagas;
  final int quantidadeVagasDisponiveis;

  const DisplacementDetailsScreen(
      {super.key,
      required this.veiculo,
      required this.municipioOrigem,
      required this.municipioDestino,
      required this.criadorCaronaUserName,
      required this.criadorCaronaUserPhotoUrl,
      this.deslocamentoId,
      required this.quantidadeVagas,
      required this.quantidadeVagasDisponiveis,
      required this.criadorCaronaId});

  @override
  State<DisplacementDetailsScreen> createState() => _DisplacementDetailsScreenState();
}

class _DisplacementDetailsScreenState extends State<DisplacementDetailsScreen> {
  late int userId;
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedUserId = prefs.getInt('userId');
    if (savedUserId != null) {
      setState(() {
        userId = savedUserId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkOrange,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
                onPressed: () => Navigator.of(context).pop(),
              );
            },
          ),
          centerTitle: true,
          title: Text(
            'DETALHAMENTO DA CARONA'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(24, 18, 24, 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.municipioOrigem,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: AppColors.black,
                    ),
                    Container(padding: const EdgeInsets.all(5)),
                    Text(
                      widget.municipioDestino,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.yellow,
                      child: Icon(
                        size: 18,
                        Icons.directions_car,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          widget.criadorCaronaUserPhotoUrl,
                        )),
                    const SizedBox(width: 7),
                    Text(
                      widget.criadorCaronaUserName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Placa do Veículo",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.veiculo?.placa ?? "Não informado",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              const Text(
                                "Modelo e Cor do Veículo",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.veiculo?.modelo ?? "Não informado",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Horário de Saída",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "18:30",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              Text(
                                "Telefone de Contato",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "81 995428753",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Divider(),
                const SizedBox(height: 20),
                Text(
                  "Passageiras",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  (widget.quantidadeVagas - widget.quantidadeVagasDisponiveis).toString() + "/" + widget.quantidadeVagas.toString() + " VAGAS OCUPADAS",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 28),
                FutureBuilder<List<PassageirosDeslocamento>>(
                  future: PassageirosDeslocamentoDAO.getPassageiroDeslocamentoByDeslocamentoId(widget.deslocamentoId ?? 0),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text("Erro ao carregar dados."));
                    } else {
                      List<PassageirosDeslocamento>? people = snapshot.data;
                      final List<int> userIds = people?.map((passageirosDeslocamento) => passageirosDeslocamento.usuarioId)?.toList() ?? [];

                      return FutureBuilder<List<User>>(
                        // Use o resultado do primeiro FutureBuilder aqui para obter os dados para o segundo FutureBuilder
                        future: UserDAO.getUsers(userIds),
                        builder: (context, otherSnapshot) {
                          if (otherSnapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (otherSnapshot.hasError) {
                            return const Center(child: Text("Erro ao carregar outros dados."));
                          } else {
                            List<User>? users = otherSnapshot.data;

                            // Agora você tem acesso a ambos os resultados dos futuros e pode construir o layout com base neles.
                            return Column(
                              children: [
                                for (int i = 0; i < (users?.length ?? 0); i += 2)
                                  Row(
                                    children: [
                                      if (users != null && users.length > i)
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(users[i].imageUrl),
                                        ),
                                      const SizedBox(width: 7),
                                      if (users != null && users.length > i)
                                        Text(
                                          users[i].nome,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      const SizedBox(width: 40),
                                      if (users != null && i + 1 < (users != null ? users.length : 0))
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(users[i + 1].imageUrl),
                                        ),
                                      const SizedBox(width: 7),
                                      if (users != null && i + 1 < (users != null ? users.length : 0))
                                        Text(
                                          users[i + 1].nome,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            );
                          }
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 120),
                ElevatedButton(
                  onPressed: () {
                    bool isAdmin = userId == widget.criadorCaronaId;
                    if (isAdmin) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Cancelar Carona"),
                            content: const Text("Tem certeza que deseja cancelar a carona?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Não"),
                              ),
                              TextButton(
                                onPressed: () {
                                  print(widget.deslocamentoId);
                                  DeslocamentoDAO.delete(widget.deslocamentoId ?? 0).then((value) {
                                    print("deletou");
                                    DeslocamentoDAO.findAll().then((value) => print(value));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => RidesAndCompaniesScreen()),
                                    );
                                  });
                                },
                                child: const Text("Sim"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  ),
                  child: Text(
                    userId == widget.criadorCaronaId ? "Cancelar Carona" : 'Solicitar vaga',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

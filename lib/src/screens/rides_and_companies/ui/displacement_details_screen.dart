import 'package:flutter/material.dart';
import 'package:juno/src/database/dao/passageiros_deslocamento_dao.dart';
import 'package:juno/src/models/passageiros_deslocamento.dart';
import 'package:juno/src/screens/rides_and_companies/ui/rides_and_companies_screen.dart';
import 'package:juno/src/screens/rides_and_companies/ui/widgets/displacement_tile.dart';
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
  final String horario;
  final String telefone;
  final int? deslocamentoId;
  final int quantidadeVagas;
  late int quantidadeVagasDisponiveis;
  final VehicleType vehicleType;

  DisplacementDetailsScreen({
    super.key,
    required this.veiculo,
    required this.municipioOrigem,
    required this.municipioDestino,
    required this.criadorCaronaUserName,
    required this.criadorCaronaUserPhotoUrl,
    required this.deslocamentoId,
    required this.quantidadeVagas,
    required this.quantidadeVagasDisponiveis,
    required this.criadorCaronaId,
    required this.vehicleType,
    required this.horario,
    required this.telefone,
  });

  @override
  State<DisplacementDetailsScreen> createState() => _DisplacementDetailsScreenState();
}

class _DisplacementDetailsScreenState extends State<DisplacementDetailsScreen> {
  late int userId = 0;
  late bool isInDeslocamento = false;
  late List<User> users;
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
    var usersIds = await PassageirosDeslocamentoDAO.getPassageiroDeslocamentoByDeslocamentoId(widget.deslocamentoId ?? 0);
    if (usersIds.any((passageirosDeslocamento) => passageirosDeslocamento.usuarioId == userId)) {
      setState(() {
        isInDeslocamento = true;
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
          margin: const EdgeInsets.fromLTRB(24, 18, 24, 18),
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
                    const Icon(
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
                      backgroundColor: widget.vehicleType == VehicleType.car ? AppColors.yellow : Colors.red,
                      child: Icon(
                        size: 18,
                        widget.vehicleType == VehicleType.car
                            ? Icons.directions_car
                            : widget.vehicleType == VehicleType.motorcycle
                                ? Icons.motorcycle
                                : Icons.explore,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          widget.criadorCaronaUserPhotoUrl,
                        )),
                    const SizedBox(width: 12),
                    Text(
                      widget.criadorCaronaUserName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 7)),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Placa do Veículo",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Modelo e Cor do Veículo",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Horário de Saída",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Telefone de Contato",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey,
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
                const SizedBox(height: 10),
                Divider(thickness: 2),
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
                const SizedBox(height: 10),
                FutureBuilder<List<PassageirosDeslocamento>>(
                  future: PassageirosDeslocamentoDAO.getPassageiroDeslocamentoByDeslocamentoId(widget.deslocamentoId ?? 0),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text("Erro no getPassageiros"));
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
                            return Center(child: Text("Erro no getUsers" + otherSnapshot.error.toString()));
                          } else {
                            List<User>? users = otherSnapshot.data;
                            if (users?.any((user) => user.id == userId) == true) {
                              isInDeslocamento = true;
                            }
                            return Container(
                              width: 300,
                              height: 200,
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4),
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemCount: users?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundImage: NetworkImage(users![index].imageUrl),
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        users[index].nome,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextButton(
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
                                    DeslocamentoDAO.delete(widget.deslocamentoId ?? 0).then((value) {
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
                      } else {
                        if (isInDeslocamento) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Sair da Carona"),
                                content: const Text("Tem certeza que deseja deixar de participar da Carona?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Não"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      PassageirosDeslocamentoDAO.deleteByDeslocamentoIdAndUserId(widget.deslocamentoId ?? 0, userId).then((value) {
                                        setState(() {
                                          widget.quantidadeVagasDisponiveis++;
                                          isInDeslocamento = false;
                                        });
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: const Text("Sim"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              PassageirosDeslocamentoDAO.save(PassageirosDeslocamento(
                                usuarioId: userId,
                                deslocamentoId: widget.deslocamentoId ?? 0,
                                tipo: 0,
                              ));
                              return AlertDialog(
                                title: const Text("Entrar na Carona"),
                                content: const Text("Você está participando do deslocamento!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isInDeslocamento = true;
                                        widget.quantidadeVagasDisponiveis--;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.purple,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.fromLTRB(50, 9, 50, 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Text(
                      userId == widget.criadorCaronaId
                          ? "Cancelar"
                          : isInDeslocamento
                              ? "Sair"
                              : 'Solicitar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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

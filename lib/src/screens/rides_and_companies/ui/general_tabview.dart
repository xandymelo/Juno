import 'package:flutter/material.dart';
import 'package:juno/src/database/dao/passageiros_deslocamento_dao.dart';
import 'package:juno/src/database/dao/veiculo_dao.dart';
import 'package:juno/src/models/passageiros_deslocamento.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/theme/colors.dart';
import '../../../database/dao/deslocamentos_dao.dart';
import '../../../database/dao/endereco_dao.dart';
import '../../../database/dao/user_dao.dart';
import '../../../models/deslocamento.dart';
import '../../../models/endereco.dart';
import '../../../models/user.dart';
import '../../../models/veiculo.dart';
import '../../../utils/trucated_string.dart';
import '../models/displacement_model.dart';
import 'widgets/displacement_tile.dart';

class GeneralTabView extends StatefulWidget {
  const GeneralTabView({Key? key}) : super(key: key);

  @override
  State<GeneralTabView> createState() => _GeneralTabViewState();
}

class _GeneralTabViewState extends State<GeneralTabView> {
  List<int> filter = [0, 1, 2];
  bool meusDeslocamentos = false;
  int userId = 0;

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.black,
                      size: 24,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.purple,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.purple,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              PopupMenuButton(
                offset: const Offset(0, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: const Icon(Icons.filter_list),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () {
                      setState(() {
                        filter = [0];
                      });
                    },
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.yellow,
                          child: Icon(
                            size: 18,
                            Icons.directions_car,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Carro'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      setState(() {
                        filter = [1];
                        meusDeslocamentos = false;
                      });
                    },
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.darkOrange,
                          child: Icon(
                            size: 18,
                            Icons.motorcycle,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Moto'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      setState(() {
                        filter = [2];
                        meusDeslocamentos = false;
                      });
                    },
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.red,
                          child: Icon(
                            size: 18,
                            Icons.explore,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Companhia'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      setState(() {
                        filter = [0, 1, 2];
                        meusDeslocamentos = true;
                      });
                    },
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.purple,
                          child: Icon(
                            size: 18,
                            Icons.bookmark_added_rounded,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Meus Deslocamentos'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      setState(() {
                        filter = [0, 1, 2];
                        meusDeslocamentos = false;
                      });
                    },
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.purple,
                          child: Icon(
                            size: 18,
                            Icons.all_inbox,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Todos'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Deslocamento>>(
            initialData: const [],
            future: DeslocamentoDAO.findDeslocamentosByFilters(filter, userId, meusDeslocamentos),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  // TODO: Handle this case.
                  break;
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text('Loading'),
                      ],
                    ),
                  );
                case ConnectionState.active:
                  // TODO: Handle this case.
                  break;
                case ConnectionState.done:
                  final contacts = snapshot.data as List<Deslocamento>;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return _DeslocamentoItem(contacts[index]);
                    },
                    itemCount: contacts.length,
                  );
              }
              return const Text('Unknown Error 404');
            },
          ),
        ),
      ],
    );
  }
}

class _DeslocamentoItem extends StatelessWidget {
  final Deslocamento deslocamento;
  Endereco? enderecoOrigem;
  _DeslocamentoItem(this.deslocamento);

  Future<List<dynamic>> _getData() async {
    var enderecoOrigem = await EnderecoDAO.findByIndex(deslocamento.origemId);
    var enderecoDestino = await EnderecoDAO.findByIndex(deslocamento.destinoId);
    var passageiros = await PassageirosDeslocamentoDAO.findByDeslocamentoId(deslocamento.id ?? 0);
    var veiculo = deslocamento.veiculoId == null ? null : await VeiculoDAO.findById(deslocamento.veiculoId);

    return [enderecoOrigem, enderecoDestino, passageiros, veiculo];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          final List<dynamic> results = snapshot.data as List<dynamic>;
          final Endereco enderecoOrigem = results[0];
          final Endereco enderecoDestino = results[1];
          final PassageirosDeslocamento passageiroDeslocamento = results[2];
          final Veiculo? veiculo = results[3];

          return FutureBuilder<User>(
            future: UserDAO.getUserById(passageiroDeslocamento?.usuarioId as int),
            builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
              if (userSnapshot.hasData) {
                final User user = userSnapshot.data as User;

                final String locationName = enderecoOrigem?.municipio ?? "Not Found";
                const int maxLength = 10;
                final String truncatedLocationName = locationName.length > maxLength ? "${locationName.substring(0, maxLength)}..." : locationName;
                return DisplacementTile(
                    displacementModel: DisplacementModel(
                        locationName: truncatedLocationName,
                        personName: user?.nome ?? "deu errado",
                        personAvatarUrl: user?.imageUrl ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                        hour: deslocamento.horaSaida,
                        vacancies: deslocamento.vagasDisponiveis,
                        actionType: passageiroDeslocamento.tipo == 0 ? ActionType.manage : ActionType.edit,
                        vehicleType: veiculo == null
                            ? VehicleType.explore
                            : veiculo.tipo == 0
                                ? VehicleType.car
                                : VehicleType.motorcycle,
                        veiculo: veiculo,
                        municipioDestino: truncateString(enderecoDestino.municipio, 10),
                        municipioOrigem: truncateString(enderecoOrigem.municipio, 10),
                        CriadorCaronaUserName: user.nome,
                        DeslocamentoId: deslocamento.id ?? 0,
                        QuantidadeVagas: deslocamento.vagas,
                        QuantidadeVagasDisponiveis: deslocamento.vagasDisponiveis,
                        criadorCaronaId: user.id));
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

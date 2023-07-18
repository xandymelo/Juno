import 'package:flutter/material.dart';
import 'package:juno/src/database/dao/passageiros_deslocamento_dao.dart';
import 'package:juno/src/models/passageiros_deslocamento.dart';

import '../../../app/theme/colors.dart';
import '../../../database/dao/deslocamentos_dao.dart';
import '../../../database/dao/endereco_dao.dart';
import '../../../database/dao/user_dao.dart';
import '../../../models/deslocamento.dart';
import '../../../models/endereco.dart';
import '../../../models/user.dart';
import '../models/displacement_model.dart';
import 'widgets/displacement_tile.dart';

class GeneralTabView extends StatelessWidget {
  const GeneralTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Icon(Icons.filter_list),
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {},
                  child: Row(
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
                      const SizedBox(width: 10),
                      Text('Carro'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: Row(
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
                      const SizedBox(width: 10),
                      Text('Moto'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: Row(
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
                      const SizedBox(width: 10),
                      Text('Companhia'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: Row(
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
                      const SizedBox(width: 10),
                      Text('Meus Deslocamentos'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: FutureBuilder<List<Deslocamento>>(
            initialData: const [],
            future: DeslocamentoDAO.findAll(),
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        EnderecoDAO.findByIndex(deslocamento.origemId),
        PassageirosDeslocamentoDAO.findByDeslocamentoId(deslocamento.id),
      ]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          final List<dynamic> results = snapshot.data as List<dynamic>;
          final Endereco enderecoOrigem = results[0];
          final PassageirosDeslocamento passageiroDeslocamento = results[1];

          return FutureBuilder<User>(
            future:
                UserDAO.getUserById(passageiroDeslocamento?.usuarioId as int),
            builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
              if (userSnapshot.hasData) {
                final User user = userSnapshot.data as User;
                final String locationName =
                    enderecoOrigem?.municipio ?? "Not Found";
                const int maxLength = 10;
                final String truncatedLocationName =
                    locationName.length > maxLength
                        ? "${locationName.substring(0, maxLength)}..."
                        : locationName;

                return DisplacementTile(
                  displacementModel: DisplacementModel(
                    locationName: truncatedLocationName,
                    personName: user?.nome ?? "deu errado",
                    personAvatarUrl:
                        "https://comidainvisivelstorage.blob.core.windows.net/comidainvisivelpublic/myfoto.png",
                    hour: "12:00",
                    vacancies: deslocamento.vagasDisponiveis,
                    actionType: ActionType.manage,
                    vehicleType: VehicleType.car,
                  ),
                );
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

// Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: AppColors.purple,
//                         width: 2,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: AppColors.purple,
//                       ),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 12),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.filter_list,
//                   size: 32,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const Divider(),
//         Flexible(
//           child: ListView.separated(
//             shrinkWrap: true,
//             itemCount: generalDisplacementsMock.length,
//             separatorBuilder: (context, index) => const Divider(),
//             itemBuilder: (context, index) => DisplacementTile(
//               displacementModel: DisplacementModel(
//                 locationName: generalDisplacementsMock[index].locationName,
//                 personName: generalDisplacementsMock[index].personName,
//                 personAvatarUrl: generalDisplacementsMock[index].personAvatarUrl,
//                 hour: generalDisplacementsMock[index].hour,
//                 vacancies: generalDisplacementsMock[index].vacancies,
//                 actionType: generalDisplacementsMock[index].actionType,
//                 vehicleType: generalDisplacementsMock[index].vehicleType,
//               ),
//             ),
//           ),
//         ),
//         const Divider(),
//       ],
//     );

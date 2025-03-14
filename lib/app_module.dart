import 'package:flutter_modular/flutter_modular.dart';
import 'package:ordem_servico/modules/login/data/datasources/local/login_datasource_local_impl.dart';
import 'package:ordem_servico/modules/login/data/repositories/login_repository_impl.dart';
import 'package:ordem_servico/modules/login/page/bloc/login_cubit.dart';
import 'package:ordem_servico/modules/login/page/login_page.dart';

import 'modules/ordem_servico/data/datasources/local/ordem_servico_datasource_local_impl.dart';
import 'modules/ordem_servico/data/repositories/ordem_servico_repository_impl.dart';
import 'modules/ordem_servico/page/bloc/ordem_servico_cubit.dart';
import 'modules/ordem_servico/page/ordem_servico_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
      i.addSingleton<LoginDatasourceLocalImpl>(() => LoginDatasourceLocalImpl());
    i.addSingleton<LoginRepositoryImpl>(() => LoginRepositoryImpl(
        loginDataSource: i.get<LoginDatasourceLocalImpl>()));
    i.addSingleton<LoginCubit>(() => LoginCubit(i.get<LoginRepositoryImpl>()));

    i.addSingleton<OrdemServicoDatasourceLocalImpl>(() => OrdemServicoDatasourceLocalImpl());
    i.addSingleton<OrdemServicoRepositoryImpl>(() => OrdemServicoRepositoryImpl(
        ordemServicoDatasource: i.get<OrdemServicoDatasourceLocalImpl>()));
    i.addSingleton<OrdemServicoCubit>(() => OrdemServicoCubit(i.get<OrdemServicoRepositoryImpl>()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/home', child: (context) => const OrdemServicoPage());
  }
}
